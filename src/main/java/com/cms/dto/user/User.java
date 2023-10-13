package com.cms.dto.user;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class User {
	private int idx;
	private String id;
	private String password;
	private String name;
	private String email;
	private String mailingYN;
	private String agreeYN;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date memberDate;
	private String siteCode;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date loginDate;
	private int branchCode;
	private String bName;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date pwdChangeDate;
	private String joinFlag;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMailingYN() {
		return mailingYN;
	}
	public void setMailingYN(String mailingYN) {
		this.mailingYN = mailingYN;
	}
	public String getAgreeYN() {
		return agreeYN;
	}
	public void setAgreeYN(String agreeYN) {
		this.agreeYN = agreeYN;
	}
	public Date getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(Date memberDate) {
		this.memberDate = memberDate;
	}
	public String getSiteCode() {
		return siteCode;
	}
	public void setSiteCode(String siteCode) {
		this.siteCode = siteCode;
	}
	public Date getLoginDate() {
		return loginDate;
	}
	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}
	public int getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(int branchCode) {
		this.branchCode = branchCode;
	}
	public Date getPwdChangeDate() {
		return pwdChangeDate;
	}
	public void setPwdChangeDate(Date pwdChangeDate) {
		this.pwdChangeDate = pwdChangeDate;
	}
	public String getJoinFlag() {
		return joinFlag;
	}
	public void setJoinFlag(String joinFlag) {
		this.joinFlag = joinFlag;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	
}
