package com.cms.dto.homepage;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 
 * @ClassName MainpageBanner
 * @description Main Top Banner DTO
 * @author JB
 * @since 2020. 11. 17.
 */
public class MainpageBanner {

	private int idx;
	private String bCodeList;
	private String Exposure;
	private String bannerImgPc;
	private String bannerImg;	
	private String titleTop;
	private String titleMain;
	private String description;
	private String url;
	private String url_Option;
	private String useYN;
	private int order;
	private String startDate;
	private String endDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private String regID;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date modDate;
	private String modID;
	
	private List<String> branchList;
	private List<String> branchNameList;
	private String bannerImg_origin_pc;
	private String bannerImg_origin;	
	
	private int branchCnt;
		
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getbCodeList() {
		return bCodeList;
	}
	public void setbCodeList(String bCodeList) {
		this.bCodeList = bCodeList;
	}
	public String getExposure() {
		return Exposure;
	}
	public void setExposure(String exposure) {
		Exposure = exposure;
	}
	public String getBannerImgPc() {
		return bannerImgPc;
	}
	public void setBannerImgPc(String bannerImgPc) {
		this.bannerImgPc = bannerImgPc;
	}
	public String getBannerImg() {
		return bannerImg;
	}
	public void setBannerImg(String bannerImg) {
		this.bannerImg = bannerImg;
	}
	public String getTitleTop() {
		return titleTop;
	}
	public void setTitleTop(String titleTop) {
		this.titleTop = titleTop;
	}
	public String getTitleMain() {
		return titleMain;
	}
	public void setTitleMain(String titleMain) {
		this.titleMain = titleMain;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUrl_Option() {
		return url_Option;
	}
	public void setUrl_Option(String url_Option) {
		this.url_Option = url_Option;
	}
	public String getUseYN() {
		return useYN;
	}
	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getRegID() {
		return regID;
	}
	public void setRegID(String regID) {
		this.regID = regID;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	public String getModID() {
		return modID;
	}
	public void setModID(String modID) {
		this.modID = modID;
	}
	public List<String> getBranchList() {
		return branchList;
	}
	public void setBranchList(List<String> branchList) {
		this.branchList = branchList;
	}
	public String getBannerImg_origin_pc() {
		return bannerImg_origin_pc;
	}
	public void setBannerImg_origin_pc(String bannerImg_origin_pc) {
		this.bannerImg_origin_pc = bannerImg_origin_pc;
	}
	public String getBannerImg_origin() {
		return bannerImg_origin;
	}
	public void setBannerImg_origin(String bannerImg_origin) {
		this.bannerImg_origin = bannerImg_origin;
	}
	public int getBranchCnt() {
		return branchCnt;
	}
	public void setBranchCnt(int branchCnt) {
		this.branchCnt = branchCnt;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public List<String> getBranchNameList() {
		return branchNameList;
	}
	public void setBranchNameList(List<String> branchNameList) {
		this.branchNameList = branchNameList;
	}
	
}
