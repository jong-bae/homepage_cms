package com.cms.dto.homepage;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MainpageCard {

	private int idx;
	private String title;
	@JsonFormat(pattern="yyyy-MM-dd")
	private String startDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private String endDate;
	
	private String keyword1;
	private String keywordLink1;
	private String keywordLink1_opt;
	private String keyword2;
	private String keywordLink2;
	private String keywordLink2_opt;
	private String keyword3;
	private String keywordLink3;
	private String keywordLink3_opt;
	private String keyword4;
	private String keywordLink4;
	private String keywordLink4_opt;
	private String keywordOrder;
	
	private String contentTitle1;
	private String contentLink1;
	private String contentLink1_opt;
	private String contentImg1;
	private String contentImg1_origin;
	private String contentOrder1;
	private String contentTitle2;
	private String contentLink2;
	private String contentLink2_opt;
	private String contentImg2;
	private String contentImg2_origin;
	private String contentOrder2;
	private String contentTitle3;
	private String contentLink3;
	private String contentLink3_opt;
	private String contentImg3;
	private String contentImg3_origin;
	private String contentOrder3;
	private String contentTitle4;
	private String contentLink4;
	private String contentLink4_opt;
	private String contentImg4;
	private String contentImg4_origin;
	private String contentOrder4;
	
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private String regID;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date modDate;
	private String modID;

	private String mobile_yn;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String getKeywordLink1() {
		return keywordLink1;
	}
	public void setKeywordLink1(String keywordLink1) {
		this.keywordLink1 = keywordLink1;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	public String getKeywordLink2() {
		return keywordLink2;
	}
	public void setKeywordLink2(String keywordLink2) {
		this.keywordLink2 = keywordLink2;
	}
	public String getKeyword3() {
		return keyword3;
	}
	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
	}
	public String getKeywordLink3() {
		return keywordLink3;
	}
	public void setKeywordLink3(String keywordLink3) {
		this.keywordLink3 = keywordLink3;
	}
	public String getKeywordOrder() {
		return keywordOrder;
	}
	public void setKeywordOrder(String keywordOrder) {
		this.keywordOrder = keywordOrder;
	}
	public String getContentTitle1() {
		return contentTitle1;
	}
	public void setContentTitle1(String contentTitle1) {
		this.contentTitle1 = contentTitle1;
	}
	public String getContentLink1() {
		return contentLink1;
	}
	public void setContentLink1(String contentLink1) {
		this.contentLink1 = contentLink1;
	}
	public String getContentImg1() {
		return contentImg1;
	}
	public void setContentImg1(String contentImg1) {
		this.contentImg1 = contentImg1;
	}
	public String getContentImg1_origin() {
		return contentImg1_origin;
	}
	public void setContentImg1_origin(String contentImg1_origin) {
		this.contentImg1_origin = contentImg1_origin;
	}
	public String getContentOrder1() {
		return contentOrder1;
	}
	public void setContentOrder1(String contentOrder1) {
		this.contentOrder1 = contentOrder1;
	}
	public String getContentTitle2() {
		return contentTitle2;
	}
	public void setContentTitle2(String contentTitle2) {
		this.contentTitle2 = contentTitle2;
	}
	public String getContentLink2() {
		return contentLink2;
	}
	public void setContentLink2(String contentLink2) {
		this.contentLink2 = contentLink2;
	}
	public String getContentImg2() {
		return contentImg2;
	}
	public void setContentImg2(String contentImg2) {
		this.contentImg2 = contentImg2;
	}
	public String getContentImg2_origin() {
		return contentImg2_origin;
	}
	public void setContentImg2_origin(String contentImg2_origin) {
		this.contentImg2_origin = contentImg2_origin;
	}
	public String getContentOrder2() {
		return contentOrder2;
	}
	public void setContentOrder2(String contentOrder2) {
		this.contentOrder2 = contentOrder2;
	}
	public String getContentTitle3() {
		return contentTitle3;
	}
	public void setContentTitle3(String contentTitle3) {
		this.contentTitle3 = contentTitle3;
	}
	public String getContentLink3() {
		return contentLink3;
	}
	public void setContentLink3(String contentLink3) {
		this.contentLink3 = contentLink3;
	}
	public String getContentImg3() {
		return contentImg3;
	}
	public void setContentImg3(String contentImg3) {
		this.contentImg3 = contentImg3;
	}
	public String getContentImg3_origin() {
		return contentImg3_origin;
	}
	public void setContentImg3_origin(String contentImg3_origin) {
		this.contentImg3_origin = contentImg3_origin;
	}
	public String getContentOrder3() {
		return contentOrder3;
	}
	public void setContentOrder3(String contentOrder3) {
		this.contentOrder3 = contentOrder3;
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
	public String getKeywordLink1_opt() {
		return keywordLink1_opt;
	}
	public void setKeywordLink1_opt(String keywordLink1_opt) {
		this.keywordLink1_opt = keywordLink1_opt;
	}
	public String getKeywordLink2_opt() {
		return keywordLink2_opt;
	}
	public void setKeywordLink2_opt(String keywordLink2_opt) {
		this.keywordLink2_opt = keywordLink2_opt;
	}
	public String getKeywordLink3_opt() {
		return keywordLink3_opt;
	}
	public void setKeywordLink3_opt(String keywordLink3_opt) {
		this.keywordLink3_opt = keywordLink3_opt;
	}
	public String getContentLink1_opt() {
		return contentLink1_opt;
	}
	public void setContentLink1_opt(String contentLink1_opt) {
		this.contentLink1_opt = contentLink1_opt;
	}
	public String getContentLink2_opt() {
		return contentLink2_opt;
	}
	public void setContentLink2_opt(String contentLink2_opt) {
		this.contentLink2_opt = contentLink2_opt;
	}
	public String getContentLink3_opt() {
		return contentLink3_opt;
	}
	public void setContentLink3_opt(String contentLink3_opt) {
		this.contentLink3_opt = contentLink3_opt;
	}
	public String getContentTitle4() {
		return contentTitle4;
	}
	public void setContentTitle4(String contentTitle4) {
		this.contentTitle4 = contentTitle4;
	}
	public String getContentLink4() {
		return contentLink4;
	}
	public void setContentLink4(String contentLink4) {
		this.contentLink4 = contentLink4;
	}
	public String getContentLink4_opt() {
		return contentLink4_opt;
	}
	public void setContentLink4_opt(String contentLink4_opt) {
		this.contentLink4_opt = contentLink4_opt;
	}
	public String getContentImg4() {
		return contentImg4;
	}
	public void setContentImg4(String contentImg4) {
		this.contentImg4 = contentImg4;
	}
	public String getContentImg4_origin() {
		return contentImg4_origin;
	}
	public void setContentImg4_origin(String contentImg4_origin) {
		this.contentImg4_origin = contentImg4_origin;
	}
	public String getContentOrder4() {
		return contentOrder4;
	}
	public void setContentOrder4(String contentOrder4) {
		this.contentOrder4 = contentOrder4;
	}
	public String getKeyword4() {
		return keyword4;
	}
	public void setKeyword4(String keyword4) {
		this.keyword4 = keyword4;
	}
	public String getKeywordLink4() {
		return keywordLink4;
	}
	public void setKeywordLink4(String keywordLink4) {
		this.keywordLink4 = keywordLink4;
	}
	public String getKeywordLink4_opt() {
		return keywordLink4_opt;
	}
	public void setKeywordLink4_opt(String keywordLink4_opt) {
		this.keywordLink4_opt = keywordLink4_opt;
	}
	public String getMobile_yn() {return mobile_yn;}
	public void setMobile_yn(String mobile_yn) {this.mobile_yn = mobile_yn;}
}
