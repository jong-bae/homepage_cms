package com.cms.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cms.dto.common.ResponseCode;
import com.cms.dto.master.Admin;
import com.cms.service.common.LoginService;
import com.cms.service.master.AdminAuthService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName MainController
 * @description 시작 컨트롤러
 * @author JB
 * @since 2020. 9. 17.
 */

@Controller
public class MainController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MenuService menuService;
	@Autowired private LoginService loginService;
	@Autowired private AdminAuthService adminAuthService;

	/**
	 * 
	 * @name login
	 * @description Default Start Page
	 * @return
	 * @author JB
	 * @since 2020. 9. 21.
	 */
	@RequestMapping(value= {"/", "login.do"}, method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	/**
	 * 
	 * @name loginCheck
	 * @description 로그인 처리
	 * @param session
	 * @param admin
	 * @return
	 * @author JB
	 * @since 2020. 9. 21.
	 */
	@RequestMapping(value="/loginCheck.do", method = RequestMethod.POST)
	public String loginCheck(HttpSession session, @ModelAttribute Admin admin) {
		//redirectModel.addFlashAttribute("depth1", menuService.getMenuDepth1());
		Admin user = new Admin();
		// 계정 확인
		user = loginService.getLoginUserInfo(admin);
		if(user != null && user.getUse_yn().equals("Y")) {
			// MASTER, GENERAL 구분
			if(user.getAuth().equals("master")) {
				// 마스터 전체 메뉴 로드
				user.setTopMenuList(menuService.getMenuAllDepth1());
			} else {
				// 일반 권한에 따른 메뉴 로드
				user.setTopMenuList(menuService.getMenuAuthDepth1(user.getId()));
				user.setAuthList(adminAuthService.getAdminAuth(user.getId()));
			}
			// 임시 로그인 처리 
			loginService.modifyLastLoginDate(user.getId());
			session.setAttribute("userSession", user);
			return "redirect:/index.do";
		} else {
			return "redirect:/login.do";
		}
		
	}
	
	/**
	 * 
	 * @name index
	 * @description index
	 * @author JB
	 * @since 2020. 9. 21.
	 */
	@RequestMapping(value="/index.do", method = RequestMethod.GET)
	public void index() {
		
	}
	
	/**
	 * 
	 * @name logout
	 * @description 로그아웃
	 * @return
	 * @author JB
	 * @since 2020. 9. 23.
	 */
	@RequestMapping(value="/logout.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		req.getSession(true);
		return "login";
	}
	
	/**
	 * 
	 * @name findPassword
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 10. 29.
	 */
	@RequestMapping(value="/findpwd.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode findPassword(@RequestBody Map<String, String> param) {
		ResponseCode result = loginService.modifyFindPwd(param);
		return result;
	}
	
	/**
	 * 
	 * @name pwdChange
	 * @description 비밀번호 변경 뷰
	 * @author JB
	 * @since 2021. 11. 3.
	 */
	@RequestMapping(value="/pwdChange.do", method = RequestMethod.GET)
	public void pwdChange() {
	}
	
	/**
	 * 	
	 * @name pwdChangeProc
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 11. 3.
	 */
	@RequestMapping(value="/pwdChange-proc.do", method = RequestMethod.POST)
	public String pwdChangeProc(@ModelAttribute Admin param, HttpServletRequest req, RedirectAttributes redirectAttr) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		param.setId(admin.getId());
		
		ResponseCode result = loginService.modifyChangePwd(param);
		
		if(result.isResult()) {
			return "redirect:/login.do";
		} else {
			redirectAttr.addFlashAttribute("data", result);
			return "redirect:/pwdChange.do";
		}
	}
}
