package com.cms.service.contents.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cms.dao.contents.faq.FaqDao;
import com.cms.dto.contents.faq.Faq;

/**
 * 
 * @ClassName FaqService
 * @description
 * @author JB
 * @since 2021. 5. 20.
 */
@Service
public class FaqService {

	@Autowired private FaqDao faqDao;
	
	public List<Faq> getFaqList() {
		return faqDao.getFaqList();
	}
	
	@Transactional
	public void setFaq(Faq faq) {
		faqDao.setFaq(faq);
	}
	
	public Faq getFaqOne(int idx) {
		return faqDao.getFaqOne(idx);
	}
	
	public void modifyFaqOne(Faq faq) {
		faqDao.modifyFaqOne(faq);
	}
	
	public void removeFaq(int idx) {
		faqDao.removeFaq(idx);
	}
}
