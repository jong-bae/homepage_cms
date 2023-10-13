package com.cms.service.doctor;

import java.io.File;
import java.util.List;

import com.cms.common.util.HttpApiUtil;
import com.cms.dto.doctor.DoctorApi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.AsyncRestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.cms.common.util.FileUpload;
import com.cms.dao.doctor.DoctorDao;
import com.cms.dto.doctor.Doctor;

/**
 * 
 * @ClassName DoctorManageService
 * @description
 * @author JB
 * @since 2021. 2. 10.
 */
@Service
public class DoctorManageService {
	
	@Autowired private DoctorDao doctorDao;
	@Autowired private AsyncRestTemplate asyncRestTemplate;

	@Value("#{prop['file.upload.url.path']}") private String uploadPath;
	@Value("#{prop['file.upload.system.path']}") private String systemPath;
	@Value("#{prop['file.upload.path.doctor']}") private String subPath;
	
	/**
	 * 
	 * @name getDoctorAllList
	 * @description 의료진 전체리스트 조회
	 * @return
	 * @author JB
	 * @since 2021. 2. 10.
	 */
	public List<Doctor> getDoctorAllList() {
		return doctorDao.getDoctorAllList();
	}
	
	/**
	 * 
	 * @name setDoctor
	 * @description
	 * @param doctor
	 * @author JB
	 * @since 2021. 2. 17.
	 */
	public void setDoctor(Doctor doctor, MultipartRequest multipartReq) {
		MultipartFile imgFile_File = multipartReq.getFile("imgFile_File");
		MultipartFile imgFileXL_File = multipartReq.getFile("imgFileXL_File");
		MultipartFile bgFile_File = multipartReq.getFile("bgFile_File");
		MultipartFile mbgFile_File = multipartReq.getFile("mbgFile_File");

		HttpApiUtil httpApiUtil = new HttpApiUtil(asyncRestTemplate);
		
		if(!imgFile_File.isEmpty()) {
			doctor.setImgFile(uploadPath + "/" + subPath + "/" + imgFile_File.getOriginalFilename());
			FileUpload.fileUpload(imgFile_File, systemPath+File.separator+subPath);
		}
		if(!imgFileXL_File.isEmpty()) {
			doctor.setImgFileXL(uploadPath + "/" + subPath + "/" + "pc/" + imgFileXL_File.getOriginalFilename());
			FileUpload.fileUpload(imgFileXL_File, systemPath+File.separator+subPath+File.separator+"pc");
		}
		if(!bgFile_File.isEmpty()) {
			doctor.setBgFile(uploadPath + "/" + subPath + "/" + "pc/" + bgFile_File.getOriginalFilename());
			FileUpload.fileUpload(bgFile_File, systemPath+File.separator+subPath+File.separator+"pc");
		}
		if(!mbgFile_File.isEmpty()) {
			doctor.setMbgFile(uploadPath + "/" + subPath + "/" + "m/" + mbgFile_File.getOriginalFilename());
			FileUpload.fileUpload(mbgFile_File, systemPath+File.separator+subPath+File.separator+"m");
		}
		
		doctorDao.setDoctor(doctor);

		try {
			httpApiUtil.callPostApi("http://localhost:8777/api/setDoctor", new DoctorApi(doctor.getDidx(),
					doctor.getName(), doctor.getIdno(), doctor.getNewidno(), doctor.getUseYN()) );
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @name getDoctor
	 * @description
	 * @param idx
	 * @return
	 * @author JB
	 * @since 2021. 2. 18.
	 */
	public Doctor getDoctor(int idx) {
		return doctorDao.getDoctor(idx);
	}
	
	/**
	 * 
	 * @name modifyDoctor
	 * @description
	 * @param doctor
	 * @param multipartReq
	 * @author JB
	 * @since 2021. 2. 19.
	 */
	public void modifyDoctor(Doctor doctor, MultipartRequest multipartReq) {
		MultipartFile imgFile_File = multipartReq.getFile("imgFile_File");
		MultipartFile imgFileXL_File = multipartReq.getFile("imgFileXL_File");
		MultipartFile bgFile_File = multipartReq.getFile("bgFile_File");
		MultipartFile mbgFile_File = multipartReq.getFile("mbgFile_File");

		HttpApiUtil httpApiUtil = new HttpApiUtil(asyncRestTemplate);
		
		if(!imgFile_File.isEmpty()) {
			doctor.setImgFile(uploadPath + "/" + subPath + "/" + imgFile_File.getOriginalFilename());
			FileUpload.fileUpload(imgFile_File, systemPath+File.separator+subPath);
		} else {
			doctor.setImgFile(doctor.getImgFile_origin());
		}
		if(!imgFileXL_File.isEmpty()) {
			doctor.setImgFileXL(uploadPath + "/" + subPath + "/" + "pc/" + imgFileXL_File.getOriginalFilename());
			FileUpload.fileUpload(imgFileXL_File, systemPath+File.separator+subPath+File.separator+"pc");
		} else {
			doctor.setImgFileXL(doctor.getImgFileXL_origin());
		}
		if(!bgFile_File.isEmpty()) {
			doctor.setBgFile(uploadPath + "/" + subPath + "/" + "pc/" + bgFile_File.getOriginalFilename());
			FileUpload.fileUpload(bgFile_File, systemPath+File.separator+subPath+File.separator+"pc");
		} else {
			doctor.setBgFile(doctor.getBgFile_origin());
		}
		if(!mbgFile_File.isEmpty()) {
			doctor.setMbgFile(uploadPath + "/" + subPath + "/" + "m/" + mbgFile_File.getOriginalFilename());
			FileUpload.fileUpload(mbgFile_File, systemPath+File.separator+subPath+File.separator+"m");
		} else {
			doctor.setMbgFile(doctor.getMbgFile_origin());
		}
		
		doctorDao.modifyDoctor(doctor);

		try {
			httpApiUtil.callPostApi("http://aio.jaseng.co.kr/api/setDoctor", new DoctorApi(doctor.getDidx(),
					doctor.getName(), doctor.getIdno(), doctor.getNewidno(), doctor.getUseYN()) );
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @name resiSwap
	 * @description
	 * @param didx
	 * @return
	 * @author JB
	 * @since 2021. 2. 22.
	 */
	public boolean resiSwap(int didx) {
		int rowCnt = doctorDao.resiSwap(didx);
		if(rowCnt == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 
	 * @name taSwap
	 * @description
	 * @param didx
	 * @return
	 * @author JB
	 * @since 2021. 2. 23.
	 */
	public boolean taSwap(int didx) {
		int rowCnt = doctorDao.taSwap(didx);
		if(rowCnt == 1) {
			return true;
		} else {
			return false;
		}
	}
	
}
