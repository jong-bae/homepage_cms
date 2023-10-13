package com.cms.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.sample.dao.SampleDao;
import com.cms.sample.vo.request.SampleDataRequestVO;
import com.cms.sample.vo.response.LombokResponseVO;
import com.cms.sample.vo.response.SamplePagingVO;
import com.cms.sample.vo.response.SampleResponseVO;

/**
 * 
 * @ClassName SampleService.java
 * @description 
 * @author JB
 * @since 2016. 4. 12.
 */
@Service
public class SampleService {
	
	@Autowired private SampleDao sampleDao;
	
	/**
	 * 
	 * @name getSample
	 * @description 
	 * @param 
	 * @return SampleResponseVO
	 * @author JB
	 * @since 2016. 4. 12.
	 */
	public SampleResponseVO getSample() {
		SampleResponseVO result = sampleDao.selectSampleQuery();
		return result;
	}
	
	/**
	 * 
	 * @name getLombok
	 * @description 
	 * @param 
	 * @return LombokResponseVO
	 * @author JB
	 * @since 2016. 7. 4.
	 */
	public LombokResponseVO getLombok() {
		LombokResponseVO result = sampleDao.selectLombokQuery();
		return result;
	}
	
	/**
	 * 
	 * @name taskService
	 * @description sampleService가 호출만 되어도 스케쥴러 실행됨.
	 * @param 
	 * @return void
	 * @author JB
	 * @since 2016. 7. 4.
	 */
	//@Scheduled(cron="*/10 * * * * ?")
	public void taskService() {
		System.out.println("test " + System.currentTimeMillis());
	}

	/**
	 * 
	 * @name getSampleData
	 * @description 
	 * @param 
	 * @return SampleDataResponseVO
	 * @author JB
	 * @since 2016. 7. 5.
	 */
	public SamplePagingVO getSampleData(SampleDataRequestVO param) {
		SamplePagingVO result = new SamplePagingVO();
		result.setList(sampleDao.selectDataQuery(param));
		result.setTotalRows(sampleDao.selectTotalRows(param));
		return result;
	}
}
