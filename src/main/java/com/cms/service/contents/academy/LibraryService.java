package com.cms.service.contents.academy;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.cms.common.util.FileUpload;
import com.cms.dao.contents.academy.LibraryDao;
import com.cms.dto.contents.academy.EducationFile;

@Service
public class LibraryService {

	@Autowired private LibraryDao libraryDao;
	
	@Value("#{prop['file.upload.url.path']}") private String uploadPath;
	@Value("#{prop['file.upload.system.path']}") private String systemPath;
	@Value("#{prop['file.upload.path.academy']}") private String subPath;
	
	public List<EducationFile> getLibraryList() {
		return libraryDao.getLibraryList();
	}
	
	@Transactional
	public void setLibrary(EducationFile param, MultipartRequest multipartReq) {
		MultipartFile thumbnailImg = multipartReq.getFile("img_file");
		
		if(!thumbnailImg.isEmpty()) {
			param.setFilePath(uploadPath + "/" + subPath + "/" + thumbnailImg.getOriginalFilename());
			param.setFileName(thumbnailImg.getOriginalFilename());
			param.setFileSize((int)thumbnailImg.getSize());
			param.setUuid(UUID.randomUUID().toString().replace("-", "").toUpperCase());
			FileUpload.fileUpload(thumbnailImg, systemPath+File.separator+subPath);
		}
		
		libraryDao.setLibrary(param);
		libraryDao.setLibraryFile(param);
	}
	
	public EducationFile getLibraryOne(int idx) {
		return libraryDao.getLibraryOne(idx);
	}
	
	@Transactional
	public void modifyLibrary(EducationFile param, MultipartRequest multipartReq) {
		MultipartFile thumbnailImg = multipartReq.getFile("img_file");
		
		if(!thumbnailImg.isEmpty()) {
			param.setFilePath(uploadPath + "/" + subPath + "/" + thumbnailImg.getOriginalFilename());
			param.setFileName(thumbnailImg.getOriginalFilename());
			param.setFileSize((int)thumbnailImg.getSize());
			param.setUuid(UUID.randomUUID().toString().replace("-", "").toUpperCase());
			FileUpload.fileUpload(thumbnailImg, systemPath+File.separator+subPath);

			libraryDao.setLibraryFile(param);
		} else {
			param.setFilePath(param.getImg_Origin());
		}
		
		libraryDao.modifyLibrary(param);
	}
	
	public void removeLibrary(int idx) {
		List<EducationFile> fileList = libraryDao.getLibraryFileList(idx);
		libraryDao.removeLibrary(idx);
		libraryDao.removeLibraryFile(idx);
		
		// 게시글에 관련된 첨부파일도 모두 삭제
		for(EducationFile file : fileList) {
			FileUpload.fileNameDelete(systemPath+File.separator+subPath+File.separator+file.getFileName());		
		}
		
	}
}
