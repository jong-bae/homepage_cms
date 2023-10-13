package com.cms.service.homepage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.homepage.SeoDao;
import com.cms.dto.homepage.Seo;

/**
 * 
 * @ClassName SeoService
 * @description SEO 검색-메타태그 서비스
 * @author JB
 * @since 2021. 4. 30.
 */
@Service
public class SeoService {

	@Autowired private SeoDao seoDao;
	
	public List<Seo> getMetatagList() {
		return seoDao.getMetatagList();
	}
	
	public void setMetatag(Seo seo) {
		seoDao.setMetatag(seo);
	}
	
	public Seo getMetadataOne(int idx) {
		return seoDao.getMetadataOne(idx);
	}
	
	public void modifyMetadataOne(Seo seo) {
		seoDao.modifyMetadataOne(seo);
	}
	
	public void removeMetadataOne(int idx) {
		seoDao.removeMetadataOne(idx);
	}
}
