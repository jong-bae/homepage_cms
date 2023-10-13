package com.cms.controller.homepage;

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

import com.cms.dto.homepage.Popup;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.homepage.PopupService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName PopupController
 * @description 팝업컨트롤러
 * @author JB
 * @since 2020. 10. 26.
 */
@Controller
@RequestMapping(value="/homepage/popup")
public class PopupController {
	
	@Autowired private MenuService menuService;
	@Autowired private PopupService popupService;
	@Autowired private CommonService commonService;

	/**
	 * 
	 * @name list
	 * @description
	 * @param req
	 * @author JB
	 * @since 2020. 10. 26.
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
	 * @param param
	 * @return
	 * @author JB
	 * @since 2020. 10. 26.
	 */
	@RequestMapping(value="listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Popup> listAjax() {
//	public @ResponseBody List<Popup> listAjax(@PathVariable String param) {
		return popupService.getPopupList();
	}
	
	/**
	 * 
	 * @name write
	 * @description 팝업 등록 뷰
	 * @param param
	 * @param model
	 * @author JB
	 * @since 2020. 10. 27.
	 */
	@RequestMapping(value="write.do", method = RequestMethod.GET)
	public String write(Model model) {
//	public String write(@RequestParam(value="kind") String param, Model model) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
		//model.addAttribute("kind", param);
		
		// 모바일 리뉴얼로 M 등록화면 분기
	/*	if(param.equals("pc")) {
			return "homepage/popup/write-pc";
		} else {
			return "homepage/popup/write-m";
		}*/

		return "homepage/popup/write-m";
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description
	 * @param popup
	 * @param multipartReq
	 * @param req
	 * @return
	 * @author JB
	 * @since 2020. 11. 5.
	 */
	@RequestMapping(value="write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute Popup popup, MultipartRequest multipartReq, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin user = (Admin) session.getAttribute("userSession");
		popup.setRegID(user.getId());
//		String kind = popup.getKind();
		
		popupService.setPopup_mobile(popup, multipartReq);
/*		if(kind.equals("pc")) {
		} else {
		}
*/		
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description 팝업수정 뷰
	 * @param kind
	 * @param idx
	 * @param model
	 * @return
	 * @author JB
	 * @since 2020. 11. 10.
	 */
	@RequestMapping(value="modify.do", method = RequestMethod.GET)
	public String modify(@RequestParam(value="kind") String kind, 
							@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("kind", kind);
		model.addAttribute("data", popupService.getPopup(kind, idx));
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
		
		if(kind.equals("pc")) {
			return null;
		} else {
			return "homepage/popup/modify-m";
		}
	}
	
	/**          
	 * 
	 * @name modifyProc
	 * @description
	 * @param popup
	 * @param multipartReq
	 * @param req
	 * @return
	 * @author JB
	 * @since 2020. 11. 11.
	 */
	@RequestMapping(value="modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute Popup popup, MultipartRequest multipartReq, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin user = (Admin) session.getAttribute("userSession");
		popup.setModID(user.getId());
		String kind = popup.getKind();
		
		if(kind.equals("pc")) {
			
		} else {
			popupService.modifyPopup_mobile(popup, multipartReq);
		}
		
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name deleteProc
	 * @description 삭제 처리
	 * @param popup
	 * @return
	 * @author JB
	 * @since 2020. 12. 18.
	 */
	@RequestMapping(value="remove.do", method = RequestMethod.POST)
	public String deleteProc(@ModelAttribute Popup popup) {
		popupService.removePopup_mobile(popup.getIdx());
		return "redirect:list.do";
	}
	
}
