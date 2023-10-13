package com.cms.service.homepage;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import com.cms.common.util.HttpApiUtil;
import com.cms.dto.homepage.BranchApi;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.AsyncRestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.cms.common.util.FileUpload;
import com.cms.dao.homepage.BranchDao;
import com.cms.dto.homepage.Branch;

/**
 * 
 * @ClassName BranchService
 * @description 병의원 관리 서비스
 * @author JB
 * @since 2020. 10. 15.
 */
@Service
public class BranchService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Value("#{prop['file.upload.url.path']}") private String uploadPath;
	@Value("#{prop['file.upload.system.path']}") private String systemPath;
	@Value("#{prop['file.upload.path.branch']}") private String subPath;
	@Autowired private BranchDao branchDao;
	@Autowired private AsyncRestTemplate asyncRestTemplate;
	
	/**
	 * 
	 * @name getBranchList
	 * @description 병의원 리스트 조회
	 * @return
	 * @author JB
	 * @since 2020. 10. 15.
	 */
	public List<Branch> getBranchList() {
		return branchDao.getBranchList();
	}
	
	/**
	 * 
	 * @name setBranch
	 * @description 병의원 등록
	 * @param branch
	 * @param multipartReq
	 * @author JB
	 * @since 2020. 10. 22.
	 */
	@Transactional
	public void setBranch(Branch branch, MultipartRequest multipartReq) {
		Iterator<String> fileNames = multipartReq.getFileNames();
		MultipartFile ciImg_file = multipartReq.getFile("bCiImg_file");
		MultipartFile cert01_file = multipartReq.getFile("bCertImg01_file");
		MultipartFile cert02_file = multipartReq.getFile("bCertImg02_file");
		
		if(!ciImg_file.isEmpty()) {
			branch.setbCiImg(uploadPath + "/" + subPath + "/" + ciImg_file.getOriginalFilename());
		}
		if(!cert01_file.isEmpty()) {
			branch.setbCertImg01(uploadPath + "/" + subPath + "/" + cert01_file.getOriginalFilename());
		}
		if(!cert02_file.isEmpty()) {
			branch.setbCertImg02(uploadPath + "/" + subPath + "/" + cert02_file.getOriginalFilename());
		}
		
		branchDao.setBranch(branch);
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile file = multipartReq.getFile(fileName);
			
			if(!file.isEmpty()) {
				FileUpload.fileUpload(file, systemPath+File.separator+subPath);
			}
//			logger.warn(file.getContentType());			// image/png
//			logger.warn(file.getOriginalFilename());	// logo10010.png
//			logger.warn(file.getSize()+"");				// 5837
		}
		
	}
	
	/**
	 * 
	 * @name getBranch
	 * @description 선택 병의원 조회
	 * @param idx
	 * @return
	 * @author JB
	 * @since 2020. 10. 16.
	 */
	public Branch getBranch(int idx) {
		return branchDao.getBranch(idx);
	}
	
	/**
	 * 
	 * @name modifyBranch
	 * @description 병의원 수정
	 * @param branch
	 * @param multipartReq
	 * @author JB
	 * @since 2020. 10. 23.
	 */
	@Transactional
	public void modifyBranch(Branch branch, MultipartRequest multipartReq) {
		Iterator<String> fileNames = multipartReq.getFileNames();
		MultipartFile ciImg_file = multipartReq.getFile("bCiImg_file");
		MultipartFile cert01_file = multipartReq.getFile("bCertImg01_file");
		MultipartFile cert02_file = multipartReq.getFile("bCertImg02_file");

		HttpApiUtil httpApiUtil = new HttpApiUtil(asyncRestTemplate);
		
		if(!ciImg_file.isEmpty()) {
			branch.setbCiImg(uploadPath + "/" + subPath + "/" + ciImg_file.getOriginalFilename());
		} else {
			branch.setbCiImg(branch.getbCiImg_origin());
		}
		if(!cert01_file.isEmpty()) {
			branch.setbCertImg01(uploadPath + "/" + subPath + "/" + cert01_file.getOriginalFilename());
		} else {
			branch.setbCertImg01(branch.getbCertImg01_origin());
		}
		if(!cert02_file.isEmpty()) {
			branch.setbCertImg02(uploadPath + "/" + subPath + "/" + cert02_file.getOriginalFilename());
		} else {
			branch.setbCertImg02(branch.getbCertImg02_origin());
		}
		
		branchDao.modifyBranch(branch);
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile file = multipartReq.getFile(fileName);
			
			if(!file.isEmpty()) {
				FileUpload.fileUpload(file, systemPath+File.separator+subPath);
			}
		}
	    try {

			httpApiUtil.callPostApi("http://aio.jaseng.co.kr/api/setBranch", new BranchApi(Integer.toString(branch.getbCode()),
					branch.getbName(), branch.getbAddr(), branch.getbFolder(), branch.getbDomain(), branch.getbHospital(),
					branch.getbCiImg_origin(), branch.getbOrder(), branch.getbStatus()));
		} catch(Exception e) {
			e.printStackTrace();
		}


	}
	
}
