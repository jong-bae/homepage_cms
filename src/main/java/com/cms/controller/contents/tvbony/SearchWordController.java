package com.cms.controller.contents.tvbony;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.dto.contents.effect.CsLetter;
import com.cms.dto.contents.tvbony.SearchWord;
import com.cms.dto.master.Admin;
import com.cms.service.contents.tvbony.SearchWordService;
import com.cms.service.master.MenuService;

@Controller
@RequestMapping(value="/contents/tvbony/searchword")
public class SearchWordController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MenuService menuService;
	@Autowired private SearchWordService searchWordService;
	

	/**
	 * 
	 * @name list
	 * @description
	 * @param req
	 * @param model
	 * @param startDate
	 * @param endDate
	 * @author KimJaehyung
	 * @since 2021. 6. 28.
	 */
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public void list(HttpServletRequest req, Model model, @RequestParam(value="startDate", required=false) String startDate 
			, @RequestParam(value="endDate", required=false) String endDate) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
		
		if(StringUtils.isNotBlank(startDate)) {
			model.addAttribute("startDate", startDate);
		}else {
			model.addAttribute("startDate", "-1");
		}
		
		if(StringUtils.isNotBlank(endDate)) {
			model.addAttribute("endDate", endDate);
		}
		
	}
	
	
	
	/**
	 * 
	 * @name listAjax
	 * @description
	 * @param param
	 * @return
	 * @author KimJaehyung
	 * @since 2021. 6. 28.
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<SearchWord> listAjax( @RequestBody CsLetter param){
		
		String startDate = (String) param.getStartDate();
		String endDate = (String) param.getEndDate();
		
		return searchWordService.getList(startDate, endDate);
	}
	
	
	
}
