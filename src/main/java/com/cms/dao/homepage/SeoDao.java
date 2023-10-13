package com.cms.dao.homepage;

import java.util.List;

import com.cms.dto.homepage.Seo;

public interface SeoDao {

	public List<Seo> getMetatagList();
	
	public void setMetatag(Seo seo);
	
	public Seo getMetadataOne(int idx);
	
	public void modifyMetadataOne(Seo seo);
	
	public void removeMetadataOne(int idx);
}
