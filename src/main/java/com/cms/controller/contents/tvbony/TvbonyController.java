package com.cms.controller.contents.tvbony;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.cms.dto.contents.tvbony.TvCode;
import com.cms.dto.contents.tvbony.Tvbony;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.contents.tvbony.TvbonyService;
import com.cms.service.master.MenuService;

@Controller
@RequestMapping(value="/contents/tvbony/")
public class TvbonyController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private TvbonyService tvbonyService;
	@Autowired private MenuService menuService;
	@Autowired private CommonService commonService;
	
	@RequestMapping(value="/list.do", method = RequestMethod.GET)	
	public void list(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
	}
	
	/**
	 * 
	 * @name write
	 * @description 
	 * @param model
	 * @author JB
	 * @since 2022. 7. 15.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write(Model model) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
		model.addAttribute("doctorList", commonService.getDoctorSelectBox());
		model.addAttribute("tvcodeList", tvbonyService.getTvCodeList());
		model.addAttribute("iDepartList", tvbonyService.getTvCodeInterestList("관심분야"));
		model.addAttribute("iDiseaseList", tvbonyService.getTvCodeInterestList("관심질환"));
	}

	/**
	 * 
	 * @name writeProc
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2022. 7. 18.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute Tvbony param) {
		tvbonyService.setTvbony(param);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description
	 * @param idx
	 * @param model
	 * @author JB
	 * @since 2022. 7. 18.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
		model.addAttribute("doctorList", commonService.getDoctorSelectBox());
		model.addAttribute("tvcodeList", tvbonyService.getTvCodeList());
		model.addAttribute("iDepartList", tvbonyService.getTvCodeInterestList("관심분야"));
		model.addAttribute("iDiseaseList", tvbonyService.getTvCodeInterestList("관심질환"));
		model.addAttribute("data", tvbonyService.getTvbony(idx));
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description
	 * @param param
	 * @author JB
	 * @since 2022. 7. 19.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute Tvbony param) {
		tvbonyService.modifyTvbony(param);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name remove
	 * @description
	 * @return
	 * @author JB
	 * @since 2022. 7. 20.
	 */
	@RequestMapping(value="/remove.do", method = RequestMethod.GET)
	public String remove(@RequestParam(value="idx") int idx) {
		tvbonyService.removeTvbony(idx);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Tvbony> listAjax() {
		return tvbonyService.getList();
	}
	
	@RequestMapping(value="/listCategoryAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<TvCode> listCategoryAjax(@RequestBody TvCode param) {
		//System.out.println(param.getGubun());
		return tvbonyService.getTvCodeCategoryList(param);
	}
}
