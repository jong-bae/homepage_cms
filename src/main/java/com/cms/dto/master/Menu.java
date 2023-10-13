package com.cms.dto.master;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Menu implements Serializable {

	private static final long serialVersionUID = 7491716604720662399L;
	
	private int idx;
	private int parentIdx;
	private String name;
	private int depth;
	private String url;
	private int sort;
	private String useYN;
	private String regId;
	private Date regDate;
	private String modId;
	private Date modDate;
	
	private List<Menu> menuList;	// 하위메뉴 리스트
	private String parentName;
	private String addClass;		// active 유무
	private String reqUrl;

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getParentIdx() {
		return parentIdx;
	}
	public void setParentIdx(int parentIdx) {
		this.parentIdx = parentIdx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getUseYN() {
		return useYN;
	}
	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getModId() {
		return modId;
	}
	public void setModId(String modId) {
		this.modId = modId;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	public List<Menu> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getAddClass() {
		return addClass;
	}
	public void setAddClass(String addClass) {
		this.addClass = addClass;
	}
	public String getReqUrl() {
		return reqUrl;
	}
	public void setReqUrl(String reqUrl) {
		this.reqUrl = reqUrl;
	}
	
}
