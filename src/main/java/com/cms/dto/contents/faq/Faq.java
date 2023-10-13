package com.cms.dto.contents.faq;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Faq {

	private int idx;
	private String category;	
	private int hit;	
	private String subject;
	private String contents;
	private String branchOpen;
	
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date orderDate;
	
	private String useYn;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getBranchOpen() {
		return branchOpen;
	}

	public void setBranchOpen(String branchOpen) {
		this.branchOpen = branchOpen;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
}
