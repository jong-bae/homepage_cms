package com.cms.service.contents.tvbony;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.contents.tvbony.TvrankDao;
import com.cms.dto.common.ResponseCode;
import com.cms.dto.contents.tvbony.Tvbony;

@Service
public class TvrankService {

	@Autowired private TvrankDao tvRankDao;
	
	public List<Tvbony> getTvcodeList() {
		return tvRankDao.getTvcodeList();
	}
	
	/**
	 * 
	 * @name setOrder
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2022. 6. 27.
	 */
	public ResponseCode setOrder(Map<String, Object> param) {
		ResponseCode result = new ResponseCode();
		List<Integer> idxList = (List<Integer>) param.get("idxList");
		
		int i = 0;
		try {
			for(int idx : idxList) {
				i++;
				tvRankDao.setOrder(idx, i);
			}
			
			result.setResult(true);
			result.setMessage("순서정렬 완료");
			
		} catch(Exception e) {
			e.printStackTrace();
			result.setResult(false);
			result.setMessage("순서정렬 중 오류가 발생하였습니다.");
		}
		
		return result;
	}
}
