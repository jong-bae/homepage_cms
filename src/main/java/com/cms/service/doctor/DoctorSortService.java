package com.cms.service.doctor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.doctor.DoctorPartDao;
import com.cms.dto.doctor.Doctor;
import com.cms.dto.doctor.DoctorPart;
import com.cms.dto.doctor.DoctorSort;

@Service
public class DoctorSortService {

	@Autowired private DoctorPartDao doctorPartDao;
	
	/**
	 * 
	 * @name getPartList
	 * @description 병의원 별 센터 조회
	 * @param idx
	 * @return
	 * @author JB
	 * @since 2021. 2. 24.
	 */
	public List<DoctorPart> getPartList(int idx) {
		return doctorPartDao.getPartList(idx);
	}
	
	/**
	 * 
	 * @name getDoctorList
	 * @description 센터 별 의료진 조회
	 * @param idx
	 * @return
	 * @author JB
	 * @since 2021. 2. 24.
	 */
	public List<DoctorPart> getDoctorList(int idx) {
		return doctorPartDao.getDoctorList(idx);
	}
	
	/**
	 * 
	 * @name setPart
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 3. 10.
	 */
	public boolean setPart(DoctorPart param) {
		int orderCnt = doctorPartDao.getPartCount(param.getGubun1_idx());
		param.setGubun2_order(orderCnt+1);
		int rowCnt = doctorPartDao.setPart(param);
		
		if(rowCnt == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 
	 * @name getPartOne
	 * @description
	 * @param idx
	 * @return
	 * @author JB
	 * @since 2021. 3. 12.
	 */
	public DoctorPart getPartOne(int idx) {
		return doctorPartDao.getPartOne(idx);
	}
	
	/**
	 * 
	 * @name modifyPart
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 3. 12.
	 */
	public boolean modifyPart(DoctorPart param) {
		int rowCnt = doctorPartDao.modifyPart(param);
		if(rowCnt == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 
	 * @name removePart
	 * @description
	 * @param idx
	 * @return
	 * @author JB
	 * @since 2021. 3. 12.
	 */
	public boolean removePart(int idx) {
		int rowCnt = doctorPartDao.removePart(idx);
		if(rowCnt == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 
	 * @name removeDoctor
	 * @description
	 * @param idx
	 * @return
	 * @author JB
	 * @since 2021. 3. 12.
	 */
	public boolean removeDoctor(int idx) {
		int rowCnt = doctorPartDao.removeDoctor(idx);
		if(rowCnt == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 
	 * @name modifyPartOrder
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 3. 17.
	 */
	public boolean modifyPartOrder(DoctorSort param) {
		int rowCnt = 0;
		for(DoctorPart vo : param.getListData()) {
			if(param.getFlag().equals("CENTER")) {
				doctorPartDao.modifyPartOrder(vo);
			} else {
				doctorPartDao.modifyDoctorOrder(vo);
			}
			rowCnt++;
		}
		
		if(rowCnt > 0 ) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 
	 * @name getDoctorSearchList
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 3. 18.
	 */
	public List<Doctor> getDoctorSearchList(String param) {
		return doctorPartDao.getDoctorSearchList(param);
	}
	
	/**
	 * 
	 * @name setDoctor
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 3. 19.
	 */
	public boolean setDoctor(DoctorPart param) {
		int orderCnt = doctorPartDao.getDoctorCount(param.getGubun2_idx());
		param.setD_order(orderCnt+1);
		int rowCnt = doctorPartDao.setDoctor(param);
		
		if(rowCnt == 1) {
			return true;
		} else {
			return false;
		}
	}
}
