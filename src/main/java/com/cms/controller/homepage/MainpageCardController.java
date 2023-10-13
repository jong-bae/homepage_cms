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

import com.cms.dto.homepage.MainpageCard;
import com.cms.dto.master.Admin;
import com.cms.service.homepage.MainpageCardService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName MainpageCardController
 * @description 메인 카드영역 컨트롤러
 * @author JB
 * @since 2020. 12. 4.
 */
@Controller
@RequestMapping(value="homepage/main/card")
public class MainpageCardController {
	
	@Autowired private MenuService menuService;
	@Autowired private MainpageCardService mainpageCardService;

	/**
	 * 
	 * @name list
	 * @description 리스트 뷰
	 * @param req
	 * @author JB
	 * @since 2020. 12. 7.
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
	 * @description 리스트 로드
	 * @return
	 * @author JB
	 * @since 2020. 12. 10.
	 */
	@RequestMapping(value="listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<MainpageCard> listAjax() {
		return mainpageCardService.getMainpageCardList();
	}
	
	/**
	 * 
	 * @name write
	 * @description 등록 뷰
	 * @author JB
	 * @since 2020. 12. 10.
	 */
	@RequestMapping(value="write.do", method = RequestMethod.GET)
	public void write() {
	}

	/**
	 * 
	 * @name writeProc
	 * @description 등록 처리
	 * @param card
	 * @param multipartReq
	 * @param req
	 * @return
	 * @author JB
	 * @since 2020. 12. 14.
	 */
	@RequestMapping(value="write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute MainpageCard card, 
						MultipartRequest multipartReq, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin user = (Admin) session.getAttribute("userSession");
		card.setRegID(user.getId());
		
		mainpageCardService.setMainpageCard(card, multipartReq);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description 수정 뷰
	 * @param idx
	 * @param model
	 * @author JB
	 * @since 2020. 12. 15.
	 */
	@RequestMapping(value="modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("data", mainpageCardService.getMainpageCard(idx));
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description 수정처리 
	 * @param card
	 * @param multipartReq
	 * @param req
	 * @return
	 * @author JB
	 * @since 2020. 12. 16.
	 */
	@RequestMapping(value="modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute MainpageCard card, 
							MultipartRequest multipartReq, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin user = (Admin) session.getAttribute("userSession");
		card.setModID(user.getId());
		
		mainpageCardService.modifyMainpageCard(card, multipartReq);
		
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name deleteProc
	 * @description 삭제 처리
	 * @return
	 * @author JB
	 * @since 2020. 12. 18.
	 */
	@RequestMapping(value="remove.do", method = RequestMethod.POST)
	public String deleteProc(@ModelAttribute MainpageCard card) {
		mainpageCardService.removeMainpageCard(card.getIdx());
		return "redirect:list.do";
	}
}
