package com.cms.dao.etc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cms.dto.etc.Statistics;

public interface StatisticsDao {

	public List<Statistics> getDoctorDataList(Map<String, String> map);
	
	public List<Statistics> getBranchTotalList();

	public List<Statistics> getEffectList(@Param("date") Map<String, String> map, @Param("title") String title);
	
	public List<Statistics> getExList(Map<String, String> map);
	
	public List<HashMap<String, Object>> getMonthList(int year);

	public List<HashMap<String, Object>> getMonthExList(int year);
	
}
