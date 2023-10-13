package com.cms.service.contents.effect;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cms.dao.contents.effect.CsLetterDao;
import com.cms.dto.contents.effect.CsComment;
import com.cms.dto.contents.effect.CsLetter;

@Service
public class CsLetterService {
	
	@Autowired private CsLetterDao csLetterDao;

	public List<CsLetter> getList(String startDate, String endDate, String gubun, String cdBcode) {
		List<CsLetter> result = new ArrayList<CsLetter>();
		
		CsLetter param = new CsLetter();
		param.setStartDate(startDate);
		param.setEndDate(endDate);
		param.setGubun(gubun);
		param.setCdBCODE(cdBcode);

		result = csLetterDao.getList(param);
		return result;
	}

	public List<CsLetter> getWaitList() {
		List<CsLetter> result = new ArrayList<CsLetter>();
		result = csLetterDao.getWaitList();
		return result;
	}

	public CsLetter getCsLetter(int idx) {
		CsLetter result = csLetterDao.getCsLetter(idx);
		return result;
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	public void modifyCsLetter(CsLetter csletter) {
		
		//Board Table
		csLetterDao.modifyCsLetterByBoard(csletter);

	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	public void suggestCsLetter(CsLetter csletter) {
		
		//건의합니다 중복 체크
		int cnt = csLetterDao.countBZContactMail(csletter.getIdx());
		
		if(cnt == 0) {
			csLetterDao.suggestCsLetter(csletter);
		}
	}

	public List<CsComment> getReplyList(CsComment param) {
		return  csLetterDao.getReplyList(param);
	}

	public List<CsComment> getReplyWaitList() {
		return csLetterDao.getReplyWaitList();
	}

	public List<CsComment> getReplyAjaxList(String bCode, String gubun) {

		List<CsComment> result = new ArrayList<CsComment>();
		
		CsComment param = new CsComment();
		param.setCdBCODE(bCode);
		param.setGubun(gubun);

		result = csLetterDao.getReplyAjaxList(param);
		return result;

	}

	public CsComment getCsComment(int idx) {
		
		return csLetterDao.getCsComment(idx);
	}

	public void modifyCsComment(CsComment csComment) {
		csLetterDao.modifyCsComment(csComment);
	}

}
