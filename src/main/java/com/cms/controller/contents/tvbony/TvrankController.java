package com.cms.controller.contents.tvbony;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.dto.common.ResponseCode;
import com.cms.dto.master.Admin;
import com.cms.service.contents.tvbony.TvrankService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName TvrankController
 * @description
 * @author JB
 * @since 2022. 6. 23.
 */
@Controller
@RequestMapping(value="/contents/tvbony/rank")
public class TvrankController {

	@Autowired private MenuService menuService;
	@Autowired private TvrankService tvRankService;
	
	/**
	 * 
	 * @name list
	 * @description
	 * @param req
	 * @author JB
	 * @since 2022. 6. 23.
	 */
	@RequestMapping(value="list.do", method = RequestMethod.GET)
	public void list(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
		model.addAttribute("data", tvRankService.getTvcodeList());
	}
	
	/**
	 * 
	 * @name saveList
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2022. 6. 27.
	 */
	@RequestMapping(value="saveList.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode saveList(@RequestBody Map<String, Object> param) {
		return tvRankService.setOrder(param);
	}
}
