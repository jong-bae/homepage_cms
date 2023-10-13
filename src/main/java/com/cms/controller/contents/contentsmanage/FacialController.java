package com.cms.controller.contents.contentsmanage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import com.cms.dto.common.BZBoard;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.contents.contentsmanager.FacialService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName FacialController
 * @description 안면신경마비 Facial Nerve palsy
 * @author JB
 * @since 2021. 10. 6.
 */
@Controller
@RequestMapping(value="/contents/contentsmanage/facialnp")
public class FacialController {

	@Autowired private MenuService menuService;
	@Autowired private CommonService commonService;
	@Autowired private FacialService facialService;
	
	/**
	 * 
	 * @name list
	 * @description
	 * @param req
	 * @author JB
	 * @since 2021. 10. 6.
	 */
	@RequestMapping(value="list.do", method = RequestMethod.GET)
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
	 * @since 2021. 10. 7.
	 */
	@RequestMapping(value="listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<BZBoard> listAjax() {
		return facialService.getFacialList();
	}
	
	/**
	 * 
	 * @name write
	 * @description
	 * @param model
	 * @author JB
	 * @since 2021. 10. 7.
	 */
	@RequestMapping(value="write.do", method = RequestMethod.GET)
	public void write(Model model) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description
	 * @param param
	 * @param multipartReq
	 * @param req
	 * @return
	 * @author JB
	 * @since 2021. 10. 15.
	 */
	@RequestMapping(value="write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute BZBoard param, MultipartRequest multipartReq, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		param.setStrName(admin.getName());
		param.setStrID(admin.getId());
		facialService.setFacial(param, multipartReq);
		
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description
	 * @param idx
	 * @param model
	 * @author JB
	 * @since 2021. 10. 18.
	 */
	@RequestMapping(value="modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
		model.addAttribute("data", facialService.getFacial(idx));
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description
	 * @param param
	 * @param multipartReq
	 * @return
	 * @author JB
	 * @since 2021. 10. 19.
	 */
	@RequestMapping(value="modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute BZBoard param, MultipartRequest multipartReq) {
		facialService.modifyFacial(param, multipartReq);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name remove
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 10. 19.
	 */
	@RequestMapping(value="remove.do", method = RequestMethod.POST)
	public String remove(@ModelAttribute BZBoard param) {
		facialService.removeFacial(param.getIdx());
		return "redirect:list.do";
	}
}
