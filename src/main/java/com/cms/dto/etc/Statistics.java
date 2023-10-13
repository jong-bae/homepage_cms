package com.cms.dto.etc;

/**
 * 
 * @ClassName Statistics
 * @description
 * @author JB
 * @since 2021. 10. 26.
 */
public class Statistics {
	
	private int bCode;
	private String bName;
	private String name;
	private int effectCnt;
	private int mriCnt;
	private int complimentCnt;
	private int commentCnt;
	private int faceCnt;
	private int tvCnt;

	private String gubun;
	
	private int colSum;

	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public int getbCode() {
		return bCode;
	}
	public void setbCode(int bCode) {
		this.bCode = bCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getEffectCnt() {
		return effectCnt;
	}
	public void setEffectCnt(int effectCnt) {
		this.effectCnt = effectCnt;
	}
	public int getMriCnt() {
		return mriCnt;
	}
	public void setMriCnt(int mriCnt) {
		this.mriCnt = mriCnt;
	}
	public int getComplimentCnt() {
		return complimentCnt;
	}
	public void setComplimentCnt(int complimentCnt) {
		this.complimentCnt = complimentCnt;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	public int getFaceCnt() {
		return faceCnt;
	}
	public void setFaceCnt(int faceCnt) {
		this.faceCnt = faceCnt;
	}
	public int getTvCnt() {
		return tvCnt;
	}
	public void setTvCnt(int tvCnt) {
		this.tvCnt = tvCnt;
	}
	public int getColSum() {
		return colSum;
	}
	public void setColSum(int colSum) {
		this.colSum = colSum;
	}
}
