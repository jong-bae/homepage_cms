package com.cms.common.util;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * @ClassName FileUpload
 * @description 파일업로드 클래스
 * @author JB
 * @since 2020. 10. 22.
 */
public class FileUpload {

	/**
	 * 
	 * @name fileUpload
	 * @description 파일업로드 메소드
	 * @param file
	 * @param path - 시스템 FULLPATH
	 * @author JB
	 * @since 2020. 10. 22.
	 */
	public static void fileUpload(MultipartFile file, String path) {
		File dir = new File(path);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		// file 이름중복 체크 및 파일명 변경 추가
		
		try {
			// 서비스에서 조건 걸었지만 혹시 모르니 한번 더  체크!
			if(!file.isEmpty()) {
				file.transferTo(new File(path + File.separator + file.getOriginalFilename()));
			}
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}
		
	}
	
	/**
	 * 
	 * @name fileUpload_re
	 * @description 파일정보 리턴이 필요한 메소드
	 * @param file
	 * @param path
	 * @return
	 * @author JB
	 * @since 2021. 8. 13.
	 */
	public static File fileUpload_re(MultipartFile file, String path) {
		File dir = new File(path);
		File uploadFile = new File(path + File.separator + file.getOriginalFilename());
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		try {
			if(!file.isEmpty()) {
				file.transferTo(uploadFile);
			}
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}
		
		return uploadFile;
	}
	
	/**
	 * 
	 * @name fileDelete
	 * @description 파일삭제
	 * @param file
	 * @param path
	 * @author JB
	 * @since 2021. 8. 19.
	 */
	public static void fileDelete(MultipartFile file, String path) {
		File targetFile = new File(path + File.separator + file.getOriginalFilename());
		
		try {
			if( targetFile.exists()) {
				targetFile.delete();
			}
		} catch(Exception ioe) {
			ioe.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @name fileNameDelete
	 * @description 파일PATH로 삭제
	 * @param filePath
	 * @author JB
	 * @since 2021. 9. 15.
	 */
	public static void fileNameDelete(String filePath) {
		File targetFile = new File(filePath);
		
		try {
			if( targetFile.exists()) {
				targetFile.delete();
			}
		} catch(Exception ioe) {
			ioe.printStackTrace();
		}
	}
}
