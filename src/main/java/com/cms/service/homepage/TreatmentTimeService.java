package com.cms.service.homepage;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.homepage.TreatmentTimeDao;
import com.cms.dto.homepage.TreatmentTime;


/**
 * 
 * @ClassName TreatmentTiemService
 * @description 진료시간 관리 서비스
 * @author KimJaehyung
 * @since 2020. 12. 3.
 */
@Service
public class TreatmentTimeService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private TreatmentTimeDao treatmentTimeDao;
	
	/**
	 * 
	 * @name getList
	 * @description
	 * @return
	 * @author KimJaehyung
	 * @since 2020. 12. 11.
	 */
	public List<TreatmentTime> getList() {
		return treatmentTimeDao.getList();
	}

	/**
	 * 
	 * @name setTreatmentTime
	 * @description 등록 
	 * @param treatmenttime2
	 * @author KimJaehyung
	 * @since 2020. 12. 11.
	 */
	public int setTreatmentTime(TreatmentTime treatmenttime) {

		int result = 0;
		
		result = treatmentTimeDao.checkBCode(treatmenttime.getbCode());
		
		if(result == 0) {
			treatmentTimeDao.setTreatmentTime(treatmenttime);	
		}
		
		return result;
	}

	public TreatmentTime getTreatmentTime(int idx) {
		return treatmentTimeDao.getTreatmentTime(idx);
	}
	
	public TreatmentTime getTreatmentTimeException(int idx) {
		return treatmentTimeDao.getTreatmentTimeException(idx);
	}


	/**
	 * 
	 * @name modifyTreatmentTime
	 * @description 수정
	 * @param treatmenttime
	 * @return
	 * @author KimJaehyung
	 * @since 2020. 12. 16.
	 */
	public int modifyTreatmentTime(TreatmentTime treatmenttime) {
		
		int result = 0;
		
		try {
			treatmentTimeDao.modifyTreatmentTime(treatmenttime);	
		}catch(Exception e) {
			result = -1;
		}
		
		return result;
	}

	public List<TreatmentTime> getExceptionList() {
		return treatmentTimeDao.getExceptionList();
	}

	public void setTreatmentTimeException(TreatmentTime treatmenttime) {
		treatmentTimeDao.setTreatmentTimeException(treatmenttime);	
	}
	
	public void modifyTreatmentTimeException(TreatmentTime treatmenttime) {
		treatmentTimeDao.modifyTreatmentTimeException(treatmenttime);	
	}
	
	public void removeTreatmentTimeException(int idx) {
		treatmentTimeDao.removeTreatmentTimeException(idx);
	}
	
}
