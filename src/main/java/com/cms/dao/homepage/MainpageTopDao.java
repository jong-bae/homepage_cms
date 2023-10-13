package com.cms.dao.homepage;

import java.util.List;

import com.cms.dto.homepage.MainpageBanner;

public interface MainpageTopDao {

	public List<MainpageBanner> getMainpageList();
	
	public void setMainpageTopMobile(MainpageBanner param);
	
	public MainpageBanner getMainpage_mobile(int idx);
	
	public void modifyMainpageBanner_mobile(MainpageBanner param);
	
	public void removeMainpageBanner_mobile(int idx);
}
