package com.cms.dao.contents.contentsmanage;

import java.util.List;

import com.cms.dto.contents.contentsmanage.Notice;

public interface NoticeDao {
	
	public List<Notice> getList();

	public int setNotice(Notice notice);

	public void setNoticeScrap(int bidx);

	public Notice getNotice(int idx);

	public void removeNotice(int idx);

	public void removeNoticeScrap(int idx);

	public void modifyNotice(Notice notice);

}
