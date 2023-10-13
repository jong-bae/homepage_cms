package com.cms.service.contents.tvbony;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.contents.tvbony.SearchWordDao;
import com.cms.dto.contents.tvbony.SearchWord;

@Service
public class SearchWordService {

	@Autowired private SearchWordDao searchWordDao;
	
	public List<SearchWord> getList(String startDate, String endDate) {
		List<SearchWord> result = new ArrayList<SearchWord>();
		
		SearchWord param = new SearchWord();
		param.setStartDate(startDate);
		param.setEndDate(endDate);
		
		return  searchWordDao.getList(param);
	}

}
