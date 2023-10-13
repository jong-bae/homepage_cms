package com.cms.service.contents.contentsmanager;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.contents.contentsmanage.AgreementDao;
import com.cms.dto.contents.contentsmanage.Agreement;

/**
 * 
 * @ClassName AgreementService
 * @description
 * @author JB
 * @since 2021. 5. 4.
 */
@Service
public class AgreementService {

	@Autowired private AgreementDao agreementDao;
	
	/**
	 * 
	 * @name getAgreementList
	 * @description
	 * @return
	 * @author JB
	 * @since 2021. 5. 4.
	 */
	public List<Agreement> getAgreementList() {
		return agreementDao.getAgreementList();
	}
	
	/**
	 * 
	 * @name setAgreement
	 * @description
	 * @param agreement
	 * @author JB
	 * @since 2021. 5. 6.
	 */
	public void setAgreement(Agreement agreement) {
		// UUID 키값 강제 추가
		String pid = UUID.randomUUID().toString(); 
		agreement.setPid(pid.replace("-", ""));
		agreementDao.setAgreement(agreement);
	}
	
	/**
	 * 
	 * @name getAgreementOne
	 * @description
	 * @param pid
	 * @return
	 * @author JB
	 * @since 2021. 5. 7.
	 */
	public Agreement getAgreementOne(String pid) {
		return agreementDao.getAgreementOne(pid);
	}
	
	/**
	 * 
	 * @name modifyAgreement
	 * @description
	 * @param agreement
	 * @author JB
	 * @since 2021. 5. 7.
	 */
	public void modifyAgreement(Agreement agreement) {
		agreementDao.modifyAgreement(agreement);
	}
	
	public void removeAgreement(String pid) {
		agreementDao.removeAgreement(pid);
	}
}
