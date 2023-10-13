package com.cms.dao.contents.academy;

import java.util.List;

import com.cms.dto.contents.academy.Education;

public interface EducationDao {

	public List<Education> getOnlineList();
	
	public List<Education> getOfflineList();
	
	public void setOnline(Education param);
	
	public void setOffline(Education param);
	
	public Education getOnlineOne(int idx);
	
	public Education getOfflineOne(int idx);
	
	public void modifyOnlineOne(Education param);
	
	public void modifyOfflineOne(Education param);
	
	public void removeEducation(int idx);
	
}
