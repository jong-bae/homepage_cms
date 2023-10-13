package com.cms.dto.contents.tvbony;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 
 * @ClassName TvCode
 * @description TV보니 대분류, 소분류, 관심분야, 관심질환, 사용
 * @author SDW
 * @since 2020. 11. 18.
 */
public class TvCode {

	private int idx;
	private String gubun;
	private String title;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regdate;
	private String real_yn;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
}