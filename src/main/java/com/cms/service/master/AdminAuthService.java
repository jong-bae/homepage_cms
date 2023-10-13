package com.cms.service.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.master.AdminAuthDao;
import com.cms.dto.master.AdminMenuAuth;

/**
 * 
 * @ClassName AdminAuthService
 * @description 관리자 권한 서비스
 * @author JB
 * @since 2020. 10. 6.
 */
@Service
public class AdminAuthService {

	@Autowired private AdminAuthDao adminAuthDao;
	
	/**
	 * 
	 * @name setAdminAuth
	 * @description 관리자 권한 저장
	 * @param adminAuth
	 * @author JB
	 * @since 2020. 10. 6.
	 */
	public void setAdminAuth(AdminMenuAuth adminAuth) {
		adminAuthDao.setAdminAuth(adminAuth);
	}
	
	/**
	 * 
	 * @name getAdminAuth
	 * @description 담당자 메뉴권한 조회
	 * @param id
	 * @return
	 * @author JB
	 * @since 2020. 10. 14.
	 */
	public List<Integer> getAdminAuth(String id) {
		return adminAuthDao.getAdminAuth(id);
	}
	
	/**
	 * 
	 * @name removeAdminAuth
	 * @description 담당자 메뉴권한 삭제
	 * @param id
	 * @author JB
	 * @since 2020. 10. 14.
	 */
	public void removeAdminAuth(String id) {
		adminAuthDao.removeAdminAuth(id);
	}
}
