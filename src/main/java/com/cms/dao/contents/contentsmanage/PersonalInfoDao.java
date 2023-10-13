package com.cms.dao.contents.contentsmanage;

import java.util.List;

import com.cms.dto.contents.contentsmanage.PersonalInfo;


public interface PersonalInfoDao {
	
	public List<PersonalInfo> getList();

	public void setPersonalInfo(PersonalInfo personalinfo);
	
	public void modifyPersonalInfo(PersonalInfo personalinfo);

	public PersonalInfo getPersonalInfo(int idx);

	public void removePersonalInfo(int idx);

}
