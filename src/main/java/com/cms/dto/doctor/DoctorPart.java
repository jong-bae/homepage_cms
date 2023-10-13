package com.cms.dto.doctor;

public class DoctorPart {
	private int idx;
	private int gubun1_idx;
	private String gubun2_name;
	private int gubun2_order;
	private int gubun2_idx;
	
	private String name;
	private String useYN;
	private int didx;
	private int d_order;
	
	private int orderValue;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getGubun1_idx() {
		return gubun1_idx;
	}
	public void setGubun1_idx(int gubun1_idx) {
		this.gubun1_idx = gubun1_idx;
	}
	public String getGubun2_name() {
		return gubun2_name;
	}
	public void setGubun2_name(String gubun2_name) {
		this.gubun2_name = gubun2_name;
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
	public int getDidx() {
		return didx;
	}
	public void setDidx(int didx) {
		this.didx = didx;
	}
	public int getD_order() {
		return d_order;
	}
	public void setD_order(int d_order) {
		this.d_order = d_order;
	}
	public int getGubun2_order() {
		return gubun2_order;
	}
	public void setGubun2_order(int gubun2_order) {
		this.gubun2_order = gubun2_order;
	}
	public int getOrderValue() {
		return orderValue;
	}
	public void setOrderValue(int orderValue) {
		this.orderValue = orderValue;
	}
	public int getGubun2_idx() {
		return gubun2_idx;
	}
	public void setGubun2_idx(int gubun2_idx) {
		this.gubun2_idx = gubun2_idx;
	}
	
}
