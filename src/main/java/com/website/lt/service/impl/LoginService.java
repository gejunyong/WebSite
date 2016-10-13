package com.website.lt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.lt.dao.IUserDao;
import com.website.lt.model.User;
import com.website.lt.service.ILoginService;

@Service("loginService")
public class LoginService implements ILoginService{
	@Autowired
	private IUserDao userDao;
	
	public User loadUser(String userName){
		return userDao.loadUser(userName);
	}

	@Override
	public void update(User u) {
		userDao.update(u);
	}
	
}
