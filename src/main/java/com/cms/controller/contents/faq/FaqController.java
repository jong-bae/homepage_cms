package com.cms.controller.contents.faq;

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

import com.cms.dto.contents.faq.Faq;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.contents.faq.FaqService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName FaqController
 * @description 자주묻는 질문 
 * @author JB
 * @since 2021. 5. 14.
 */
@Controller
@RequestMapping(value="/contents/faq")
public class FaqController {

	@Autowired private MenuService menuService;
	@Autowired private FaqService faqService;
	@Autowired private CommonService commonService;
	
	/**
	 * 
	 * @name list
	 * @description 리스트 뷰
	 * @param req
	 * @author JB
	 * @since 2021. 5. 14.
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
	 * @description 리스트 데이터
	 * @return
	 * @author JB
	 * @since 2021. 5. 20.
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Faq> listAjax() {
		return faqService.getFaqList();
	}
	
	/**
	 * 
	 * @name write
	 * @description 작성 뷰
	 * @author JB
	 * @since 2021. 5. 20.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write(Model model) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description 작성처리
	 * @param faq
	 * @return
	 * @author JB
	 * @since 2021. 5. 21.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute Faq faq) {
		faqService.setFaq(faq);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description 수정 뷰
	 * @param idx
	 * @param model
	 * @author JB
	 * @since 2021. 5. 21.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("data", faqService.getFaqOne(idx));
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description 수정 처리
	 * @param faq
	 * @return
	 * @author JB
	 * @since 2021. 5. 24.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute Faq faq) {
		faqService.modifyFaqOne(faq);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name remove
	 * @description 삭제 처리
	 * @param faq
	 * @return
	 * @author JB
	 * @since 2021. 5. 24.
	 */
	@RequestMapping(value="/remove.do", method = RequestMethod.POST)
	public String remove(@ModelAttribute Faq faq) {
		faqService.removeFaq(faq.getIdx());
		return "redirect:list.do";
	}
}
