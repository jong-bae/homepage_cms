package com.cms.common.util;

import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.core.io.Resource;

/**
 * 
 * @ClassName RefreshableSqlSessionFactoryBean
 * @description sql 자동로더
 * @author JB
 * @since 2022. 10. 7.
 */
public class RefreshableSqlSessionFactoryBean extends SqlSessionFactoryBean implements DisposableBean {

	private static final Logger logger = LogManager.getLogger(RefreshableSqlSessionFactoryBean.class);
	
	private SqlSessionFactory proxy;
	private int interval = 1000;
	
	private Timer timer;
	private TimerTask task;
	
	private Resource[] mapperLocations;
	
	private boolean running = false;
	
	private final ReentrantReadWriteLock rwl = new ReentrantReadWriteLock();
	private final Lock rl = rwl.readLock();
	private final Lock wl = rwl.writeLock();
	
	public void setMapperLocations(Resource[] mapperLocations) {
		super.setMapperLocations(mapperLocations);
		this.mapperLocations = mapperLocations;
	}
	
	public void setInterval(int interval) {
		this.interval = interval;
	}

	public void refresh() throws Exception {
		wl.lock();
		try {
			super.afterPropertiesSet();
		} finally {
			wl.unlock();
		}
		
		logger.info("sqlMapClient refreshed.");
	}
	
	public void afterPropertiesSet() throws Exception {
		super.afterPropertiesSet();
		setRefreshable();
	}
	
	private void setRefreshable() {
		proxy = (SqlSessionFactory) Proxy.newProxyInstance(SqlSessionFactory.class.getClassLoader(), 
				new Class[] { SqlSessionFactory.class }, 
				new InvocationHandler() {
			
					@Override
					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
						return method.invoke(getParentObject(), args);
					}
			});
		
		task = new TimerTask() {
			private Map<Resource, Long> map = new HashMap<Resource, Long>();
			
			@Override
			public void run() {
				if (isModified()) {
					try {
						refresh();
					} catch(Exception e) {
						logger.error("Exception", e);
					}
				}
			}
			
			private boolean isModified() {
				boolean retVal = false;
				
				if (mapperLocations != null) {
					for (int i=0; i<mapperLocations.length; i++) {
						Resource mappingLocation = mapperLocations[i];
						retVal |= findModifiedResource(mappingLocation);
					}
				}
				
				return retVal;
			}
			
			private boolean findModifiedResource(Resource resource) {
				boolean retVal = false;
				List<String> modifiedResource = new ArrayList<String>();
				
				try {
					long modified = resource.lastModified();
					
					if (map.containsKey(resource)) {
						long lastModified = ((Long) map.get(resource)).longValue();
						
						if (lastModified != modified) {
							map.put(resource, new Long(modified));
							modifiedResource.add(resource.getDescription());
							retVal = true;
						}
					} else {
						map.put(resource, new Long(modified));
					}
				} catch (IOException ioe) {
					logger.error("IOException", ioe);
				}
				
				if (retVal) {
					logger.info("modified files : " + modifiedResource);
				}
				
				return retVal;
			}
		};
		
		timer = new Timer(true);
		resetInterval();
	}
	
	private Object getParentObject() throws Exception {
		rl.lock();
		try {
			return super.getObject();
		} finally {
			rl.unlock();
		}
	}
	
	public SqlSessionFactory getObject() {
		return this.proxy;
	}
	
	public Class<? extends SqlSessionFactory> getObjectType() {
		return (this.proxy != null ? this.proxy.getClass() : SqlSessionFactory.class);
	}
	
	public boolean isSingleton() {
		return true;
	}
	
	public void setCheckInterval(int ms) {
		interval = ms;
		
		if(timer != null) {
			resetInterval();
		}
	}
	
	private void resetInterval() {
		if (running) {
			timer.cancel();
			running = false;
		}
		if (interval > 0) {
			timer.schedule(task, 0, interval);
			running = true;
		}
	}
	
	@Override
	public void destroy() throws Exception {
		timer.cancel();
	}
}
