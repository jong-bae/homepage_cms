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
import com.cms.dao.homepage.PopupDao;
import com.cms.dto.homepage.Popup;

/**
 * 
 * @ClassName PopupService
 * @description
 * @author JB
 * @since 2020. 10. 26.
 */
@Service
public class PopupService {

	@Autowired private PopupDao popupDao;
	@Value("#{prop['file.upload.url.path']}") private String uploadPath;
	@Value("#{prop['file.upload.system.path']}") private String systemPath;
	@Value("#{prop['file.upload.path.popup']}") private String subPath;
	
	/**
	 * 
	 * @name getPopupList
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2020. 10. 26.
	 */
	public List<Popup> getPopupList() {
		return getPopupList_m();
		/*if(param.equals("pc")) {
			return getPopupList_pc();
		} else {
		}*/
	}
	
	/**
	 * 
	 * @name getPopupList_pc
	 * @description PC 팝업 리스트 조회
	 * @return
	 * @author JB
	 * @since 2020. 11. 12.
	 */
	public List<Popup> getPopupList_pc() {
		return popupDao.getPopupList_pc();
	}
	
	/**
	 * 
	 * @name getPopupList_m
	 * @description M 팝업리스트 조회
	 * @return
	 * @author JB
	 * @since 2020. 11. 12.
	 */
	public List<Popup> getPopupList_m() {
		List<Popup> mList = popupDao.getPopupList_m();
		
		for(Popup tmp : mList) {
			String []branchList = tmp.getbCodeList().split(",");
			tmp.setBranchCnt(branchList.length);
		}
		
		return mList;
	}
	
	/**
	 * 
	 * @name setPopup_mobile
	 * @description 모바일팝업 등록
	 * @param popup
	 * @param multipartReq
	 * @author JB
	 * @since 2020. 11. 5.
	 */
	public void setPopup_mobile(Popup popup, MultipartRequest multipartReq) {
		MultipartFile popupImg_file = multipartReq.getFile("popupImg_file");
		
		if(!popupImg_file.isEmpty()) {
			popup.setPopupImg(uploadPath + "/" + subPath + "/" + popupImg_file.getOriginalFilename());
			FileUpload.fileUpload(popupImg_file, systemPath+File.separator+subPath);
		}
		
		popupDao.setPopup_mobile(popup);
	}
	
	/**
	 * 
	 * @name getPopup
	 * @description
	 * @param kind
	 * @param idx
	 * @return
	 * @author JB
	 * @since 2020. 11. 10.
	 */
	public Popup getPopup(String kind, int idx) {
		Popup popupData;
		if(kind.equals("pc")) {
			return popupDao.getPopup_pc(idx);
		} else {
			popupData = popupDao.getPopup_mobile(idx);
			String []branchArr = popupData.getbCodeList().split(",");
			popupData.setBranchList(Arrays.asList(branchArr));
			return popupData;
		}
	}
	
	/**
	 * 
	 * @name modifyPopup_mobile
	 * @description
	 * @param popup
	 * @param multipartReq
	 * @author JB
	 * @since 2020. 11. 26.
	 */
	public void modifyPopup_mobile(Popup popup, MultipartRequest multipartReq) {
		MultipartFile popupImg_file = multipartReq.getFile("popupImg_file");
		
		if(!popupImg_file.isEmpty()) {
			popup.setPopupImg(uploadPath + "/" + subPath + "/" + popupImg_file.getOriginalFilename());
			FileUpload.fileUpload(popupImg_file, systemPath+File.separator+subPath);
		} else {
			popup.setPopupImg(popup.getPopupImg_origin());
		}
		
		popupDao.modifyPopup_mobile(popup);
	}
	
	/**
	 * 
	 * @name removePopup_mobile
	 * @description
	 * @param idx
	 * @author JB
	 * @since 2020. 12. 21.
	 */
	public void removePopup_mobile(int idx) {
		popupDao.removePopup_mobile(idx);
	}
}
