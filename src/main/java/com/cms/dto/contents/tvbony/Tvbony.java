package com.cms.dto.contents.tvbony;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Tvbony {
	
	private int idx;
	private String category1;
	private String category2;
	private String vid;
	private String vid_time;
	private int branch;
	private String title;
	private String description;
	private String hashtag;
	private int view_count;
	private String name_dr;
	private int didx;
	private String interest_disease;
	private String interest_depart;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regdate;
	private String real_yn;
	private String main_yn;
	private String main_moddate;
	private String mmain_yn;
	private String mmain_moddate;

	private String public_yn;
	private String public_moddate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
	public String getVid_time() {
		return vid_time;
	}
	public void setVid_time(String vid_time) {
		this.vid_time = vid_time;
	}
	public int getBranch() {
		return branch;
	}
	public void setBranch(int branch) {
		this.branch = branch;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public String getName_dr() {
		return name_dr;
	}
	public void setName_dr(String name_dr) {
		this.name_dr = name_dr;
	}
	public int getDidx() {
		return didx;
	}
	public void setDidx(int didx) {
		this.didx = didx;
	}
	public String getInterest_disease() {
		return interest_disease;
	}
	public void setInterest_disease(String interest_disease) {
		this.interest_disease = interest_disease;
	}
	public String getInterest_depart() {
		return interest_depart;
	}
	public void setInterest_depart(String interest_depart) {
		this.interest_depart = interest_depart;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getReal_yn() {
		return real_yn;
	}
	public void setReal_yn(String real_yn) {
		this.real_yn = real_yn;
	}
	public String getMain_yn() {
		return main_yn;
	}
	public void setMain_yn(String main_yn) {
		this.main_yn = main_yn;
	}
	public String getMain_moddate() {
		return main_moddate;
	}
	public void setMain_moddate(String main_moddate) {
		this.main_moddate = main_moddate;
	}
	public String getMmain_yn() {
		return mmain_yn;
	}
	public void setMmain_yn(String mmain_yn) {
		this.mmain_yn = mmain_yn;
	}
	public String getMmain_moddate() {
		return mmain_moddate;
	}
	public void setMmain_moddate(String mmain_moddate) {
		this.mmain_moddate = mmain_moddate;
	}
	public String getPublic_yn() { return public_yn; }
	public void setPublic_yn(String public_yn) { this.public_yn = public_yn; }
	public String getPublic_moddate() { return public_moddate; }
	public void setPublic_moddate(String public_moddate) { this.public_moddate = public_moddate; }
}
