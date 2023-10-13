package com.cms.controller.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import com.cms.dto.common.CKEditor;
import com.cms.dto.master.Admin;
import com.cms.dto.master.Menu;
import com.cms.service.common.CommonService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName CommonController
 * @description 공통 컨트롤러
 * @author JB
 * @since 2020. 9. 23.
 */
@Controller
public class CommonController {

	@Autowired private MenuService menuService;
	@Autowired private CommonService commonService;
	
	/**
	 * 
	 * @name treeMenuAjax
	 * @description 사이드 트리메뉴 Ajax 로드
	 * @param param
	 * @return
	 * @author JB
	 * @since 2020. 9. 22.
	 */
	@RequestMapping(value="/treeMenuAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Menu> treeMenuAjax(@RequestBody Menu param, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		return menuService.getTreeMenu(param, admin);
	}
	
	/**
	 * 
	 * @name editorUpload
	 * @description editor 파일 서버 업로드
	 * @param multipartReq
	 * @author JB
	 * @since 2020. 10. 28.
	 */
	@RequestMapping(value="/editorUpload.do", method = RequestMethod.POST)
	public @ResponseBody CKEditor editorUpload(MultipartRequest multipartReq) {
		return commonService.editorUpload(multipartReq);
	}
	
}
