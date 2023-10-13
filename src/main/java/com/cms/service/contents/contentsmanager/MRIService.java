package com.cms.service.contents.contentsmanager;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.cms.common.util.FileUpload;
import com.cms.dao.contents.contentsmanage.MRIDao;
import com.cms.dto.common.BZBoard;

@Service
public class MRIService {
	
	@Value("#{prop['file.upload.system.path']}") private String systemPath;
	@Autowired private MRIDao mriDao;
	
	public List<BZBoard> getList() {
		return mriDao.getList();
	}

	public void setMri(BZBoard bzBoard, MultipartRequest multipartReq) {

		Iterator<String> fileNames = multipartReq.getFileNames();
		MultipartFile strFirstImg = multipartReq.getFile("strFirstImg_File");
		
		if((!strFirstImg.isEmpty()) && (strFirstImg != null)) {
			bzBoard.setStrFirstImg(strFirstImg.getOriginalFilename());
		}

		mriDao.setMri(bzBoard);

		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile file = multipartReq.getFile(fileName);
			
			if(!file.isEmpty()) {
				FileUpload.fileUpload(file, systemPath+File.separator+"16");
			}
		}
		
		//USPBZB_Put_Content_20110110 여기서 처리안되고있어서 파일첨부 네이밍 업데이트..  
		mriDao.setFileName(bzBoard);
		
		
	}

	public BZBoard getMri(int idx) {
		BZBoard bzBoard = mriDao.getMRI(idx);
		bzBoard.setStrFirstImgPath(systemPath+File.separator + "16" + File.separator+ bzBoard.getStrFirstImg());
		return bzBoard;
	}

	public void removeMri(int idx) {
		mriDao.removeMri(idx);
	}

	@Transactional
	public void modifyMri(BZBoard bzBoard, MultipartRequest multipartReq) {
		
		Iterator<String> fileNames = multipartReq.getFileNames();
		MultipartFile strFirstImg = multipartReq.getFile("strFirstImg_File");
		
		if((!strFirstImg.isEmpty()) && (strFirstImg != null)) {
			bzBoard.setStrFirstImg(strFirstImg.getOriginalFilename());
		}
		
		mriDao.modifyMri(bzBoard);
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile file = multipartReq.getFile(fileName);
			
			if(!file.isEmpty()) {
				FileUpload.fileUpload(file, systemPath+File.separator+"16");
				mriDao.setFileName(bzBoard);
			}
		}
		
		
	}
	

}
