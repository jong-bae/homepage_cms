package com.cms.dao.contents.tvbony;

import java.util.List;

import com.cms.dto.contents.tvbony.TvCode;
import com.cms.dto.contents.tvbony.Tvbony;

public interface TvbonyDao {
	
	public List<Tvbony> getList();
	
	public List<TvCode> getTvCodeList();
	
	public List<TvCode> getTvCodeCategoryList(String gubun);

	public void setTvbony(Tvbony tvbony);
	
	public void modifyTvbony(Tvbony tvbony);

	public Tvbony getTvbony(int idx);

	public void removeTvbony(int idx);
	
	public List<TvCode> getTvCodeInterestList(String gubun);
	
	public List<Integer> getTvbonyTopList();
	
	public void modifyTvbonyMainYN(List<Integer> list);
	
}
