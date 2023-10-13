package com.cms.dao.contents.contentsmanage;

import java.util.List;

import com.cms.dto.contents.contentsmanage.TreatmentInfo;

public interface TreatmentInfoDao {

	public List<TreatmentInfo> getTreatmentInfoList();
	
	public void setTreatmentInfo(TreatmentInfo param);
	
	public TreatmentInfo getTreatmentInfoOne(int bcode);
	
	public void modifyTreatmentInfoOne(TreatmentInfo param);
}
