package com.cms.controller.contents.tvbony;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.dto.common.ResponseCode;
import com.cms.dto.contents.tvbony.TvCode;
import com.cms.dto.master.Admin;
import com.cms.service.contents.tvbony.TvcodeService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName TvcodeController
 * @description TV보니 관심질환분야 관리
 * @author JB
 * @since 2022. 6. 20.
 */
@Controller
@RequestMapping(value="/contents/tvbony/tvcode")
public class TvcodeController {

	@Autowired private MenuService menuService;
	@Autowired private TvcodeService tvCodeService;
	
	/**
	 * 
	 * @name list
	 * @description
	 * @param req
	 * @author JB
	 * @since 2022. 6. 20.
	 */
	@RequestMapping(value="/list.do", method = RequestMethod.GET)	
	public void list(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
	}
	
	/**
	 * 
	 * @name listAjax
	 * @description
	 * @return
	 * @author JB
	 * @since 2022. 6. 20.
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<TvCode> listAjax() {
		return tvCodeService.getTvcodeList();
	}
	
	/**
	 * 
	 * @name write
	 * @description
	 * @author JB
	 * @since 2022. 6. 20.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write() {
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2022. 6. 20.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute TvCode param) {
		tvCodeService.setTvcode(param);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description
	 * @param idx
	 * @param model
	 * @author JB
	 * @since 2022. 6. 21.
	 */
	@RequestMapping(value="modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("data", tvCodeService.getTvcodeOne(idx));
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2022. 6. 21.
	 */
	@RequestMapping(value="modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute TvCode param) {
		tvCodeService.modifyTvcode(param);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name dataCheck
	 * @description 중복체크
	 * @param param
	 * @return
	 * @author JB
	 * @since 2022. 6. 22.
	 */
	@RequestMapping(value="dataCheck.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode dataCheck(@RequestBody Map<String, String> param) {
		return tvCodeService.getTvcodeCheck(param);
	}
	
}
