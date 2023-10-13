package com.cms.dao.doctor;

import java.util.List;

import com.cms.dto.doctor.Nurse;

public interface NurseDao {

	public List<Nurse> getNurseAllList();
	
	public List<Nurse> getDoctorList(int idx);
	
	public void setNurse(Nurse param);
	
	public Nurse getNurse(int idx);
	
	public void modifyNurse(Nurse param);
}
