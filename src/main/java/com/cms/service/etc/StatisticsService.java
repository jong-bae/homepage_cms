package com.cms.service.etc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.etc.StatisticsDao;
import com.cms.dto.etc.Statistics;

@Service
public class StatisticsService {

	@Autowired private StatisticsDao statisticsDao;
	
	public List<Statistics> getDoctorDataList(Map<String, String> map) {
		return statisticsDao.getDoctorDataList(map);
	}
	
	public List<Statistics> getBranchTotalList() {
		return statisticsDao.getBranchTotalList();
	}
	
	/**
	 * 
	 * @name getEffectList
	 * @description 질환별 분원통계 조합
	 * @param map
	 * @return
	 * @author JB
	 * @since 2022. 6. 7.
	 */
	public List<Map<String, Object>> getEffectList(Map<String, String> map) {
		List<Map<String, Object>> arrData = new ArrayList<Map<String, Object>>();
		// 치료후기 intBoardId  Array;
		String[] boardIDArr = {"허리디스크", "목디스크", "퇴행성디스크", "척추관협착증", "전방전위ㆍ분리증", "턱관절장애", "관절ㆍ통증", "안면신경마비",	"교통사고후유증", "교통사고", "비만", "기타질환"};

		for (String s : boardIDArr) {
			Map<String, Object> mapData = new HashMap<String, Object>();
			mapData.put("data", statisticsDao.getEffectList(map, s));
			mapData.put("title", s);
			arrData.add(mapData);
		}

		return arrData;
	}
	
	public List<Statistics> getExList(Map<String, String> map) {
		return statisticsDao.getExList(map);
	}
	
	public List<HashMap<String, Object>> getMonthList(int param) {
		return statisticsDao.getMonthList(param);
	}

	public List<HashMap<String, Object>> getMonthExList(int param) {
		return statisticsDao.getMonthExList(param);
	}

}
