package com.cms.dao.contents.contentsmanage;

import java.util.List;

import com.cms.dto.common.BZBoard;

public interface FacialDao {

	public List<BZBoard> getFacialList();
	
	public BZBoard setFacial(BZBoard param);
	
	public void setFileName(BZBoard param);
	
	public BZBoard getFacial(int idx);
	
	public void modifyFacial(BZBoard param);
	
	public void removeFacial(int idx);
}
