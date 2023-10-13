package com.cms.controller.contents.effect;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cms.dto.contents.effect.CsComment;
import com.cms.dto.contents.effect.CsLetter;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.contents.effect.CsLetterService;
import com.cms.service.master.MenuService;


@Controller
@RequestMapping(value="/contents/effect/csletter")
public class CsLetterController{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MenuService menuService;
	@Autowired private CsLetterService csLetterService;
	@Autowired private CommonService commonService;

	/**
	 * @name list
	 * @description
	 * @param req
	 * @author KimJaehyung
	 */
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public void list(HttpServletRequest req, Model model,
					 @RequestParam(value="cdBCODE", required=false) String cdBCODE ,
					 @RequestParam(value="startDate", required=false) String startDate,
					 @RequestParam(value="endDate", required=false) String endDate,
					 @RequestParam(value="gubun", required=false) String gubun ) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);

		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());

		if(StringUtils.isNotBlank(startDate)) {
			model.addAttribute("startDate", startDate);
		}else {
			model.addAttribute("startDate", "-1");
		}
		
		if(StringUtils.isNotBlank(endDate)) {
			model.addAttribute("endDate", endDate);
		}

		if(StringUtils.isNotBlank(gubun)) {
			model.addAttribute("gubun",  gubun);
		}else {
			model.addAttribute("gubun", "");
		}
		
	}
	
	
	/**
	 * @name list
	 * @description
	 * @param req
	 * @author KimJaehyung
	 */
	@RequestMapping(value="/reply_list.do", method = RequestMethod.GET)
	public void replyList(HttpServletRequest req, Model model, @RequestParam(value="cdBCODE", required=false) String cdBCODE , @RequestParam(value="gubun", required=false) String gubun) {

		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);

		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());

		if(StringUtils.isNotBlank( cdBCODE)) {
			model.addAttribute("cdBCODE",  cdBCODE);
		}else {
			model.addAttribute("cdBCODE",  "-1");
		}

		if(StringUtils.isNotBlank( gubun)) {
			model.addAttribute("gubun",  gubun);
		}else {
			model.addAttribute("gubun", "");
		}
	}
	
	
	
	/**
	 * 
	 * @name listAjax
	 * @description dataTable list ajax load
	 * @return
	 * @author 김재형
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<CsLetter> listAjax( @RequestBody CsLetter param){

		String startDate = (String) param.getStartDate();
		String endDate = (String) param.getEndDate();
		String gubun = (String) param.getGubun();
		String cdBcode = (String) param.getCdBCODE();

		return csLetterService.getList(startDate, endDate, gubun, cdBcode);
	}
	
	
	/**
	 * 
	 * @name listAjax
	 * @description dataTable list ajax load
	 * @return
	 * @author 김재형
	 * @since 2021. 4. 13.
	 */
	@RequestMapping(value="/waitlistAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<CsLetter> waitlistAjax() {
		return csLetterService.getWaitList();
	}
	
	

	/**
	 * 
	 * @name modify
	 * @description
	 * @param req
	 * @param model
	 * @author KimJaehyung
	 * @since 2021. 5. 4.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, @RequestParam(value="startDate") String startDate 
			, @RequestParam(value="endDate") String endDate, Model model) {
		
		CsLetter data = csLetterService.getCsLetter(idx);

		data.setStartDate(startDate);
		data.setEndDate(endDate);

		model.addAttribute("data", data);
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());

	}
	
	

	/**
	 * 
	 * @name modify
	 * @description
	 * @param req
	 * @param model
	 * @author KimJaehyung
	 * @since 2021. 5. 4.
	 */
	@RequestMapping(value="/reply_modify.do", method = RequestMethod.GET)
	public void replyModify(@RequestParam(value="idx") int idx, @RequestParam(value="cdBCODE") String cdBCODE
			, Model model) {
		
		CsComment data = csLetterService.getCsComment(idx);

		data.setCdBCODE(cdBCODE);

		model.addAttribute("data", data);
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
//		model.addAttribute("menuList", menuService.getAllMenuList());
	}
	
	
	
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute CsLetter csletter, RedirectAttributes re) {
		
		csLetterService.modifyCsLetter(csletter);
//		re.addAttribute("data", csletter);
		return "redirect:list.do?startDate="+csletter.getStartDate()+"&endDate="+csletter.getEndDate();
	}
	
	
	@RequestMapping(value="/suggest-proc.do", method = RequestMethod.POST)
	public String suggestProc(@ModelAttribute CsLetter csletter, RedirectAttributes re) {
		
		csLetterService.suggestCsLetter(csletter);
//		re.addAttribute("data", csletter);
		return "redirect:list.do?startDate="+csletter.getStartDate()+"&endDate="+csletter.getEndDate();
	}
	

	@RequestMapping(value="/replyListAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<CsComment> replyListAjax(@RequestBody CsComment param) {
		return csLetterService.getReplyList(param);
	}
	
	
	@RequestMapping(value="/replyWaitListAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<CsComment> replyWaitListAjax() {
		return csLetterService.getReplyWaitList();
	}
	
	/**
	 * 
	 * @name listAjax
	 * @description dataTable list ajax load
	 * @return
	 * @author 김재형
	 */
	@RequestMapping(value="/getReplyListAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<CsComment> getReplyListAjax( @RequestBody CsComment param){

		String bCode = (String) param.getCdBCODE();
		String gubun = (String) param.getGubun();
		return csLetterService.getReplyAjaxList(bCode, gubun);
	}
	
	
	@RequestMapping(value="/reply-modify-proc.do", method = RequestMethod.POST)
	public String replyModifyProc(@ModelAttribute CsComment csComment, RedirectAttributes re) {

		csLetterService.modifyCsComment(csComment);
//		re.addAttribute("data", csletter);
		return "redirect:reply_list.do?&cdBCODE="+csComment.getCdBCODE();
	}

}