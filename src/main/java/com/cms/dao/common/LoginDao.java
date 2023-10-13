package com.cms.dao.common;

import java.util.Map;

import com.cms.dto.master.Admin;

public interface LoginDao {
	
	public Admin getLoginUserInfo(Admin admin);
	
	public Admin getUserInfo(Map<String, String> param);
	
	public void modifyPassword(Map<String, String> param);
	
	public void modifyPassword2(Admin param);
	
	public int getPasswordCheck(Admin param);
	
	public void modifyLastLoginDate(String id);
	
}
