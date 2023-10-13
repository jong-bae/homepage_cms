package com.cms.dao.contents.contentsmanage;

import java.util.List;

import com.cms.dto.contents.contentsmanage.Agreement;

public interface AgreementDao {

	public List<Agreement> getAgreementList();
	
	public void setAgreement(Agreement agreement);
	
	public Agreement getAgreementOne(String pid);
	
	public void modifyAgreement(Agreement agreement);
	
	public void removeAgreement(String pid);
}
