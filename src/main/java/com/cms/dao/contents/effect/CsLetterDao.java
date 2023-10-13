package com.cms.dao.contents.effect;

import java.util.List;

import com.cms.dto.contents.effect.CsComment;
import com.cms.dto.contents.effect.CsLetter;

public interface CsLetterDao {

	public List<CsLetter> getList(CsLetter param);

	public List<CsLetter> getWaitList();

	public CsLetter getCsLetter(int idx);

	public void modifyCsLetterByBoard(CsLetter csletter);
	
	public void modifyCsLetterBySelfThankYou(CsLetter csletter);

	public int countBZContactMail(int idx);

	public void suggestCsLetter(CsLetter csletter);

	public List<CsComment> getReplyList(CsComment param);

	public List<CsComment> getReplyWaitList();

	public List<CsComment> getReplyAjaxList(CsComment param);

	public CsComment getCsComment(int idx);

	public void modifyCsComment(CsComment csComment);

}
