package com.cms.dao.master;

import java.util.List;

import com.cms.dto.master.AdminMenuAuth;

public interface AdminAuthDao {

	public void setAdminAuth(AdminMenuAuth adminAuth);
	
	public List<Integer> getAdminAuth(String id);
	
	public void removeAdminAuth(String id); 
	
}
