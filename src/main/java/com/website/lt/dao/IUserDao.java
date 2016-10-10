package com.website.lt.dao;

import com.website.lt.model.User;

public interface IUserDao extends IBaseDao<User>{
	public User loadUser(String userName);
}
