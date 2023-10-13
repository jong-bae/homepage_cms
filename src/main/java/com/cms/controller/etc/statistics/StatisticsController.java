package com.cms.controller.etc.statistics;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.dto.etc.Statistics;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.etc.StatisticsService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName StatisticsController
 * @description 통계관리
 * @author JB
 * @since 2021. 10. 25.
 */
@Controller
@RequestMapping(value="/etc/statistics")
public class StatisticsController {
	
	@Autowired private MenuService menuService;
	@Autowired private StatisticsService statisticsService;
	@Autowired private CommonService commonService;

	/**
	 * 
	 * @name list
	 * @description 의료진 치료사례 통계 리스트
	 * @param req
	 * @author JB
	 * @since 2021. 10. 25.
	 */
	@RequestMapping(value="/doctorEffect/list.do", method = RequestMethod.GET)
	public void doctorlist(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
	}
	
	/**
	 * 
	 * @name listAjax
	 * @description 병의원 치료사례 통계 리스트 ajax load
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 10. 26.
	 */
	@RequestMapping(value="/doctorEffect/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Statistics> listAjax(@RequestBody Map<String, String> param) {
		return statisticsService.getDoctorDataList(param);
	}
	
	/**
	 * 
	 * @name list
	 * @description 의료진 치료사례 통계 리스트
	 * @param req
	 * @author JB
	 * @since 2022. 05. 31.
	 */
	@RequestMapping(value="/branchEffect/list.do", method = RequestMethod.GET)
	public void branchlist(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
		model.addAttribute("bcodeList", commonService.getBranchList());
	}
	
	/**
	 * 
	 * @name totalListAjax
	 * @description 누적통계 데이터 로드
	 * @return
	 * @author JB
	 * @since 2022. 5. 31.
	 */
	@RequestMapping(value="/branchEffect/totalListAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Statistics> totalListAjax() {
		return statisticsService.getBranchTotalList();
	}
	
	/**
	 * 
	 * @name effectListAjax
	 * @description 질환별 기간조회 통계
	 * @param param
	 * @return
	 * @author JB
	 * @since 2022. 6. 7.
	 */
	@RequestMapping(value="/branchEffect/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> effectListAjax(@RequestBody Map<String, String> param) {
		return statisticsService.getEffectList(param);
	} 
	
	/**
	 * 
	 * @name exListAjax
	 * @description 질환별 치료사례 기간조회
	 * @param param
	 * @return
	 * @author JB
	 * @since 2022. 6. 9.
	 */
	@RequestMapping(value="/branchEffect/exListAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Statistics> exListAjax(@RequestBody Map<String, String> param) {
		return statisticsService.getExList(param);
	}
	
	/**
	 * 
	 * @name list
	 * @description 월별 치료사례 통계 리스트
	 * @param req
	 * @author JB
	 * @since 2022. 06. 14.
	 */
	@RequestMapping(value="/branchEffect/monthlist.do", method = RequestMethod.GET)
	public void monthlist(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
		//model.addAttribute("bcodeList", commonService.getBranchList());
	}
	
	/**
	 * 
	 * @name monthList
	 * @description 월별 병의원 치료사례 로드
	 * @param param
	 * @return
	 * @author JB
	 * @since 2022. 6. 15.
	 */
	@RequestMapping(value="/branchEffect/monthListAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<HashMap<String, Object>> monthList(@RequestBody Map<String, Integer> param) {
		return statisticsService.getMonthList(param.get("year"));
	}
	
	/**
	 * 
	 * @name monthExList
	 * @description 월별 치료사례 로드
	 * @param param
	 * @return
	 * @author JB
	 * @since 2022. 6. 16.
	 */
	@RequestMapping(value="/branchEffect/monthExListAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<HashMap<String, Object>> monthExList(@RequestBody Map<String, Integer> param) {
		return statisticsService.getMonthExList(param.get("year"));
	}
	
	
}
