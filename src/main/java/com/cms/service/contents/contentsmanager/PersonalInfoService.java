package com.cms.service.contents.contentsmanager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.contents.contentsmanage.PersonalInfoDao;
import com.cms.dto.contents.contentsmanage.PersonalInfo;

@Service
public class PersonalInfoService {

	@Autowired private PersonalInfoDao personalinfoDao;
	
	public List<PersonalInfo> getList() {
		return personalinfoDao.getList();
	}
	
	/**
	 * 
	 * @name setPersonalInfo
	 * @description 개인정보처리 방침 추가
	 * @param personalinfo
	 * @author 김재형
	 * @since 2020. 10. 28.
	 */
	public void setPersonalInfo(PersonalInfo personalinfo) {
		personalinfoDao.setPersonalInfo(personalinfo);
	}

	
	/**
	 * 
	 * @name getPersonalInfo
	 * @description 개인정보처리 방침 상세 내용 조회
	 * @param idx
	 * @author 김재형
	 * @since 2020. 10. 29.
	 */
	public PersonalInfo getPersonalInfo(int idx) {
		PersonalInfo personalinfo = personalinfoDao.getPersonalInfo(idx);
		return personalinfo;
	}

	/**
	 * 
	 * @name modifyPersonalInfo
	 * @description 개인정보처리 방침 수정
	 * @param personalinfo
	 * @author 김재형
	 * @since 2020. 10. 29.
	 */
	public void modifyPersonalInfo(PersonalInfo personalinfo) {
		personalinfoDao.modifyPersonalInfo(personalinfo);
	}
	
	/**
	 * 
	 * @name removePersonalInfo
	 * @description 개인정보처리 방침 삭제
	 * @param idx
	 * @author 김재형
	 * @since 2020. 10. 29.
	 */
	public void removePersonalInfo(int idx) {
		personalinfoDao.removePersonalInfo(idx);
	}
}
