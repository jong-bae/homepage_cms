package com.cms.service.contents.contentsmanager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cms.dao.contents.contentsmanage.NoticeDao;
import com.cms.dto.contents.contentsmanage.Notice;

@Service
public class NoticeService {
	
	@Autowired private NoticeDao noticeDao;

	public List<Notice> getList() {
		return noticeDao.getList();
	}

	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	public void setNotice(Notice notice) {
		
		//1. BZBoard_v2 insert
		int result = noticeDao.setNotice(notice);
		int bidx = notice.getBidx();
		
		// 2. BZBoard_Scrap_v2 insert
		noticeDao.setNoticeScrap(bidx);
		
	}


	public Notice getNotice(int idx) {
		Notice notice = noticeDao.getNotice(idx);
		return notice;
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	public void removeNotice(int idx) {
		noticeDao.removeNotice(idx);
		noticeDao.removeNoticeScrap(idx);
	}


	public void modifyNotice(Notice notice) {
		noticeDao.modifyNotice(notice);
	}

}
