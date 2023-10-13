package com.cms.dto.master;

import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 
 * @ClassName Admin
 * @description 관리자 계정
 * @author JB
 * @since 2020. 9. 18.
 */
public class Admin implements UserDetails {
	
	private static final long serialVersionUID = -7183338421381317065L;
	
	private int idx;
	private String id;
	private String password;
	private String name;
	private String dept;
	private String email;
	private String auth;
	private String use_yn;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date lastLoginDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date passwordChangeDate;
	private int loginFailCnt;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	
	private String regId;
	private String modId;
	
	private int bCode;
	private String bName;
	private String role;				// 배열형태로 split 해서 사용.
	private List<Menu> menuList;		// 메뉴 리스트
	private List<Menu> topMenuList;	// 1Depth 메뉴 리스트
	private List<Integer> authList;	// 메뉴 권한ID
	
	private String password_origin;
	private String password_confirm;
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public Date getPasswordChangeDate() {
		return passwordChangeDate;
	}

	public void setPasswordChangeDate(Date passwordChangeDate) {
		this.passwordChangeDate = passwordChangeDate;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getLoginFailCnt() {
		return loginFailCnt;
	}

	public void setLoginFailCnt(int loginFailCnt) {
		this.loginFailCnt = loginFailCnt;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getModId() {
		return modId;
	}

	public void setModId(String modId) {
		this.modId = modId;
	}

	public int getbCode() {
		return bCode;
	}

	public void setbCode(int bCode) {
		this.bCode = bCode;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public List<Menu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}

	public List<Menu> getTopMenuList() {
		return topMenuList;
	}

	public void setTopMenuList(List<Menu> topMenuList) {
		this.topMenuList = topMenuList;
	}
	
	public List<Integer> getAuthList() {
		return authList;
	}

	public void setAuthList(List<Integer> authList) {
		this.authList = authList;
	}
	
	public String getPassword_origin() {
		return password_origin;
	}

	public void setPassword_origin(String password_origin) {
		this.password_origin = password_origin;
	}

	public String getPassword_confirm() {
		return password_confirm;
	}

	public void setPassword_confirm(String password_confirm) {
		this.password_confirm = password_confirm;
	}

	@Override
	public List<GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getPassword() {
		return this.password;
	}

	@Override
	public String getUsername() {
		return this.id;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

}
