package com.cms.dao.homepage;

import java.util.List;

import com.cms.dto.homepage.Popup;

public interface PopupDao {

	public List<Popup> getPopupList_pc();
	
	public List<Popup> getPopupList_m();
	
	public void setPopup_mobile(Popup popup);
	
	public Popup getPopup_pc(int idx);
	
	public Popup getPopup_mobile(int idx);
	
	public void modifyPopup_mobile(Popup popup);
	
	public void removePopup_mobile(int idx);
}
