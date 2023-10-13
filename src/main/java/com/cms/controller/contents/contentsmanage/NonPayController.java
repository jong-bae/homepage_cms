package com.cms.controller.contents.contentsmanage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.cms.dto.common.BZCode;
import com.cms.dto.common.ResponseCode;
import com.cms.dto.contents.contentsmanage.NonPayment;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.contents.contentsmanager.NonPayService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName NonPayController
 * @description 비급여
 * @author JB
 * @since 2021. 5. 25.
 */
@Controller
@RequestMapping(value="/contents/contentsmanage/nonpay")
public class NonPayController {

	@Autowired private MenuService menuService;
	@Autowired private NonPayService nonPayService;
	@Autowired private CommonService commonService;
	
	/**
	 * 
	 * @name list
	 * @description
	 * @param req
	 * @author JB
	 * @since 2021. 5. 25.
	 */
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public void list(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
		model.addAttribute("allCnt", nonPayService.getNonPaymentAllCount());
		model.addAttribute("bcodeList", commonService.getBranchList());
	}
	
	/**
	 * 
	 * @name listAjax
	 * @description
	 * @return
	 * @author JB
	 * @since 2021. 5. 27.
	 * @description datatable 에 JSON으로 설정해도 JSON으로 안넘어오고 폼데이터로 넘어옴
	 * 				그래서 @RequestBody 로 받으면 400 에러 떨어짐
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<NonPayment> listAjax(@ModelAttribute NonPayment param) {
		return nonPayService.getNonPaymentList(param);
	}
	
	/**
	 * 
	 * @name loadHistoryDate
	 * @description 병의원 별 비급여 갱신 이력 조회 
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 5. 28.
	 */
	@RequestMapping(value="/loadHistory.do", method = RequestMethod.POST)
	public @ResponseBody List<NonPayment> loadHistoryDate(@RequestBody NonPayment param) {
		return nonPayService.getHistoryDateList(param.getbCode());
	}
	
	/**
	 * 
	 * @name loadChildCode
	 * @description 하위 비급여코드 조회
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 6. 4.
	 */
	@RequestMapping(value="/loadChildCode.do", method = RequestMethod.POST)
	public @ResponseBody List<BZCode> loadChildCode(@RequestBody BZCode param) {
		return commonService.getNPaymentCodeList(param.getCode());
	}
	
	/**
	 * 
	 * @name excelUpload
	 * @description
	 * @param param
	 * @param multipartReq
	 * @return
	 * @author JB
	 * @since 2021. 6. 2.
	 */
	@RequestMapping(value="/excelUpload.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode excelUpload(NonPayment param, MultipartRequest multipartReq) {
		return  nonPayService.excelUpload(param, multipartReq); 
	}
	
	/**
	 * 
	 * @name write
	 * @description 등록 뷰
	 * @param model
	 * @author JB
	 * @since 2021. 6. 3.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write(Model model, @RequestParam(value="status") String status) {
		model.addAttribute("bcodeList", commonService.getBranchList());
		model.addAttribute("codeList", commonService.getNPaymentCodeList(null));
		model.addAttribute("status", status);
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description 등록처리
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 9. 1.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute NonPayment param) {
		nonPayService.setNonPayment(param);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description 수정뷰
	 * @param idx
	 * @author JB
	 * @since 2021. 6. 3.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model ) {
		NonPayment data = nonPayService.getNonPaymentOne(idx);
		model.addAttribute("bcodeList", commonService.getBranchList());
		model.addAttribute("data", data);
		
		// code 와 parentCode 가 같으면 depth1 만 필요
		if(data.getCode().equals(data.getParentCode())) {
			model.addAttribute("codeList1", commonService.getNPaymentCodeList(null));
		}
		else {
			model.addAttribute("codeList1", commonService.getNPaymentCodeList(null));
			model.addAttribute("codeList2", commonService.getNPaymentCodeList(data.getParentCode()));
		}
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description 수정처리
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 6. 8.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute NonPayment param) {
		nonPayService.modifyNonPaymentOne(param);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name excelDown
	 * @description 병의원등록자료 다운로드
	 * @param response
	 * @return
	 * @author JB
	 * @since 2021. 8. 31.
	 */
	@RequestMapping(value="/excelDown.do", method = RequestMethod.GET)
	public String excelDown(HttpServletResponse response, Map<String, Object> modelMap, 
								@RequestParam(value="bcode") String bcode,
								@RequestParam(value="date") String uuid) {
		
		String enName = commonService.getBranchEnName(bcode);
		NonPayment params = new NonPayment();
		params.setbCode(Integer.parseInt(bcode));
		params.setUuid(uuid);
		
		//List<NonPayment> data = nonPayService.getNonPaymentExcelList(params);
		modelMap.put("nonpayList", nonPayService.getNonPaymentExcelList(params));
		
		response.setCharacterEncoding("UTF-8");
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Pragma","public");
        response.setHeader("Expires","0");
        response.setHeader("Content-Disposition","attachment; filename = " + enName + ".xlsx");
		
		return "nonPayExcelView";
	}
	
}
