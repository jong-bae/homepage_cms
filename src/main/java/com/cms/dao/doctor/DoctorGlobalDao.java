package com.cms.dao.doctor;

import java.util.List;
import java.util.Map;

import com.cms.dto.doctor.Doctor;
import com.cms.dto.doctor.DoctorPart;

public interface DoctorGlobalDao {

	public List<Doctor> getGlobalList(Map<String, String> param);
	
	public int removeGlobalDoctor(int idx);
	
	public int addGlobalDoctor(int idx);
	
	public void sortGlobalList(DoctorPart param);
	
	public void sortRuList(DoctorPart param);
}
