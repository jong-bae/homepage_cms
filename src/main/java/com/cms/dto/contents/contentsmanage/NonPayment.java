package com.cms.dto.contents.contentsmanage;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class NonPayment {

	private int idx;
	private int bCode;
	private String bName;
	private String code;
	private String codeName;
	private String itemName;
	private String itemCode;
	private String itemDivision;
	private String cost;
	private String minCost;
	private String maxCost;
	private String materialYN;
	private String drugYN;
	private String etc;
	private String uuid;
	private String regDate;
	
	private String parentCode;
	private String codes;
	
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date historyDate;
	private String updateDate;
	private String status;
	//private List<String> historyList;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getbCode() {
		return bCode;
	}
	public void setbCode(int bCode) {
		this.bCode = bCode;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemDivision() {
		return itemDivision;
	}
	public void setItemDivision(String itemDivision) {
		this.itemDivision = itemDivision;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getMinCost() {
		return minCost;
	}
	public void setMinCost(String minCost) {
		this.minCost = minCost;
	}
	public String getMaxCost() {
		return maxCost;
	}
	public void setMaxCost(String maxCost) {
		this.maxCost = maxCost;
	}
	public String getMaterialYN() {
		return materialYN;
	}
	public void setMaterialYN(String materialYN) {
		this.materialYN = materialYN;
	}
	public String getDrugYN() {
		return drugYN;
	}
	public void setDrugYN(String drugYN) {
		this.drugYN = drugYN;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public Date getHistoryDate() {
		return historyDate;
	}
	public void setHistoryDate(Date historyDate) {
		this.historyDate = historyDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCodes() {
		return codes;
	}
	public void setCodes(String codes) {
		this.codes = codes;
	}
	
}
