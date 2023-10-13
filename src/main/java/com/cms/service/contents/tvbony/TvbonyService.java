package com.cms.service.contents.tvbony;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.contents.tvbony.TvbonyDao;
import com.cms.dto.contents.tvbony.TvCode;
import com.cms.dto.contents.tvbony.Tvbony;

@Service
public class TvbonyService {

	@Autowired private TvbonyDao tvbonyDao;
	
	public List<Tvbony> getList() {
		return tvbonyDao.getList();
	}
	
	public List<TvCode> getTvCodeList() {
		return tvbonyDao.getTvCodeList();
	}
	
	public List<TvCode> getTvCodeCategoryList(TvCode param) {
		return tvbonyDao.getTvCodeCategoryList(param.getGubun());
	}
			
	public void setTvbony(Tvbony tvbony) {
		tvbonyDao.setTvbony(tvbony);
	}

	
	public Tvbony getTvbony(int idx) {
		Tvbony tvbony = tvbonyDao.getTvbony(idx);
		return tvbony;
	}

	/**
	 * 
	 * @name modifyTvbony
	 * @description 수정하면서 MainYN 재처리
	 * @param tvbony
	 * @author JB
	 * @since 2022. 7. 19.
	 */
	public void modifyTvbony(Tvbony tvbony) {
		tvbonyDao.modifyTvbony(tvbony);

		List<Integer> idxList = tvbonyDao.getTvbonyTopList();
		tvbonyDao.modifyTvbonyMainYN(idxList);
	}
	
	
	public void removeTvbony(int idx) {
		tvbonyDao.removeTvbony(idx);
	}
	
	public List<TvCode> getTvCodeInterestList(String gubun) {
		return tvbonyDao.getTvCodeInterestList(gubun);
	}
	
}
