package com.cms.controller.doctor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.dto.doctor.Nurse;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.doctor.NurseService;
import com.cms.service.master.MenuService;

@Controller
@RequestMapping("/doctor/nurse")
public class NurseManageController {

	@Autowired private MenuService menuService;
	@Autowired private NurseService nurseService;
	@Autowired private CommonService commonService;
	
	/**
	 * 
	 * @name list
	 * @description
	 * @param req
	 * @author JB
	 * @since 2021. 10. 21.
	 */
	@RequestMapping(value="list.do", method = RequestMethod.GET)
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
	 * @since 2021. 10. 21.
	 */
	@RequestMapping(value="listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Nurse> listAjax() {
		return nurseService.getNurseAllList();
	}
	
	/**
	 * 
	 * @name write
	 * @description
	 * @param model
	 * @author JB
	 * @since 2021. 10. 22.
	 */
	@RequestMapping(value="write.do", method = RequestMethod.GET)
	public void write(Model model) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 10. 22.
	 */
	@RequestMapping(value="write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute Nurse param) {
		nurseService.setNurse(param);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description
	 * @param model
	 * @param idx
	 * @author JB
	 * @since 2021. 10. 22.
	 */
	@RequestMapping(value="modify.do", method = RequestMethod.GET)
	public void modify(Model model, @RequestParam(value="idx") int idx) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
		model.addAttribute("data", nurseService.getNurse(idx));
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 10. 22.
	 */
	@RequestMapping(value="modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute Nurse param) {
		nurseService.modifyNurse(param);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name loadDoctorList
	 * @description 담당의료진 병의원별 리스트 조회
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 10. 22.
	 */
	@RequestMapping(value="loadDoctorList.do", method = RequestMethod.POST)
	public @ResponseBody List<Nurse> loadDoctorList(@RequestBody Nurse param) {
		return nurseService.getDoctorList(param.getIdx());
	}
}
