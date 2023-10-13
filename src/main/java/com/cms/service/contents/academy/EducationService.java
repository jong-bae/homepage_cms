package com.cms.service.contents.academy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.contents.academy.EducationDao;
import com.cms.dto.contents.academy.Education;

@Service
public class EducationService {

	@Autowired private EducationDao educationDao;
	
	public List<Education> getOnlineList() {
		return educationDao.getOnlineList();
	}
	
	public List<Education> getOfflineList() {
		return educationDao.getOfflineList();
	}
	
	public void setOnline(Education param) {
		educationDao.setOnline(param);
	}
	
	public void setOffline(Education param) {
		educationDao.setOffline(param);
	}
	
	public Education getOnlineOne(int idx) {
		return educationDao.getOnlineOne(idx);
	}
	
	public Education getOfflineOne(int idx) {
		return educationDao.getOfflineOne(idx);
	}
	
	public void modifyOnlineOne(Education param) {
		educationDao.modifyOnlineOne(param);
	}
	
	public void modifyOfflineOne(Education param) {
		educationDao.modifyOfflineOne(param);
	}
	
	public void removeEducation(int idx) {
		educationDao.removeEducation(idx);
	}
}
