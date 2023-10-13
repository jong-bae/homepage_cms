package com.cms.dao.doctor;

import java.util.List;

import com.cms.dto.doctor.Doctor;

public interface DoctorDao {
	public List<Doctor> getDoctorAllList();

	public void setDoctor(Doctor doctor);
	
	public Doctor getDoctor(int didx);

	public void modifyDoctor(Doctor doctor);
	
	public int resiSwap(int didx);

	public int taSwap(int didx);
}
