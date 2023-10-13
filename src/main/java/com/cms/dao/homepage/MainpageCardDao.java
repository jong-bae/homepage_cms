package com.cms.dao.homepage;

import java.util.List;

import com.cms.dto.homepage.MainpageCard;

public interface MainpageCardDao {

	public List<MainpageCard> getMainpageCardList();
	
	public void setMainpageCard(MainpageCard card);

	public MainpageCard getMainpageCard(int idx);
	
	public void modifyMainpageCard(MainpageCard card);
	
	public void removeMainpageCard(int idx);
}
