package com.cms.service.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.cms.common.util.FileUpload;
import com.cms.dao.common.CommonDao;
import com.cms.dto.common.BZCode;
import com.cms.dto.common.CKEditor;
import com.cms.dto.common.JasengBranchCode;
import com.cms.dto.doctor.Doctor;

/**
 * 
 * @ClassName CommonService
 * @description 공통부 서비스
 * @author JB
 * @since 2020. 10. 5.
 */
@Service
public class CommonService {

	@Value("#{prop['file.upload.url.path']}") private String uploadPath;
	@Value("#{prop['file.upload.system.path']}") private String systemPath;
	@Value("#{prop['file.upload.path.editor']}") private String subPath;
	@Autowired private CommonDao commonDao;
	
	/**
	 * 
	 * @name getBCodeSelectBox
	 * @description 병의원 셀렉트박스 공통서비스
	 * @return
	 * @author JB
	 * @since 2020. 10. 5.
	 */
	public List<JasengBranchCode> getBCodeSelectBox() {
		return commonDao.getBCodeSelectBox();
	}
	
	/**
	 * 
	 * @name getBranchName
	 * @description bCodeList String Array로 BranchName 받아오기
	 * @param param
	 * @return
	 * @author JB
	 * @since 2020. 12. 17.
	 */
	public List<String> getBranchName(String[] param) {
		HashMap<String, String[]> map = new HashMap<String, String[]>();
		map.put("bcode", param);
		List<JasengBranchCode> data = commonDao.getBranchName(map);
		List<String> branchName = new ArrayList<String>();
		
		for(JasengBranchCode tmp : data) {
			branchName.add(tmp.getbName());
		}
		
		return branchName;
	}
	
	/**
	 * 
	 * @name editorUpload
	 * @description
	 * @param multipartReq
	 * @author JB
	 * @since 2020. 10. 28.
	 */
	public CKEditor editorUpload(MultipartRequest multipartReq) {
		MultipartFile file = multipartReq.getFile("upload");
		CKEditor returnJson = new CKEditor();
		
		if(!file.isEmpty()) {
			FileUpload.fileUpload(file, systemPath+File.separator+subPath);
		}
		
		returnJson.setUploaded(1);		// 0 이면 전송 실패
		returnJson.setFileName(file.getOriginalFilename());
		returnJson.setUrl(uploadPath+"/"+subPath+"/"+file.getOriginalFilename());
		
		return returnJson;
	}
	
	/**
	 * 
	 * @name getBranchList
	 * @description
	 * @return
	 * @author JB
	 * @since 2021. 2. 23.
	 */
	public List<JasengBranchCode> getBranchList() {
		return commonDao.getBranchList();
	}
	
	/**
	 * 
	 * @name getNPaymentCodeList
	 * @description
	 * @param code
	 * @return
	 * @author JB
	 * @since 2021. 6. 4.
	 */
	public List<BZCode> getNPaymentCodeList(String code) {
		return commonDao.getNPaymentCodeList(code);
	}
	
	/**
	 * 
	 * @name getBranchEnName
	 * @description
	 * @param bcode
	 * @return
	 * @author JB
	 * @since 2021. 8. 31.
	 */
	public String getBranchEnName(String bcode) {
		return commonDao.getBranchEnName(bcode);
	}
	
	/**
	 * 
	 * @name getDoctorSelectBox
	 * @description 의료진 선택박스 공통부
	 * @return
	 * @author JB
	 * @since 2022. 7. 18.
	 */
	public List<Doctor> getDoctorSelectBox() {
		return commonDao.getDoctorSelectBox();
	}
}
