package com.cms.dao.contents.contentsmanage;

import java.util.List;

import com.cms.dto.common.BZBoard;

public interface BookDao {

	public List<BZBoard> getList();

	public void setBook(BZBoard bzBoard);

	public void setBookScarp(int idx);

	public BZBoard getBook(int idx);

	public void removeBook(int idx);

	public void removeBookScrap(int idx);

	public void modifyBook(BZBoard bzBoard);

}
