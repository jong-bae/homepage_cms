package com.cms.dao.master;

import java.util.List;

import com.cms.dto.master.Admin;

public interface AdminDao {
	
	public void setAdmin(Admin admin);
	
	public List<Admin> getAdminList();
	
	public Admin getCurrentAdmin(int idx);
	
	public void modifyAdmin(Admin admin);

}
