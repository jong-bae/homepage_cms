package com.cms.controller.master;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.dto.master.Admin;
import com.cms.dto.master.Menu;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName MenuController
 * @description 메뉴관리 컨트롤러
 * @author JB
 * @since 2020. 9. 22.
 */
@Controller
@RequestMapping(value="/master/menu")
public class MenuController {
	
	@Autowired private MenuService menuService;
	
	/**
	 * 
	 * @name list
	 * @description 메뉴관리 리스트
	 * @param req
	 * @author JB
	 * @since 2020. 9. 25.
	 */
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public void list(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setTopMenuList(menuService.getMenuAllDepth1());
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
	}
	
	/**
	 * 
	 * @name getChildMenuList
	 * @description 선택 메뉴에 대한 하위 메뉴리스트 JSON
	 * @param param
	 * @return
	 * @author JB
	 * @since 2020. 10. 7.
	 */
	@RequestMapping(value="/getChildMenuAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Menu> getChildMenuAjax(@RequestBody Menu param) {
		return menuService.getChildMenuList(param);
	}
	
	/**
	 * 
	 * @name write
	 * @description 메뉴 등록 뷰
	 * @param model
	 * @param depth
	 * @param parentIdx
	 * @return
	 * @author JB
	 * @since 2020. 10. 12.
	 */
	@RequestMapping(value="/write.do/{depth}", method = RequestMethod.GET)
	public String write(Model model, @PathVariable int depth,
						@RequestParam(value="pidx", required=false, defaultValue="0") int parentIdx) {
		model.addAttribute("depth", depth);
		model.addAttribute("parentIdx", parentIdx);
		return "master/menu/write";
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description 메뉴 신규 등록
	 * @param menu
	 * @param req
	 * @return
	 * @author JB
	 * @since 2020. 10. 13.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute Menu menu, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin user = (Admin) session.getAttribute("userSession");
		menu.setRegId(user.getId());
		menuService.setMenu(menu);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name remove
	 * @description 선택메뉴 삭제 (상위뎁스 삭제시 하위뎁스 모두 삭제)
	 * @param menu
	 * @return
	 * @author JB
	 * @since 2020. 10. 13.
	 */
	@RequestMapping(value="/remove.do", method = RequestMethod.POST)
	public String remove(@ModelAttribute Menu menu) {
		menuService.removeMenu(menu);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description 메뉴 수정 뷰
	 * @param idx
	 * @param model
	 * @author JB
	 * @since 2020. 10. 13.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("data", menuService.getCurrentMenu(idx)); 
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description 메뉴 수정
	 * @param menu
	 * @param req
	 * @return
	 * @author JB
	 * @since 2020. 10. 13.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute Menu menu, HttpServletRequest req) {
		Admin user = (Admin) req.getSession().getAttribute("userSession");
		menu.setModId(user.getId());
		menuService.modifyMenu(menu);
		return "redirect:list.do";
	}
	
}
