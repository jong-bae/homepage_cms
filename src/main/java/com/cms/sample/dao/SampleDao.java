package com.cms.sample.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cms.sample.vo.request.SampleDataRequestVO;
import com.cms.sample.vo.response.LombokResponseVO;
import com.cms.sample.vo.response.SampleDataResponseVO;
import com.cms.sample.vo.response.SampleResponseVO;

/**
 * 
 * @ClassName SampleDao.java
 * @description 
 * @author JB
 * @since 2016. 4. 12.
 */
@Repository
public interface SampleDao {

	/**
	 * 
	 * @name selectSampleQuery
	 * @description 
	 * @param 
	 * @return SampleResponseVO
	 * @author JB
	 * @since 2016. 4. 12.
	 */
	public SampleResponseVO selectSampleQuery();
	
	/**
	 * 
	 * @name selectLombokQuery
	 * @description 
	 * @param 
	 * @return LombokResponseVO
	 * @author JB
	 * @since 2016. 7. 4.
	 */
	public LombokResponseVO selectLombokQuery();
	
	/**
	 * 
	 * @name selectDataQuery
	 * @description 
	 * @param 
	 * @return SampleDataResponseVO
	 * @author JB
	 * @since 2016. 7. 5.
	 */
	public List<SampleDataResponseVO> selectDataQuery(SampleDataRequestVO param);
	
	/**
	 * 
	 * @name selectTotalDataQuery
	 * @description 
	 * @param 
	 * @return int
	 * @author JB
	 * @since 2016. 7. 5.
	 */
	public int selectTotalRows(SampleDataRequestVO param);
}
