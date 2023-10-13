package com.cms.dao.contents.faq;

import java.util.List;

import com.cms.dto.contents.faq.Faq;

/**
 * 
 * @ClassName FaqDao
 * @description
 * @author JB
 * @since 2021. 5. 20.
 */
public interface FaqDao {

	public List<Faq	> getFaqList();
	
	public void setFaq(Faq faq);
		
	public Faq getFaqOne(int idx);
	
	public void modifyFaqOne(Faq faq);
	
	public void removeFaq(int idx);
}
