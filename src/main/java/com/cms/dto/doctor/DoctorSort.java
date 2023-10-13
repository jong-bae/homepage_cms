package com.cms.dto.doctor;

import java.util.List;

public class DoctorSort {
	private String flag;
	private List<DoctorPart> listData;
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public List<DoctorPart> getListData() {
		return listData;
	}
	public void setListData(List<DoctorPart> listData) {
		this.listData = listData;
	}
	
}
