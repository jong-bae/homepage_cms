package com.cms.service.user;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.user.UserDao;
import com.cms.dto.user.User;

/**
 * 
 * @ClassName UserService
 * @description
 * @author JB
 * @since 2021. 9. 16.
 */
@Service
public class UserService {

	@Autowired private UserDao userDao;
	
	public List<User> getUserList() {
		return userDao.getUserList();
	}
}
