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

import com.cms.dto.contents.contentsmanage.Agreement;
import com.cms.dto.master.Admin;
import com.cms.service.contents.contentsmanager.AgreementService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName AgreementController
 * @description
 * @author JB
 * @since 2021. 5. 4.
 */
@Controller
@RequestMapping(value="/contents/contentsmanage/agreement")
public class AgreementController {
	
	@Autowired private MenuService menuService;
	@Autowired private AgreementService agreementService;

	/**
	 * 
	 * @name list
	 * @description 리스트 뷰
	 * @param req
	 * @author JB
	 * @since 2021. 5. 4.
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
	 * @description 리스트 로드
	 * @return
	 * @author JB
	 * @since 2021. 5. 4.
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Agreement> listAjax() {
		return agreementService.getAgreementList();
	}
	
	/**
	 * 
	 * @name write
	 * @description 등록 뷰
	 * @author JB
	 * @since 2021. 5. 4.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write() {
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description 등록처리
	 * @return
	 * @author JB
	 * @since 2021. 5. 6.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute Agreement agreement) {
		agreementService.setAgreement(agreement);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description 수정 뷰
	 * @param pid
	 * @param model
	 * @author JB
	 * @since 2021. 5. 6.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="pid") String pid, Model model) {
		model.addAttribute("data", agreementService.getAgreementOne(pid));
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description 수정처리
	 * @param agreement
	 * @return
	 * @author JB
	 * @since 2021. 5. 7.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute Agreement agreement) {
		agreementService.modifyAgreement(agreement);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name remove
	 * @description 삭제
	 * @param agreement
	 * @return
	 * @author JB
	 * @since 2021. 5. 7.
	 */
	@RequestMapping(value="/remove.do", method = RequestMethod.POST)
	public String remove(@ModelAttribute Agreement agreement) {
		agreementService.removeAgreement(agreement.getPid());
		return "redirect:list.do";
	}
}
