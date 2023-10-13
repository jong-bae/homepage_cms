package com.cms.dao.contents.faq;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cms.dto.contents.faq.Faq;

/**
 * @ClassName FaqrankDao
 * @description
 * @author jaseng M25014
 * @since 2022. 9. 26.
 */
public interface FaqrankDao {
	
	public List<Faq> getFaqList(String category);
	
	public void setOrder(@Param("idx") int idx, @Param("key") int key);
		
}


