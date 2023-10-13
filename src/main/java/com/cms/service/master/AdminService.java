package com.cms.service.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cms.dao.master.AdminDao;
import com.cms.dto.master.Admin;
import com.cms.dto.master.AdminMenuAuth;

/**
 * 
 * @ClassName AdminService
 * @description 관리자 서비스
 * @author JB
 * @since 2020. 9. 18.
 */
@Service
public class AdminService {

	@Autowired private AdminDao adminDao;
	@Autowired private AdminAuthService adminAuthService;
	
	/**
	 * 
	 * @name setAdmin
	 * @description 관리자 등록
	 * @param admin
	 * @author JB
	 * @since 2020. 10. 5.
	 */
	@Transactional
	public void setAdmin(Admin admin) {
		adminDao.setAdmin(admin);
		if(admin.getAuth().equals("general")) {
			setRole(admin);
		}
	}
	
	/**
	 * 
	 * @name getAdminList
	 * @description 관리자 리스트 조회
	 * @return
	 * @author JB
	 * @since 2020. 10. 5.
	 */
	public List<Admin> getAdminList() {
		return adminDao.getAdminList();
	}
	
	/**
	 * 
	 * @name setRole
	 * @description Role 저장
	 * @param admin
	 * @author JB
	 * @since 2020. 10. 6.
	 */
	public void setRole(Admin admin) {
		if (admin.getRole() != null) {
			String[] arrRole = admin.getRole().split(",");

			if(arrRole.length > 0) {
				AdminMenuAuth auth = new AdminMenuAuth();
				auth.setId(admin.getId());
				
				for(String role : arrRole) {
					if(!"".equals(role)) {
						auth.setMenuIdx(Integer.parseInt(role));
						this.adminAuthService.setAdminAuth(auth);
					}
				}
			}
		}
	}
	
	/**
	 * 
	 * @name getCurrentAdmin
	 * @description 현재 어드민 정보 조회
	 * @param idx
	 * @return
	 * @author JB
	 * @since 2020. 10. 13.
	 */
	public Admin getCurrentAdmin(int idx) {
		Admin user = adminDao.getCurrentAdmin(idx);
		user.setAuthList(adminAuthService.getAdminAuth(user.getId()));
		return user; 
	}
	
	/**
	 * 
	 * @name modifyAdmin
	 * @description 담당자 수정
	 * @param admin
	 * @author JB
	 * @since 2020. 10. 14.
	 */
	@Transactional
	public void modifyAdmin(Admin admin) {
		adminDao.modifyAdmin(admin);
		adminAuthService.removeAdminAuth(admin.getId());
		if(admin.getAuth().equals("general")) {
			setRole(admin);
		}
	}
}
