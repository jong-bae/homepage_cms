package com.cms.service.homepage;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.cms.common.util.FileUpload;
import com.cms.dao.homepage.MainpageTopDao;
import com.cms.dto.homepage.MainpageBanner;
import com.cms.service.common.CommonService;

/**
 * 
 * @ClassName MainpageService
 * @description
 * @author JB
 * @since 2020. 11. 17.
 */
@Service
public class MainpageTopService {

	@Autowired private MainpageTopDao mainpageDao;
	@Autowired private CommonService commonService;
	@Value("#{prop['file.upload.url.path']}") private String uploadPath;
	@Value("#{prop['file.upload.system.path']}") private String systemPath;
	@Value("#{prop['file.upload.path.mainpage']}") private String subPath;
	
	/**
	 * 
	 * @name getMainpageList
	 * @description 메인관리 전체 리스트 조회
	 * @return
	 * @author JB
	 * @since 2020. 11. 17.
	 */
	public List<MainpageBanner> getMainpageList() {
		List<MainpageBanner> bannerList = mainpageDao.getMainpageList();
		
		for(MainpageBanner tmp : bannerList) {
			String []branchList = tmp.getbCodeList().split(",");
			tmp.setBranchNameList(commonService.getBranchName(branchList));
			tmp.setBranchCnt(branchList.length);
		}
		return bannerList;
	}
	
	/**
	 * 
	 * @name setMainpageTopMobile
	 * @description 신규 데이터 저장
	 * @param param
	 * @param multipartReq
	 * @author JB
	 * @since 2020. 11. 18.
	 */
	public void setMainpageTopMobile(MainpageBanner param, MultipartRequest multipartReq) {
		
		MultipartFile bannerImg_file_pc = multipartReq.getFile("bannerImg_file_pc");
		MultipartFile bannerImg_file = multipartReq.getFile("bannerImg_file");
		
		if(!bannerImg_file_pc.isEmpty()) {
			
			param.setBannerImgPc(uploadPath + "/" + subPath + "/" + bannerImg_file_pc.getOriginalFilename());
			FileUpload.fileUpload(bannerImg_file_pc, systemPath+File.separator+subPath);
		}
		
		if(!bannerImg_file.isEmpty()) {
			param.setBannerImg(uploadPath + "/" + subPath + "/" + bannerImg_file.getOriginalFilename());
			FileUpload.fileUpload(bannerImg_file, systemPath+File.separator+subPath);
		}
		mainpageDao.setMainpageTopMobile(param);
	}
	
	/**
	 * 
	 * @name getMainpage_mobile
	 * @description 메인관리 데이터 선택 조회
	 * @param idx
	 * @return
	 * @author JB
	 * @since 2020. 11. 26.
	 */
	public MainpageBanner getMainpage_mobile(int idx) {
		MainpageBanner bannerData = mainpageDao.getMainpage_mobile(idx);
		String []branchArr = bannerData.getbCodeList().split(",");
		bannerData.setBranchList(Arrays.asList(branchArr));
		return bannerData;
	}

	/**
	 * 
	 * @name modifyMainpageBanner_mobile
	 * @description 메인관리 수정
	 * @param banner
	 * @param multipartReq
	 * @author JB
	 * @since 2020. 11. 26.
	 */
	public void modifyMainpageBanner_mobile(MainpageBanner banner, MultipartRequest multipartReq) {
		
		MultipartFile bannerImg_file_pc = multipartReq.getFile("bannerImg_file_pc");
		MultipartFile bannerImg_file = multipartReq.getFile("bannerImg_file");
		
		if(!bannerImg_file_pc.isEmpty()) {
			banner.setBannerImgPc(uploadPath + "/" + subPath + "/" + bannerImg_file_pc.getOriginalFilename());
			FileUpload.fileUpload(bannerImg_file_pc, systemPath+File.separator+subPath);
		} else {
			banner.setBannerImgPc(banner.getBannerImg_origin_pc());
		}
		
		if(!bannerImg_file.isEmpty()) {
			banner.setBannerImg(uploadPath + "/" + subPath + "/" + bannerImg_file.getOriginalFilename());
			FileUpload.fileUpload(bannerImg_file, systemPath+File.separator+subPath);
		} else {
			banner.setBannerImg(banner.getBannerImg_origin());
		}
		
		mainpageDao.modifyMainpageBanner_mobile(banner);
	}

	/**
	 * 
	 * @name removeMainpageBanner_mobile
	 * @description
	 * @param idx
	 * @author JB
	 * @since 2020. 12. 21.
	 */
	public void removeMainpageBanner_mobile(int idx) {
		mainpageDao.removeMainpageBanner_mobile(idx);
	}
}
