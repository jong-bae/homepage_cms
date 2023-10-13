package com.cms.dao.contents.tvbony;

import java.util.List;
import java.util.Map;

import com.cms.dto.contents.tvbony.TvCode;

public interface TvcodeDao {

	public List<TvCode> getTvcodeList();
	
	public void setTvcode(TvCode param);
	
	public TvCode getTvcodeOne(int idx);
	
	public void modifyTvcode(TvCode param);
	
	public int getTvcodeCheck(Map<String, String> map);
}
