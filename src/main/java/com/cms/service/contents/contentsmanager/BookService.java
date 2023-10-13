package com.cms.service.contents.contentsmanager;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.cms.common.util.FileUpload;
import com.cms.dao.contents.contentsmanage.BookDao;
import com.cms.dto.common.BZBoard;

@Service
public class BookService {

	@Value("#{prop['file.upload.system.path']}") private String systemPath;
	@Value("#{prop['file.upload.path.book']}") private String bookPath;
	@Autowired private BookDao bookDao;
	
	public List<BZBoard> getList() {

		List<BZBoard> result = new ArrayList<BZBoard>();
		
		result = bookDao.getList();
		
		for(int i=0; i<result.size(); i++) {
			BZBoard temp = result.get(i);
			temp.setStrFirstImgPath("/Upload/cMng/"+temp.getStrFirstImg());
			result.set(i, temp);
		}
		
		return result;
		
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	public void setBook(BZBoard bzBoard, MultipartRequest multipartReq) {
		
		Iterator<String> fileNames = multipartReq.getFileNames();
		
		MultipartFile imgUrl = multipartReq.getFile("imgUrl_file");
		
		if((!imgUrl.isEmpty()) && (imgUrl != null)) {
			bzBoard.setStrFirstImg(imgUrl.getOriginalFilename());
		}
		
		//1. BZBoard_v2 insert
		bookDao.setBook(bzBoard);
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile file = multipartReq.getFile(fileName);
			
			if(!file.isEmpty()) {
				FileUpload.fileUpload(file, systemPath+File.separator+bookPath);
			}
		}
		
		// 2. BZBoard_Scrap_v2 insert
		// BZBoard_v2에는 intBoardID가 없어서 BZBoard_Scrap_v2에 매칭되도록 설계되어있다. (내가 설계한거 아님..)
		bookDao.setBookScarp(bzBoard.getIdx());
		
	}

	public BZBoard getBook(int idx) {
		BZBoard result = bookDao.getBook(idx);
		result.setStrFirstImgPath(bookPath+File.separator+result.getStrFirstImg());
		return result;
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	public void removeBook(int idx) {
		bookDao.removeBook(idx);
		bookDao.removeBookScrap(idx);
	}

	@Transactional
	public void modifyBook(BZBoard bzBoard , MultipartRequest multipartReq) {
		
		Iterator<String> fileNames = multipartReq.getFileNames();
		MultipartFile imgUrl = multipartReq.getFile("imgUrl_file");
		
		if((!imgUrl.isEmpty()) && (imgUrl != null)) {
			bzBoard.setStrFirstImg(imgUrl.getOriginalFilename());
		}
		
		bookDao.modifyBook(bzBoard);
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile file = multipartReq.getFile(fileName);
			
			if(!file.isEmpty()) {
				FileUpload.fileUpload(file, systemPath+File.separator+bookPath);
			}
		}
		
	}

}
