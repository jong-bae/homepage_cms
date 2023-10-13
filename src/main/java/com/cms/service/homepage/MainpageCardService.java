package com.cms.service.homepage;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.cms.common.util.FileUpload;
import com.cms.dao.homepage.MainpageCardDao;
import com.cms.dto.homepage.MainpageCard;

/**
 * 
 * @ClassName MainpageCardService
 * @description
 * @author JB
 * @since 2020. 12. 10.
 */
@Service
public class MainpageCardService {

	@Autowired private MainpageCardDao mainpageCardDao;
	@Value("#{prop['file.upload.url.path']}") private String uploadPath;
	@Value("#{prop['file.upload.system.path']}") private String systemPath;
	@Value("#{prop['file.upload.path.mainpage']}") private String subPath;
	
	/**
	 * 
	 * @name getMainpageCardList
	 * @description
	 * @return
	 * @author JB
	 * @since 2020. 12. 10.
	 */
	public List<MainpageCard> getMainpageCardList() {
		return mainpageCardDao.getMainpageCardList();
	}
	
	/**
	 * 
	 * @name setMainpageCard
	 * @description
	 * @param card
	 * @param multipartReq
	 * @author JB
	 * @since 2020. 12. 14.
	 */
	public void setMainpageCard(MainpageCard card, MultipartRequest multipartReq) {
		MultipartFile contentImg1_file = multipartReq.getFile("contentImg1_file");
		MultipartFile contentImg2_file = multipartReq.getFile("contentImg2_file");
		MultipartFile contentImg3_file = multipartReq.getFile("contentImg3_file");
		MultipartFile contentImg4_file = multipartReq.getFile("contentImg4_file");
		
		if(!contentImg1_file.isEmpty()) {
			card.setContentImg1(uploadPath + "/" + subPath + "/" + contentImg1_file.getOriginalFilename());
			FileUpload.fileUpload(contentImg1_file, systemPath+File.separator+subPath);
		}
		if(!contentImg2_file.isEmpty()) {
			card.setContentImg2(uploadPath + "/" + subPath + "/" + contentImg2_file.getOriginalFilename());
			FileUpload.fileUpload(contentImg2_file, systemPath+File.separator+subPath);
		}
		if(!contentImg3_file.isEmpty()) {
			card.setContentImg3(uploadPath + "/" + subPath + "/" + contentImg3_file.getOriginalFilename());
			FileUpload.fileUpload(contentImg3_file, systemPath+File.separator+subPath);
		}
		if(!contentImg4_file.isEmpty()) {
			card.setContentImg4(uploadPath + "/" + subPath + "/" + contentImg4_file.getOriginalFilename());
			FileUpload.fileUpload(contentImg4_file, systemPath+File.separator+subPath);
		}
		
		mainpageCardDao.setMainpageCard(card);
	}

	/**
	 * 
	 * @name getMainpageCard
	 * @description
	 * @param idx
	 * @return
	 * @author JB
	 * @since 2020. 12. 16.
	 */
	public MainpageCard getMainpageCard(int idx) {
		return mainpageCardDao.getMainpageCard(idx);
	}
	
	/**
	 * 
	 * @name modifyMainpageCard
	 * @description
	 * @param card
	 * @param multipardReq
	 * @author JB
	 * @since 2020. 12. 16.
	 */
	public void modifyMainpageCard(MainpageCard card, MultipartRequest multipartReq) {
		MultipartFile contentImg1_file = multipartReq.getFile("contentImg1_file");
		MultipartFile contentImg2_file = multipartReq.getFile("contentImg2_file");
		MultipartFile contentImg3_file = multipartReq.getFile("contentImg3_file");
		MultipartFile contentImg4_file = multipartReq.getFile("contentImg4_file");

		if(!contentImg1_file.isEmpty()) {
			card.setContentImg1(uploadPath + "/" + subPath + "/" + contentImg1_file.getOriginalFilename());
			FileUpload.fileUpload(contentImg1_file, systemPath+File.separator+subPath);
		} else {
			card.setContentImg1(card.getContentImg1_origin());
		}
		if(!contentImg2_file.isEmpty()) {
			card.setContentImg2(uploadPath + "/" + subPath + "/" + contentImg2_file.getOriginalFilename());
			FileUpload.fileUpload(contentImg2_file, systemPath+File.separator+subPath);
		} else {
			card.setContentImg2(card.getContentImg2_origin());
		}
		if(!contentImg3_file.isEmpty()) {
			card.setContentImg3(uploadPath + "/" + subPath + "/" + contentImg3_file.getOriginalFilename());
			FileUpload.fileUpload(contentImg3_file, systemPath+File.separator+subPath);
		} else {
			card.setContentImg3(card.getContentImg3_origin());
		}
		if(!contentImg4_file.isEmpty()) {
			card.setContentImg4(uploadPath + "/" + subPath + "/" + contentImg4_file.getOriginalFilename());
			FileUpload.fileUpload(contentImg4_file, systemPath+File.separator+subPath);
		} else {
			card.setContentImg4(card.getContentImg4_origin());
		}
		
		mainpageCardDao.modifyMainpageCard(card);
		
	}
	
	/**
	 * 
	 * @name removeMainpageCard
	 * @description
	 * @param idx
	 * @author JB
	 * @since 2020. 12. 21.
	 */
	public void removeMainpageCard(int idx) {
		mainpageCardDao.removeMainpageCard(idx);
	}
}
