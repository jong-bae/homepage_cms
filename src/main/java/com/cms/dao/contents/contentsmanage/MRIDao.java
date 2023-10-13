package com.cms.dao.contents.contentsmanage;

import java.util.List;

import com.cms.dto.common.BZBoard;


public interface MRIDao {
	
	public List<BZBoard> getList();

	public BZBoard setMri(BZBoard bzBoard);

	public void setFileName(BZBoard bzBoard);

	public BZBoard getMRI(int idx);

	public void removeMri(int idx);

	public void modifyMri(BZBoard bzBoard);

	
}