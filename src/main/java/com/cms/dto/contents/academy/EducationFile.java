package com.cms.dto.contents.academy;

public class EducationFile extends Education {
	
	private int fileIdx;
	private String fileName;
	private String filePath;
	private int fileSize;
	private String uuid;
	private String parentIdx;
	
	private String img_Origin;
	
	public int getFileIdx() {
		return fileIdx;
	}
	public void setFileIdx(int fileIdx) {
		this.fileIdx = fileIdx;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getParentIdx() {
		return parentIdx;
	}
	public void setParentIdx(String parentIdx) {
		this.parentIdx = parentIdx;
	}
	public String getImg_Origin() {
		return img_Origin;
	}
	public void setImg_Origin(String img_Origin) {
		this.img_Origin = img_Origin;
	}
	
}
