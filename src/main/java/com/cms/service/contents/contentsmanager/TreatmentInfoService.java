package com.cms.service.contents.contentsmanager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.contents.contentsmanage.TreatmentInfoDao;
import com.cms.dto.contents.contentsmanage.TreatmentInfo;

/**
 * 
 * @ClassName TreatmentInfoService
 * @description
 * @author JB
 * @since 2021. 5. 14.
 */
@Service
public class TreatmentInfoService {

	@Autowired private TreatmentInfoDao treatmentInfoDao;
	
	public List<TreatmentInfo> getTreatmentInfoList() {
		return treatmentInfoDao.getTreatmentInfoList();
	}
	
	public void setTreatmentInfo(TreatmentInfo param) {
		treatmentInfoDao.setTreatmentInfo(param);
	}
	
	public TreatmentInfo getTreatmentInfoOne(int bcode) {
		return treatmentInfoDao.getTreatmentInfoOne(bcode);
	}
	
	public void modifyTreatmentInfoOne(TreatmentInfo param) {
		treatmentInfoDao.modifyTreatmentInfoOne(param);
	}
	
}
