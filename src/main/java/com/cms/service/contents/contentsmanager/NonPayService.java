package com.cms.service.contents.contentsmanager;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.google.common.collect.Lists;
import com.cms.common.excel.ExcelRead;
import com.cms.common.excel.ExcelReadOption;
import com.cms.common.util.FileUpload;
import com.cms.dao.contents.contentsmanage.NonPayDao;
import com.cms.dto.common.ResponseCode;
import com.cms.dto.contents.contentsmanage.NonPayment;

/**
 * 
 * @ClassName NonPayService
 * @description
 * @author JB
 * @since 2021. 6. 4.
 */
@Service
public class NonPayService {

	@Autowired private NonPayDao nonPayDao;
	@Value("#{prop['file.upload.system.path']}") private String systemPath;
	@Value("#{prop['file.upload.path.nonpay']}") private String subPath;
	
	public int getNonPaymentAllCount() {
		return nonPayDao.getNonPaymentAllCount(); 
	}
	
	public List<NonPayment> getNonPaymentList(NonPayment param) {
		return nonPayDao.getNonPaymentList(param);
	}
	
	public List<NonPayment> getHistoryDateList(int bCode) {
		return nonPayDao.getHistoryDateList(bCode);
	}
	
	public NonPayment getNonPaymentOne(int idx) {
		NonPayment result = nonPayDao.getNonPaymentOne(idx);
		if(result.getParentCode().equals("CD_NPAYMENT")) {
			result.setParentCode(result.getCode());
		}
		return result;
	}
	
	public void modifyNonPaymentOne(NonPayment param) {
		String[] codes = param.getCodes().split(",");
		
		if(codes.length == 2) {
			param.setCode(codes[1]);
		} else {
			param.setCode(codes[0]);
		}
		
		nonPayDao.modifyNonPaymentOne(param);
	}
	
	@Transactional
	public void setNonPayment(NonPayment param) {
		String[] codes = param.getCodes().split(",");
		
		if(codes.length == 2) {
			param.setCode(codes[1]);
		} else {
			param.setCode(codes[0]);
		}
		
		// 이력갱신일때
		if(param.getStatus().equals("R")) {
			param.setUuid(UUID.randomUUID().toString().replace("-", "").toUpperCase());
			nonPayDao.setRenewNonPayment(param);
			nonPayDao.setNonPaymentHistory(param);
		}
		
		nonPayDao.setNonPayment(param);
	}
	
	/**
	 * 
	 * @name excelUpload
	 * @description
	 * @param param
	 * @param multipartReq
	 * @author JB
	 * @since 2021. 8. 13.
	 */
	@Transactional
	public ResponseCode excelUpload(NonPayment param, MultipartRequest multipartReq) {
		MultipartFile uploadFile = multipartReq.getFile("excelFile");
		ResponseCode result = new ResponseCode();
		
		try {
			if(!uploadFile.isEmpty()) {
				// excel file Upload
				File file = FileUpload.fileUpload_re(uploadFile, systemPath+File.separator+subPath);
				// excel file READ
				List<Map<String, String>> excelContent = nonpayExcelData(file);
				
				param.setUuid(UUID.randomUUID().toString().replace("-", "").toUpperCase());
				// DB insert 처리
				
				if( excelContent.size() > 100) {
					List<List<Map<String, String>>> partitionList = Lists.partition(excelContent, 100);
					for(List<Map<String, String>> partitionContent : partitionList) {
						nonPayDao.setExcelNonPayment(param, partitionContent);
					}
				} else {
					nonPayDao.setExcelNonPayment(param, excelContent);
				}
				nonPayDao.setNonPaymentHistory(param);
				
				result.setResult(true);
				result.setMessage("비급여 " + excelContent.size() + " 건을 등록하였습니다.");
				
				// 업로드한 파일 삭제 로직 추가 (엑셀파일 서버에 쌓아둘 필요 없음)
				FileUpload.fileDelete(uploadFile, systemPath+File.separator+subPath);
			}
			else {
				result.setResult(false);
				result.setMessage("파일이 존재하지 않습니다.");
			}
		} catch(Exception e) {
			result.setResult(false);
			result.setMessage(e.getMessage());
		}
		
		return result;
	}
	
	/**
	 * 
	 * @name nonpayExcelData
	 * @description 비급여 엑셀업로드 데이터 추출 
	 * @param FILE
	 * @author JB
	 * @since 2021. 8. 13.
	 */
	private List<Map<String, String>> nonpayExcelData(File FILE) {
		ExcelReadOption excelReadOption = new ExcelReadOption();
		excelReadOption.setFilePath(FILE.getAbsolutePath());
		// 비급여데이터 col 갯수
		excelReadOption.setOutputColumns("A","B","C","D","E","F","G","H","I","J","K","L");
		excelReadOption.setStartRow(2);
		
		// ex) Key : A , Value : CD_NPDETAIL_07
		// ex) Key : F , Value : 10000
		List<Map<String, String>> excelContent = ExcelRead.read(excelReadOption);
		
		return excelContent;
	}
	
	public List<NonPayment> getNonPaymentExcelList(NonPayment param) {
		return nonPayDao.getNonPaymentExcelList(param);
	}
	
}
