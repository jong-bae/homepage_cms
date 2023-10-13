package com.cms.dto.contents.effect;

public class CsComment {

	private int intBoardID;
	private int intIndex;
	private int intThread;
	private String strSubject;
	private int idx;
	private int mdix;
	private String name;
	private String useYN;
	private String regDate; 
	private String comment;
	private String tblName;
	private String cdBCODE;
	private String searchTypeList;
	private String[] searchTypeListByDB;

	private  String gubun;

	private String content;

	private String subject;

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getIntBoardID() {
		return intBoardID;
	}
	public void setIntBoardID(int intBoardID) {
		this.intBoardID = intBoardID;
	}
	public int getIntIndex() {
		return intIndex;
	}
	public void setIntIndex(int intIndex) {
		this.intIndex = intIndex;
	}
	public int getIntThread() {
		return intThread;
	}
	public void setIntThread(int intThread) {
		this.intThread = intThread;
	}
	public String getStrSubject() {
		return strSubject;
	}
	public void setStrSubject(String strSubject) {
		this.strSubject = strSubject;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMdix() {
		return mdix;
	}
	public void setMdix(int mdix) {
		this.mdix = mdix;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUseYN() {
		return useYN;
	}
	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getTblName() {
		return tblName;
	}
	public void setTblName(String tblName) {
		this.tblName = tblName;
	}
	public String getCdBCODE() {
		return cdBCODE;
	}
	public void setCdBCODE(String cdBCODE) {
		this.cdBCODE = cdBCODE;
	}
	public String getSearchTypeList() {
		return searchTypeList;
	}
	public void setSearchTypeList(String searchTypeList) {
		this.searchTypeList = searchTypeList;
	}
	public String[] getSearchTypeListByDB() {
		return searchTypeListByDB;
	}
	public void setSearchTypeListByDB(String[] searchTypeListByDB) {
		this.searchTypeListByDB = searchTypeListByDB;
	}
	
}
