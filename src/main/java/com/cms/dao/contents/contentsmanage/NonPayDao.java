package com.cms.dao.contents.contentsmanage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.cms.dto.contents.contentsmanage.NonPayment;

public interface NonPayDao {
	
	public int getNonPaymentAllCount();
	
	public List<NonPayment> getNonPaymentList(NonPayment param);
	
	public List<NonPayment> getHistoryDateList(int bCode);
	
	public NonPayment getNonPaymentOne(int idx);
	
	public void modifyNonPaymentOne(NonPayment param);
	
	/**
	 * 
	 * @name setExcelNonPayment
	 * @description 비급여 엑셀 업로드
	 * @param nonPayment
	 * @param excel
	 * @author JB
	 * @since 2021. 8. 18.
	 */
	public void setExcelNonPayment(@Param("np") NonPayment nonPayment, @Param("excel") List<Map<String, String>> excel);
	
	public void setNonPaymentHistory(NonPayment param);
	
	public void setNonPayment(NonPayment param);
	
	public void setRenewNonPayment(NonPayment param);
	
	public List<NonPayment> getNonPaymentExcelList(NonPayment param);
	
}
