package com.cms.service.doctor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.doctor.DoctorGlobalDao;
import com.cms.dto.common.ResponseCode;
import com.cms.dto.doctor.Doctor;
import com.cms.dto.doctor.DoctorPart;
import com.cms.dto.doctor.DoctorSort;

@Service
public class DoctorGlobalService {
	
	@Autowired private DoctorGlobalDao doctorGlobalDao;
	
	public List<Doctor> getGlobalList(Map<String, String> param) {
		return doctorGlobalDao.getGlobalList(param);
	}
	
	public ResponseCode removeGlobalDoctor(int idx) {
		ResponseCode result = new ResponseCode();
		int resultCnt = doctorGlobalDao.removeGlobalDoctor(idx);
		
		if(resultCnt > 0 ) {
			result.setResult(true);
		} else {
			result.setResult(false);
			result.setMessage("삭제에 문제가 발생하였습니다.");
		}
		
		return result;
	}
	
	public ResponseCode addGlobalDoctor(int idx) {
		ResponseCode result = new ResponseCode();
		int resultCnt = doctorGlobalDao.addGlobalDoctor(idx);
		
		if(resultCnt > 0) {
			result.setResult(true);
		} else {
			result.setResult(false);
			result.setMessage("등록에 문제가 발생하였습니다.");
		}
		
		return result;
	}
	
	public boolean sortList(DoctorSort param) {
		int rowCnt = 0;
		for(DoctorPart vo : param.getListData()) {
			if(param.getFlag().equals("global")) {
				doctorGlobalDao.sortGlobalList(vo);
			} else {
				doctorGlobalDao.sortRuList(vo);
			}
			rowCnt++;
		}
		
		if(rowCnt > 0 ) {
			return true;
		} else {
			return false;
		}
	}
}
