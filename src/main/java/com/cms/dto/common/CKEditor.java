package com.cms.dto.common;

/**
 * 
 * @ClassName CKEditor
 * @description CKEditor 파일 서버전송 리턴 Key
 * @author JB
 * @since 2020. 10. 28.
 */
public class CKEditor {

	private int uploaded;
	private String fileName;
	private String url;
	
	public int getUploaded() {
		return uploaded;
	}
	public void setUploaded(int uploaded) {
		this.uploaded = uploaded;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
