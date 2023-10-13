package com.cms.service.doctor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.doctor.NurseDao;
import com.cms.dto.doctor.Nurse;

@Service
public class NurseService {

	@Autowired private NurseDao nurseDao;
	
	public List<Nurse> getNurseAllList() {
		return nurseDao.getNurseAllList();
	}
	
	public List<Nurse> getDoctorList(int idx) {
		return nurseDao.getDoctorList(idx);
	}
	
	public void setNurse(Nurse param) {
		nurseDao.setNurse(param);
	}
	
	public Nurse getNurse(int idx) {
		return nurseDao.getNurse(idx);
	}
	
	public void modifyNurse(Nurse param) {
		nurseDao.modifyNurse(param);
	}
}
