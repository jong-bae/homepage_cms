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
import org.springframework.web.multipart.MultipartRequest;

import com.cms.dto.common.ResponseCode;
import com.cms.dto.doctor.Doctor;
import com.cms.dto.master.Admin;
import com.cms.service.doctor.DoctorManageService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName DoctorManageController
 * @description 의료진관리 컨트롤러
 * @author JB
 * @since 2021. 2. 8.
 */
@Controller
@RequestMapping(value="/doctor/manage")
public class DoctorManageController {

	@Autowired private MenuService menuService;
	@Autowired private DoctorManageService doctorManageService;
	
	/**
	 * 
	 * @name list
	 * @description 리스트페이지 뷰
	 * @param req
	 * @author JB
	 * @since 2021. 2. 8.
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
	 * @description 의료진 전체 리스트 조회
	 * @return
	 * @author JB
	 * @since 2021. 2. 10.
	 */
	@RequestMapping(value="listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Doctor> listAjax() {
		return doctorManageService.getDoctorAllList();
	}
	
	/**
	 * 
	 * @name write
	 * @description 작성 뷰
	 * @author JB
	 * @since 2021. 2. 16.
	 */
	@RequestMapping(value="write.do", method = RequestMethod.GET)
	public void write() {
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description 저장
	 * @param doctor
	 * @param multipartReq
	 * @return
	 * @author JB
	 * @since 2021. 2. 17.
	 */
	@RequestMapping(value="write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute Doctor doctor, MultipartRequest multipartReq) {
		doctorManageService.setDoctor(doctor, multipartReq);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description 수정 뷰
	 * @param idx
	 * @param model
	 * @author JB
	 * @since 2021. 2. 18.
	 */
	@RequestMapping(value="modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("data", doctorManageService.getDoctor(idx));
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description
	 * @param doctor
	 * @param multipartReq
	 * @return
	 * @author JB
	 * @since 2021. 2. 19.
	 */
	@RequestMapping(value="modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute Doctor doctor, MultipartRequest multipartReq) {
		doctorManageService.modifyDoctor(doctor, multipartReq);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name taSwap
	 * @description
	 * @author JB
	 * @since 2021. 2. 22.
	 */
	@RequestMapping(value="taSwapAjax.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode taSwap(@RequestBody Doctor param) {
		ResponseCode result = new ResponseCode();
		result.setResult(doctorManageService.taSwap(param.getDidx()));
		return  result;
	}
	
	/**
	 * 
	 * @name resiSwap
	 * @description
	 * @author JB
	 * @since 2021. 2. 22.
	 */
	@RequestMapping(value="resiSwapAjax.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode resiSwap(@RequestBody Doctor param) {
		ResponseCode result = new ResponseCode();
		result.setResult(doctorManageService.resiSwap(param.getDidx()));
		return  result;
	}
}
