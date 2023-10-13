package com.cms.dto.homepage;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 
 * @ClassName Popup
 * @description 팝업관리 DTO
 * @author JB
 * @since 2020. 10. 26.
 */
public class Popup {

	private int idx;
	private String bCode;
	private String bCodeList;
	private String Exposure;
	private String bName;
	private String title;
	private String content;
	private int width;
	private int height;
	private int top;
	private int left;
	private String sDate;			// PC 용 변수
	private String eDate;			// PC 용 변수
	private int order;
	@JsonFormat(pattern="yyyy-MM-dd")
	private String startDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private String endDate;
	private String useYN;
	private String cookieYN;
	private String popCode;
	
	private String description;
	private String popupImg;
	private String popupImg_origin;
	private String url;
	private String url_Option;
	private String urlYN;
	
	private String kind;			// PC/M 구분
	private int branchCnt;
	private List<String> branchList;
	
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date modDate;
	private String regID;
	private String modID;
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}
	
	public String getExposure() {
		return Exposure;
	}

	public void setExposure(String exposure) {
		Exposure = exposure;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getTop() {
		return top;
	}

	public void setTop(int top) {
		this.top = top;
	}

	public int getLeft() {
		return left;
	}

	public void setLeft(int left) {
		this.left = left;
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

	public String getUseYN() {
		return useYN;
	}

	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}

	public String getCookieYN() {
		return cookieYN;
	}

	public void setCookieYN(String cookieYN) {
		this.cookieYN = cookieYN;
	}

	public String getPopCode() {
		return popCode;
	}

	public void setPopCode(String popCode) {
		this.popCode = popCode;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPopupImg() {
		return popupImg;
	}

	public void setPopupImg(String popupImg) {
		this.popupImg = popupImg;
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

	public String getUrlYN() {
		return urlYN;
	}

	public void setUrlYN(String urlYN) {
		this.urlYN = urlYN;
	}

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

	public String getRegID() {
		return regID;
	}

	public void setRegID(String regID) {
		this.regID = regID;
	}

	public String getModID() {
		return modID;
	}

	public void setModID(String modID) {
		this.modID = modID;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getBranchCnt() {
		return branchCnt;
	}

	public void setBranchCnt(int branchCnt) {
		this.branchCnt = branchCnt;
	}

	public String getbCodeList() {
		return bCodeList;
	}

	public void setbCodeList(String bCodeList) {
		this.bCodeList = bCodeList;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String geteDate() {
		return eDate;
	}

	public void seteDate(String eDate) {
		this.eDate = eDate;
	}

	public List<String> getBranchList() {
		return branchList;
	}

	public void setBranchList(List<String> branchList) {
		this.branchList = branchList;
	}

	public String getPopupImg_origin() {
		return popupImg_origin;
	}

	public void setPopupImg_origin(String popupImg_origin) {
		this.popupImg_origin = popupImg_origin;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}
	
}
