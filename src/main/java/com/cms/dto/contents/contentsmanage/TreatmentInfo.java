package com.cms.dto.contents.contentsmanage;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TreatmentInfo {

	private int bcode;
	private String timetable;
	private String timetable_M;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private String bName;
	
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public String getTimetable() {
		return timetable;
	}
	public void setTimetable(String timetable) {
		this.timetable = timetable;
	}
	public String getTimetable_M() {
		return timetable_M;
	}
	public void setTimetable_M(String timetable_M) {
		this.timetable_M = timetable_M;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	
}
