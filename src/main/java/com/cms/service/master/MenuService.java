package com.cms.service.master;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.master.MenuDao;
import com.cms.dto.master.Admin;
import com.cms.dto.master.Menu;

/**
 * 
 * @ClassName MenuService
 * @description 메뉴관련 서비스
 * @author JB
 * @since 2020. 9. 21.
 */
@Service
public class MenuService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MenuDao menuDao;
	
	
	/**
	 * 
	 * @name getMenuDepth1
	 * @description 상단 TOP 1뎁스 메뉴 로드 서비스
	 * @return
	 * @author JB
	 * @since 2020. 9. 23.
	 */
	public List<Menu> getMenuAllDepth1() {
		return menuDao.getMenuAllDepth1();
	}
	
	/**
	 * 
	 * @name getMenuAuthDepth1
	 * @description 상단 Top 1뎁스 유저 권한메뉴 로드
	 * @param id
	 * @return
	 * @author JB
	 * @since 2021. 4. 13.
	 */
	public List<Menu> getMenuAuthDepth1(String id) {
		List<Menu> userAuthMenuList = menuDao.getParentMenuAuthList(id);
		return menuDao.getMenuAuthDepth1(userAuthMenuList);
	}
	
	/**
	 * 
	 * @name getTreeMenu
	 * @description 선택메뉴 active 처리
	 * 				각 메뉴 시작 또는 top 메뉴 클릭시  동시에 동작
	 * @param menu
	 * @return
	 * @author JB
	 * @since 2020. 10. 7.
	 */
	public List<Menu> getTreeMenu(Menu menu, Admin admin) {
		List<Menu> menuList = menuDao.getMenuChildrenChoice(menu, admin);
		
		for(Menu item : menuList) {
			item.setReqUrl(menu.getReqUrl());
			item.setMenuList(menuDao.getMenuChildrenChoice(item, admin));
		}
		
		return menuList;
	}
	
	/**
	 * 
	 * @name getTreeMenu
	 * @description 사이드 메뉴 2-3뎁스 트리메뉴 로드 서비스
	 * @param idx
	 * @return
	 * @author JB
	 * @since 2020. 9. 23.
	 */
	public List<Menu> getTreeMenu(int idx) {
		List<Menu> menuList = menuDao.getMenuChildren(idx);
		
		for(Menu item : menuList) {
			item.setMenuList(menuDao.getMenuChildren(item.getIdx()));
		}
		
		return menuList;
	}

	/**
	 * 
	 * @name getCurrentMenu
	 * @description 현재 대메뉴 자식 로드
	 * @param url
	 * @return
	 * @author JB
	 * @since 2020. 9. 24.
	 */
	public List<Menu> getCurrentMenu(String url, Admin admin) {
		String rootContext = url.substring(1, url.indexOf("/", 2));
		//System.out.println(rootContext);
		Menu currentMenu = menuDao.getMenuCurrentDepth1(rootContext);
		currentMenu.setReqUrl(url);
		return getTreeMenu(currentMenu, admin);
	}
	
	/**
	 * 
	 * @name getAllMenuList
	 * @description 전체 메뉴 리스트 
	 * 					- 계정 권한부여할때 전체 메뉴리스트 보여주기 위해 사용
	 * @return
	 * @author JB
	 * @since 2020. 9. 29.
	 */
	public List<Menu> getAllMenuList() {
		List<Menu> allChildDepth = new ArrayList<Menu>();
		List<Menu> depth1 = menuDao.getMenuAllDepth1();
		
		for(Menu item : depth1) {
			List<Menu> tmpList = getTreeMenu(item.getIdx());
			allChildDepth.addAll(tmpList);
		}
		
		return allChildDepth;
	}
	
	/**
	 * 
	 * @name getChildMenuList
	 * @description 메뉴등록 하위 메뉴리스트
	 * @param menu
	 * @return
	 * @author JB
	 * @since 2020. 10. 7.
	 */
	public List<Menu> getChildMenuList(Menu menu) {
		return menuDao.getMenuChildren(menu.getIdx());
	}
	
	/**
	 * 
	 * @name setMenu
	 * @description 메뉴 추가
	 * @param menu
	 * @author JB
	 * @since 2020. 10. 13.
	 */
	public void setMenu(Menu menu) {
		menuDao.setMenu(menu);
	}
	
	/**
	 * 
	 * @name removeMenu
	 * @description 메뉴삭제
	 * @param menu
	 * @author JB
	 * @since 2020. 10. 13.
	 */
	public void removeMenu(Menu menu) {
		// 리컬시브 돌려서 부모뎁스일 경우 하위 뎁스 idx 조회 후 전체  삭제 기능 추가
		menuDao.removeMenu(menu);
	}

	/**
	 * 
	 * @name getCurrentMenu
	 * @description 선택메뉴 정보 조회
	 * @param idx
	 * @return Menu
	 * @author JB
	 * @since 2020. 10. 13.
	 */
	public Menu getCurrentMenu(int idx) {
		return menuDao.getCurrentMenu(idx);
	}
	
	/**
	 * 
	 * @name modifyMenu
	 * @description 메뉴 수정
	 * @param menu
	 * @author JB
	 * @since 2020. 10. 13.
	 */
	public void modifyMenu(Menu menu) {
		menuDao.modifyMenu(menu);
	}
	
	/**
	 * 
	 * @name getParentMenuAuthList
	 * @description 유저 메뉴권한 리스트
	 * @param id
	 * @return
	 * @author JB
	 * @since 2021. 4. 13.
	 */
	public List<Menu> getParentMenuAuthList(String id) {
		return menuDao.getParentMenuAuthList(id);
	}
}
