package com.cms.dto.contents.contentsmanage;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Agreement {

	private int idx;
	private String title;
	private String strContents;
	private String version;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date insertDate;
	private String useYN;
	private String pid;
	
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
	public String getStrContents() {
		return strContents;
	}
	public void setStrContents(String strContents) {
		this.strContents = strContents;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public String getUseYN() {
		return useYN;
	}
	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	
}
