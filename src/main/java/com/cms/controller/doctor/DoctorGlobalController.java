package com.cms.controller.doctor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.dto.common.ResponseCode;
import com.cms.dto.doctor.Doctor;
import com.cms.dto.doctor.DoctorSort;
import com.cms.dto.master.Admin;
import com.cms.service.doctor.DoctorGlobalService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName DoctorGlobalController
 * @description
 * @author JB
 * @since 2021. 11. 5.
 */
@Controller
@RequestMapping(value="/doctor/global")
public class DoctorGlobalController {

	@Autowired private MenuService menuService;
	@Autowired private DoctorGlobalService doctorGlobalService;
	
	/**
	 * 
	 * @name list
	 * @description
	 * @param req
	 * @author JB
	 * @since 2021. 11. 5.
	 */
	@RequestMapping(value="list.do", method = RequestMethod.GET)
	public void list(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setTopMenuList(menuService.getMenuAllDepth1());
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
	}
	
	/**
	 * 
	 * @name listAjax
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 11. 8.
	 */
	@RequestMapping(value="listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Doctor> listAjax(@RequestBody Map<String, String> param) {
		return doctorGlobalService.getGlobalList(param);
	}
	
	/**
	 * 
	 * @name removeDoctor
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 11. 10.
	 */
	@RequestMapping(value="removeDoctor.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode removeDoctor(@RequestBody Map<String, Integer> param) {
		return doctorGlobalService.removeGlobalDoctor(param.get("idx"));
	}
	
	/**
	 * 
	 * @name addDoctor
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 11. 12.
	 */
	@RequestMapping(value="addDoctor.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode addDoctor(@RequestBody Map<String, Integer> param) {
		return doctorGlobalService.addGlobalDoctor(param.get("idx"));
	}
	
	/**
	 * 
	 * @name sortList
	 * @description
	 * @param parma
	 * @return
	 * @author JB
	 * @since 2021. 11. 12.
	 */
	@RequestMapping(value="sortList.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode sortList(@RequestBody DoctorSort param) {
		ResponseCode result = new ResponseCode();
		result.setResult(doctorGlobalService.sortList(param));
		return result;
		
	}
}
