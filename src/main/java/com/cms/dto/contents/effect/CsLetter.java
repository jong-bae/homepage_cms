package com.cms.dto.contents.effect;

import com.cms.dto.common.BZBoard;

public class CsLetter extends BZBoard {
	
	private int idx;
	private String subject;
	private String writer_id;
	private String writer_name;
	private String gubun;
	private String cd_bcode;
	private String bcode_name;
	private int doctor_idx;
	private String doctor_name;
	private String content;
	private int cnt;
	private String regdate;
	private String moddate;
	private String mobile_yn;
	private String best_yn;
	private String use_status;
	private String use_yn;
	private String ip;
	private String comment_cnt;	
	private String StartDate;
	private String EndDate;		
	private String searchTypeList;
	private String[] searchTypeListByDB;	
	private String suggest_yn;
	private String cdBCODE;



	public String[] getSearchTypeListByDB() {
		return searchTypeListByDB;
	}
	public void setSearchTypeListByDB(String[] searchTypeListByDB) {
		this.searchTypeListByDB = searchTypeListByDB;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getCd_bcode() {
		return cd_bcode;
	}
	public void setCd_bcode(String cd_bcode) {
		this.cd_bcode = cd_bcode;
	}
	public String getBcode_name() {
		return bcode_name;
	}
	public void setBcode_name(String bcode_name) {
		this.bcode_name = bcode_name;
	}
	public int getDoctor_idx() {
		return doctor_idx;
	}
	public void setDoctor_idx(int doctor_idx) {
		this.doctor_idx = doctor_idx;
	}
	public String getDoctor_name() {
		return doctor_name;
	}
	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getModdate() {
		return moddate;
	}
	public void setModdate(String moddate) {
		this.moddate = moddate;
	}
	public String getMobile_yn() {
		return mobile_yn;
	}
	public void setMobile_yn(String mobile_yn) {
		this.mobile_yn = mobile_yn;
	}
	public String getBest_yn() {
		return best_yn;
	}
	public void setBest_yn(String best_yn) {
		this.best_yn = best_yn;
	}
	public String getUse_status() {
		return use_status;
	}
	public void setUse_status(String use_status) {
		this.use_status = use_status;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getComment_cnt() {
		return comment_cnt;
	}
	public void setComment_cnt(String comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	public String getStartDate() {
		return StartDate;
	}
	public void setStartDate(String startDate) {
		StartDate = startDate;
	}
	public String getEndDate() {
		return EndDate;
	}
	public void setEndDate(String endDate) {
		EndDate = endDate;
	}
	public String getSearchTypeList() {
		return searchTypeList;
	}
	public void setSearchTypeList(String searchTypeList) {
		this.searchTypeList = searchTypeList;
	}
	public String getSuggest_yn() {
		return suggest_yn;
	}
	public void setSuggest_yn(String suggest_yn) {
		this.suggest_yn = suggest_yn;
	}

	@Override
	public String getCdBCODE() {
		return cdBCODE;
	}

	@Override
	public void setCdBCODE(String cdBCODE) {
		this.cdBCODE = cdBCODE;
	}
}