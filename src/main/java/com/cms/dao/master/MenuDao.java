package com.cms.dao.master;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cms.dto.master.Admin;
import com.cms.dto.master.Menu;

public interface MenuDao {

	public List<Menu> getMenuAllDepth1();

	public List<Menu> getMenuDepth2();

	public List<Menu> getMenuChildren(int idx);

	/**
	 * 
	 * @name getMenuChildrenChoice
	 * @description 하위메뉴 리컬시브 
	 * 				param 어노테이션으로 xml 파라미터타입 map으로 받아서 처리할 수 있음.  
	 * @param menu
	 * @param admin
	 * @author JB
	 * @since 2021. 4. 20.
	 */
	public List<Menu> getMenuChildrenChoice(@Param("menu") Menu menu, @Param("admin") Admin admin);

	public Menu getMenuCurrentDepth1(String url);
	
	public void setMenu(Menu menu);
	
	public void removeMenu(Menu menu);
	
	public Menu getCurrentMenu(int idx);
	
	public void modifyMenu(Menu menu);
	
	public List<Menu> getParentMenuAuthList(String id);
	
	public List<Menu> getMenuAuthDepth1(List<Menu> list);
}
