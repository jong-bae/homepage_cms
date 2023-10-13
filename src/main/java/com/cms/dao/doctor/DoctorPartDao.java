package com.cms.dao.doctor;

import java.util.List;

import com.cms.dto.doctor.Doctor;
import com.cms.dto.doctor.DoctorPart;

public interface DoctorPartDao {

	public List<DoctorPart> getPartList(int idx);
	
	public List<DoctorPart> getDoctorList(int idx);
	
	public int setPart(DoctorPart param);
	
	public int getPartCount(int idx);
	
	public DoctorPart getPartOne(int idx);
	
	public int modifyPart(DoctorPart param);
	
	public int removePart(int idx);
	
	public int removeDoctor(int idx);
	
	public void modifyPartOrder(DoctorPart param);
	
	public void modifyDoctorOrder(DoctorPart param);
	
	public List<Doctor> getDoctorSearchList(String param);
	
	public int setDoctor(DoctorPart param);
	
	public int getDoctorCount(int idx);
}
