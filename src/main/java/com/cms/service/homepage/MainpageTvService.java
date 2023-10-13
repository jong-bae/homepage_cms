package com.cms.service.homepage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.homepage.MainpageTvDao;
import com.cms.dto.homepage.MainpageKeyword;

/**
 * 
 * @ClassName MainpageTvService
 * @description 메인 영상영역 탭 서비스
 * @author JB
 * @since 2020. 12. 2.
 */
@Service
public class MainpageTvService {
	
	@Autowired private MainpageTvDao mainpageTvDao;
	
	/**
	 * 
	 * @name getInterestList
	 * @description 관심키워드 리스트 조회
	 * @return
	 * @author JB
	 * @since 2020. 12. 2.
	 */
	public List<MainpageKeyword> getInterestList() {
		return mainpageTvDao.getInterestList();
	}
	
	/**
	 * 
	 * @name modifyInterestKeyword
	 * @description 내용 갱신 서비스
	 * @param param
	 * @author JB
	 * @since 2020. 12. 4.
	 */
	public void modifyInterestKeyword(MainpageKeyword param) {
		mainpageTvDao.modifyInterestKeyword(param);
	}
	
	/**
	 * 
	 * @name getInterestKeyword
	 * @description 현재 저장데이터 조회
	 * @return
	 * @author JB
	 * @since 2020. 12. 4.
	 */
	public MainpageKeyword getInterestKeyword() {
		return mainpageTvDao.getInterestKeyword();
	}
}
