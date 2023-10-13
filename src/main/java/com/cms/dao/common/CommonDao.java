package com.cms.dao.common;

import java.util.HashMap;
import java.util.List;

import com.cms.dto.common.BZCode;
import com.cms.dto.common.JasengBranchCode;
import com.cms.dto.doctor.Doctor;

public interface CommonDao {

	public List<JasengBranchCode> getBCodeSelectBox();
	
	public List<JasengBranchCode> getBranchName(HashMap<String, String[]> map);
	
	public List<JasengBranchCode> getBranchList();
	
	public List<BZCode> getNPaymentCodeList(String code);
	
	public String getBranchEnName(String bcode);
	
	public List<Doctor> getDoctorSelectBox();
}
