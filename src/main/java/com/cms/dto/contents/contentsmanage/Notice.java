package com.cms.dto.contents.contentsmanage;

public class Notice {
	
	private int scrapIdx;
	private int bidx;
	private int intComment;
	private int intFileCount;
	private int bitDelete;    // 0 : 보임, 1: 안보임 , 2 : 채용공고
	private int intRead;
	private String dateRegdate;
	private String strSubject;
	private String strPreContent;
	private int bitDirPre;		//strPreContent를 직접작성할것인지 결정.
	private String strContent;
	private String strFirstImg;
	private int intCmtCnt;	//코맨트 갯수
	private String strMContent;
	private int intMHtml;
	private String strMImage;
	private String strBZCode;		//
	private String mainOpen;		//메인반영 분원코드
	private String branchOpen;	//분원반영 분원코드
	private String mainYN;		//메인노출 여부
	private String mainTitle;	//메인 노출 제목
	public int getScrapIdx() {
		return scrapIdx;
	}
	public void setScrapIdx(int scrapIdx) {
		this.scrapIdx = scrapIdx;
	}
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public int getIntComment() {
		return intComment;
	}
	public void setIntComment(int intComment) {
		this.intComment = intComment;
	}
	public int getIntFileCount() {
		return intFileCount;
	}
	public void setIntFileCount(int intFileCount) {
		this.intFileCount = intFileCount;
	}
	public int getBitDelete() {
		return bitDelete;
	}
	public void setBitDelete(int bitDelete) {
		this.bitDelete = bitDelete;
	}
	public int getIntRead() {
		return intRead;
	}
	public void setIntRead(int intRead) {
		this.intRead = intRead;
	}
	public String getDateRegdate() {
		return dateRegdate;
	}
	public void setDateRegdate(String dateRegdate) {
		this.dateRegdate = dateRegdate;
	}
	public String getStrSubject() {
		return strSubject;
	}
	public void setStrSubject(String strSubject) {
		this.strSubject = strSubject;
	}
	public String getStrPreContent() {
		return strPreContent;
	}
	public void setStrPreContent(String strPreContent) {
		this.strPreContent = strPreContent;
	}
	public int getBitDirPre() {
		return bitDirPre;
	}
	public void setBitDirPre(int bitDirPre) {
		this.bitDirPre = bitDirPre;
	}
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String strContent) {
		this.strContent = strContent;
	}
	public String getStrFirstImg() {
		return strFirstImg;
	}
	public void setStrFirstImg(String strFirstImg) {
		this.strFirstImg = strFirstImg;
	}
	public int getIntCmtCnt() {
		return intCmtCnt;
	}
	public void setIntCmtCnt(int intCmtCnt) {
		this.intCmtCnt = intCmtCnt;
	}
	public String getStrMContent() {
		return strMContent;
	}
	public void setStrMContent(String strMContent) {
		this.strMContent = strMContent;
	}
	public int getIntMHtml() {
		return intMHtml;
	}
	public void setIntMHtml(int intMHtml) {
		this.intMHtml = intMHtml;
	}
	public String getStrMImage() {
		return strMImage;
	}
	public void setStrMImage(String strMImage) {
		this.strMImage = strMImage;
	}
	public String getStrBZCode() {
		return strBZCode;
	}
	public void setStrBZCode(String strBZCode) {
		this.strBZCode = strBZCode;
	}
	public String getMainOpen() {
		return mainOpen;
	}
	public void setMainOpen(String mainOpen) {
		this.mainOpen = mainOpen;
	}
	public String getBranchOpen() {
		return branchOpen;
	}
	public void setBranchOpen(String branchOpen) {
		this.branchOpen = branchOpen;
	}
	public String getMainYN() {
		return mainYN;
	}
	public void setMainYN(String mainYN) {
		this.mainYN = mainYN;
	}
	public String getMainTitle() {
		return mainTitle;
	}
	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}
	
}
