package com.cms.controller.doctor;

import java.util.List;
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
import com.cms.dto.doctor.Doctor;
import com.cms.dto.doctor.DoctorPart;
import com.cms.dto.doctor.DoctorSort;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.doctor.DoctorSortService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName DoctorSortController
 * @description 의료진 순서관리 컨트롤러
 * @author JB
 * @since 2021. 2. 23.
 */
@Controller
@RequestMapping(value="/doctor/sort")
public class DoctorSortController {

	@Autowired private MenuService menuService;
	@Autowired private CommonService commonService;
	@Autowired private DoctorSortService doctorSortService;
	
	/**
	 * 
	 * @name list
	 * @description
	 * @param req
	 * @author JB
	 * @since 2021. 2. 23.
	 */
	@RequestMapping(value="list.do", method = RequestMethod.GET)
	public void list(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setTopMenuList(menuService.getMenuAllDepth1());
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
		model.addAttribute("branchList", commonService.getBranchList());
	}
	
	/**
	 * 
	 * @name getPartAjax
	 * @description 센터리스트 조회
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 2. 24.
	 */
	@RequestMapping(value="getPartAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<DoctorPart> getPartAjax(@RequestBody Map<String, Integer> param) {
		return doctorSortService.getPartList(param.get("idx"));
	}
	
	/**
	 * 
	 * @name getDoctorAjax
	 * @description 의료진리스트 조회
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 2. 24.
	 */
	@RequestMapping(value="getDoctorAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<DoctorPart> getDoctorAjax(@RequestBody Map<String, Integer> param) {
		return doctorSortService.getDoctorList(param.get("idx"));
	}
	
	/**
	 * 
	 * @name setPartAjax
	 * @description 센터정보 등록
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 3. 10.
	 */
	@RequestMapping(value="setPartAjax.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode setPartAjax(@RequestBody DoctorPart param) {
		ResponseCode result = new ResponseCode();
		result.setResult(doctorSortService.setPart(param));
		return result;
	}
	
	/**
	 * 
	 * @name getPartOne
	 * @description 선택한 센터정보 조회
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 3. 12.
	 */
	@RequestMapping(value="getPartOne.do", method = RequestMethod.POST)
	public @ResponseBody DoctorPart getPartOne(@RequestBody DoctorPart param) {
		return doctorSortService.getPartOne(param.getIdx());
	}
	
	/**
	 * 
	 * @name modifyPartAjax
	 * @description 센터구분 수정
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 3. 12.
	 */
	@RequestMapping(value="modifyPartAjax.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode modifyPartAjax(@RequestBody DoctorPart param) {
		ResponseCode result = new ResponseCode();
		result.setResult(doctorSortService.modifyPart(param));
		return result;
	}
	
	/**
	 * 
	 * @name removePart
	 * @description 센터구분 삭제
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 3. 12.
	 */
	@RequestMapping(value="removePart.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode removePart(@RequestBody DoctorPart param) {
		ResponseCode result = new ResponseCode();
		result.setResult(doctorSortService.removePart(param.getIdx()));
		return result;
	}
	
	/**
	 * 
	 * @name removeDoctor
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 3. 12.
	 */
	@RequestMapping(value="removeDoctor.do", method = RequestMethod.POST)
	public @ResponseBody  ResponseCode removeDoctor(@RequestBody DoctorPart param) {
		ResponseCode result = new ResponseCode();
		result.setResult(doctorSortService.removeDoctor(param.getIdx()));
		return result;
	}
	
	/**
	 * 
	 * @name sortList
	 * @description 순서정렬
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 3. 16.
	 */
	@RequestMapping(value="sortList.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode sortList(@RequestBody DoctorSort param) {
		ResponseCode result = new ResponseCode();
		result.setResult(doctorSortService.modifyPartOrder(param));
		return result;
	}
	
	/**
	 * 
	 * @name searchList
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 3. 18.
	 */
	@RequestMapping(value="searchList.do", method = RequestMethod.POST)
	public @ResponseBody List<Doctor> searchList(@RequestBody Map<String, String> param ) {
		return doctorSortService.getDoctorSearchList(param.get("searchVal"));
	}
	
	/**
	 * 
	 * @name setDoctorAjax
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 3. 19.
	 */
	@RequestMapping(value="setDoctorAjax.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode setDoctorAjax(@RequestBody DoctorPart param) {
		ResponseCode result = new ResponseCode();
		result.setResult(doctorSortService.setDoctor(param));
		return result;
	}
}
