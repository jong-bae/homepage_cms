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

import com.cms.dto.homepage.Seo;
import com.cms.dto.master.Admin;
import com.cms.service.homepage.SeoService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName SeoController
 * @description SEO 검색-메타태그 컨트롤러
 * @author JB
 * @since 2021. 4. 30.
 */
@Controller
@RequestMapping(value="/homepage/seo")
public class SeoController {

	@Autowired private MenuService menuService;
	@Autowired private SeoService seoService;
	
	/**
	 * 
	 * @name list
	 * @description seo 리스트
	 * @param req
	 * @param param
	 * @author JB
	 * @since 2021. 4. 27.
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
	 * @description list data ajax
	 * @return
	 * @author JB
	 * @since 2021. 4. 27.
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Seo> listAjax() {
		return seoService.getMetatagList();
	}
	
	/**
	 * 
	 * @name write
	 * @description 작성 뷰
	 * @author JB
	 * @since 2021. 4. 27.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write() {
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description 신규 등록
	 * @return
	 * @author JB
	 * @since 2021. 4. 28.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute Seo seo) {
		seoService.setMetatag(seo);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description 수정 뷰
	 * @param idx
	 * @param model
	 * @author JB
	 * @since 2021. 4. 28.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("data", seoService.getMetadataOne(idx));
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description 수정 
	 * @param seo
	 * @author JB
	 * @since 2021. 4. 29.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute Seo seo) {
		seoService.modifyMetadataOne(seo);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name remove
	 * @description 삭제
	 * @return
	 * @author JB
	 * @since 2021. 4. 29.
	 */
	@RequestMapping(value="/remove.do", method = RequestMethod.POST)
	public String remove(@ModelAttribute Seo seo) {
		seoService.removeMetadataOne(seo.getIdx());
		return "redirect:list.do";
	}
	
}
