package com.cms.dao.homepage;

import java.util.List;

import com.cms.dto.homepage.TreatmentTime;


public interface TreatmentTimeDao {
	
	public List<TreatmentTime> getList();

	public void setTreatmentTime(TreatmentTime treatmenttime);

	public int checkBCode(String bCode);

	public TreatmentTime getTreatmentTime(int idx);

	public void modifyTreatmentTime(TreatmentTime treatmenttime);

	public List<TreatmentTime> getExceptionList();

	public void setTreatmentTimeException(TreatmentTime treatmenttime);

	public void modifyTreatmentTimeException(TreatmentTime treatmenttime);

	public TreatmentTime getTreatmentTimeException(int idx);

	public void removeTreatmentTimeException(int idx);

}
