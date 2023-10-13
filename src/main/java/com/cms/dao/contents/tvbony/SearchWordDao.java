package com.cms.dao.contents.tvbony;

import java.util.List;

import com.cms.dto.contents.tvbony.SearchWord;

public interface SearchWordDao {

	public List<SearchWord> getList(SearchWord param);

}
