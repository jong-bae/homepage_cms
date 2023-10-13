package com.cms.controller.contents.contentsmanage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.cms.service.contents.contentsmanager.BookService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName BookController
 * @description  도서 관리 컨트롤러
 * @author 김재형
 * @since 2021.06.10.
 */
@Controller
@RequestMapping(value="/contents/contentsmanage/book")
public class BookController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MenuService menuService;
	@Autowired private BookService bookService;

	
	
	/**
	 * @name list
	 * @description 도서 관리 뷰 페이지
	 * @param req
	 * @author 김재형
	 * @since 2021.06.10.
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
	 * @description dataTable list ajax load
	 * @return
	 * @author 김재형
	 * @since 2021.06.10.
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<BZBoard> listAjax() {
		return bookService.getList();
	}
	
	/**
	 * 
	 * @name write 
	 * @description 등록 뷰 호출
	 * @param model
	 * @author 김재형
	 * @since 2021. 6. 14.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write(Model model) {
		
	}
	
	
	/**
	 * 
	 * @name writeProc
	 * @description 등록
	 * @param branch
	 * @param multipartReq
	 * @return
	 * @author KimJaehyung
	 * @since 2021. 6. 14.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute BZBoard bzBoard, MultipartRequest multipartReq) {
		bookService.setBook(bzBoard, multipartReq);
		return "redirect:list.do";
	}
	
	
	/**
	 * 
	 * @name modify
	 * @description 도서 수정 뷰
	 * @param idx
	 * @param model
	 * @author 김재형
	 * @since 2021. 06. 16.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("data", bookService.getBook(idx));
	}
	
	
	/**
	 * 
	 * @name remove
	 * @description 삭제
	 * @param idx
	 * @param idx
	 * @return
	 * @author KimJaehyung
	 * @since 2021. 06. 16.
	 */
	@RequestMapping(value="/remove.do", method = RequestMethod.GET)
	public String removeProc(@RequestParam(value="idx") int idx, Model model) {
		bookService.removeBook(idx);
		return "redirect:list.do";
	}
	
	
	/**
	 * 
	 * @name modifyProc
	 * @description  공지사항 수정
	 * @param notice, req
	 * @return
	 * @author 김재형
	 * @since 2021. 06. 16.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute BZBoard bzBoard, MultipartRequest multipartReq) {
		bookService.modifyBook(bzBoard, multipartReq);	
		return "redirect:list.do";
	}
	
	
	
	
	
}
