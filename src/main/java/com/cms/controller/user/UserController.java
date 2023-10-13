package com.cms.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.dto.master.Admin;
import com.cms.dto.user.User;
import com.cms.service.master.MenuService;
import com.cms.service.user.UserService;

/**
 * 
 * @ClassName UserController
 * @description
 * @author JB
 * @since 2021. 9. 16.
 */
@Controller
@RequestMapping(value="/user")
public class UserController {

	@Autowired private MenuService menuService;
	@Autowired private UserService userService;

	/**
	 * 
	 * @name list
	 * @description
	 * @param req
	 * @author JB
	 * @since 2021. 9. 16.
	 */
	@RequestMapping(value="list.do", method= RequestMethod.GET)
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
	 * @since 2021. 9. 16.
	 */
	@RequestMapping(value="listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<User> listAjax() {
		return userService.getUserList();
	}
	
	
}
