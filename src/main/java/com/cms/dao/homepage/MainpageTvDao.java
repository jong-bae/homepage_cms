package com.cms.dao.homepage;

import java.util.List;

import com.cms.dto.homepage.MainpageKeyword;

public interface MainpageTvDao {
	
	public List<MainpageKeyword> getInterestList();
	
	public void modifyInterestKeyword(MainpageKeyword param);
	
	public MainpageKeyword getInterestKeyword();

}
