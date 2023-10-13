package com.cms.service.common;

import java.util.Map;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.common.LoginDao;
import com.cms.dto.common.ResponseCode;
import com.cms.dto.master.Admin;

@Service
public class LoginService {

	@Autowired private LoginDao loginDao;
	@Autowired private MailSenderService mailSenderService;
	
	public Admin getLoginUserInfo(Admin admin) {
		return loginDao.getLoginUserInfo(admin);
	}
	
	/**
	 * 
	 * @name modifyFindPwd
	 * @description 임시 비밀번호 메일 발송 
	 * 				  임시 비밀번호 변경
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 11. 3.
	 */
	public ResponseCode modifyFindPwd(Map<String, String> param) {
		// 사번 유무확인
		ResponseCode result = new ResponseCode();
		Admin user = loginDao.getUserInfo(param);
		
		if(user != null) {
			String randomString = RandomStringUtils.randomAlphanumeric(8);
			
			param.put("password", randomString);
			
			String contents = "<h3><b>홈페이지 관리자 아이디와 임시 비밀번호입니다.</b></h3><br/>";
			contents += "* 아이디 : "+ param.get("id") + "<br/>";
			contents += "* 임시 비밀번호 : "+ param.get("password");
			
			System.out.println(contents);
			
			// 임시 메일발송 및 패스워드 변경
			loginDao.modifyPassword(param);
			mailSenderService.sendMail("[홈페이지] 관리자 임시 비밀번호 발급", contents, "", new String[] {user.getEmail()});
			
			result.setResult(true);
			result.setMessage("임시 비밀번호가 메일로 발송되었습니다.");
			
		} else {
			result.setResult(false);
			result.setMessage("존재하지 않는 ID 입니다.");
		}

		return result;
	}
	
	
	public ResponseCode modifyChangePwd(Admin param) {
		ResponseCode res = new ResponseCode();
		int checkCnt = loginDao.getPasswordCheck(param);
		
		if(checkCnt > 0) {
			// 서버단에서 다시 체크
			if( param.getPassword().equals(param.getPassword_confirm()) ) {
				// 패스워드 변경
				loginDao.modifyPassword2(param);
				
				res.setResult(true);
				res.setMessage("");
				return res;
			}
			else {
				// 해킹 변조 방지 
				res.setResult(false);
				res.setMessage("비밀번호가 일치하지 않습니다.");
				
				return res;
			}
		}
		else {
			res.setResult(false);
			res.setMessage("계정에 문제가 있습니다. 관리자에게 확인바랍니다.");
			
			return res;
		}
		
	}
	
	public void modifyLastLoginDate(String id) {
		loginDao.modifyLastLoginDate(id);
	}
	
}
