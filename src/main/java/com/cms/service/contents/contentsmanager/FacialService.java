package com.cms.service.contents.contentsmanager;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.cms.common.util.FileUpload;
import com.cms.dao.contents.contentsmanage.FacialDao;
import com.cms.dto.common.BZBoard;

@Service
public class FacialService {

	@Value("#{prop['file.upload.system.path']}") private String systemPath;
	@Autowired private FacialDao facialDao;
	
	public List<BZBoard> getFacialList() {
		return facialDao.getFacialList();
	}
	
	public void setFacial(BZBoard param, MultipartRequest multipartReq) {
		MultipartFile strFirstImg_File = multipartReq.getFile("strFirstImg_File");
		
		if(!strFirstImg_File.isEmpty()) {
			param.setStrFirstImg(strFirstImg_File.getOriginalFilename());
			FileUpload.fileUpload(strFirstImg_File, systemPath+File.separator+"112");
		}
		
		facialDao.setFacial(param);
		facialDao.setFileName(param);
		
	}
	
	public BZBoard getFacial(int idx) {
		return facialDao.getFacial(idx);
	}
	
	public void modifyFacial(BZBoard param, MultipartRequest multipartReq) {
		MultipartFile strFirstImg_File = multipartReq.getFile("strFirstImg_File");
		
		if(!strFirstImg_File.isEmpty()) {
			param.setStrFirstImg(strFirstImg_File.getOriginalFilename());
			FileUpload.fileUpload(strFirstImg_File, systemPath+File.separator+"112");
		}
		
		facialDao.modifyFacial(param);
	}
	
	public void removeFacial(int idx) {
		facialDao.removeFacial(idx);
	}
	
}
