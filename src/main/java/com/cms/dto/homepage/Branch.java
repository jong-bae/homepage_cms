package com.cms.dto.homepage;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.cms.dto.common.JasengBranchCode;

/**
 * 
 * @ClassName Branch
 * @description 병의원
 * @author JB
 * @since 2020. 10. 15.
 */
public class Branch extends JasengBranchCode {
	
	private String bFolder;
	private String bCiImg_origin;
	private String bCertImg01_origin;
	private String bCertImg02_origin;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	
	public String getbFolder() {
		return bFolder;
	}
	public void setbFolder(String bFolder) {
		this.bFolder = bFolder;
	}
	
	public String getbCiImg_origin() {
		return bCiImg_origin;
	}
	public void setbCiImg_origin(String bCiImg_origin) {
		this.bCiImg_origin = bCiImg_origin;
	}
	public String getbCertImg01_origin() {
		return bCertImg01_origin;
	}
	public void setbCertImg01_origin(String bCertImg01_origin) {
		this.bCertImg01_origin = bCertImg01_origin;
	}
	public String getbCertImg02_origin() {
		return bCertImg02_origin;
	}
	public void setbCertImg02_origin(String bCertImg02_origin) {
		this.bCertImg02_origin = bCertImg02_origin;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
