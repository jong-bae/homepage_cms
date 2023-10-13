package com.cms.service.contents.tvbony;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.contents.tvbony.TvcodeDao;
import com.cms.dto.common.ResponseCode;
import com.cms.dto.contents.tvbony.TvCode;

@Service
public class TvcodeService {

	@Autowired private TvcodeDao tvCodeDao;
	
	public List<TvCode> getTvcodeList() {
		return tvCodeDao.getTvcodeList();
	}
	
	public void setTvcode(TvCode param) {
		tvCodeDao.setTvcode(param);
	}
	
	public TvCode getTvcodeOne(int idx) {
		return tvCodeDao.getTvcodeOne(idx);
	}
	
	public void modifyTvcode(TvCode param) {
		tvCodeDao.modifyTvcode(param);
	}
	
	public ResponseCode getTvcodeCheck(Map<String, String> map) {
		ResponseCode result = new ResponseCode();
		int dataCount = tvCodeDao.getTvcodeCheck(map);
		if(dataCount > 0) {
			result.setResult(false);
			result.setMessage("중복된 값이 존재합니다!");
		} else {
			result.setResult(true);
		}
		
		return result;
	}
}
