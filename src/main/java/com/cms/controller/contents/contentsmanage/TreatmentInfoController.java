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

import com.cms.dto.contents.contentsmanage.TreatmentInfo;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.contents.contentsmanager.TreatmentInfoService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName TreatmentInfoController
 * @description 진료안내 관리
 * @author JB
 * @since 2021. 5. 10.
 */
@Controller
@RequestMapping(value="/contents/contentsmanage/treatmentInfo")
public class TreatmentInfoController {

	@Autowired private MenuService menuService;
	@Autowired private TreatmentInfoService treatmentInfoService;
	@Autowired private CommonService commonService;
	
	/**
	 * 
	 * @name list
	 * @description 리스트 뷰
	 * @param req
	 * @author JB
	 * @since 2021. 5. 11.
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
	 * @description 리스트 내용 조회
	 * @return
	 * @author JB
	 * @since 2021. 5. 11.
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<TreatmentInfo> listAjax() {
		return  treatmentInfoService.getTreatmentInfoList();
	}
	
	/**
	 * 
	 * @name write
	 * @description 등록 뷰
	 * @author JB
	 * @since 2021. 5. 11.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write(Model model) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description 등록처리
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 5. 11.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute TreatmentInfo param) {
		treatmentInfoService.setTreatmentInfo(param);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description 수정 뷰
	 * @author JB
	 * @since 2021. 5. 11.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="bcode") int bcode, Model model) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
		model.addAttribute("data", treatmentInfoService.getTreatmentInfoOne(bcode));
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description 수정 처리
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 5. 13.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute TreatmentInfo param) {
		treatmentInfoService.modifyTreatmentInfoOne(param);
		return "redirect:list.do";
	}
	
}
