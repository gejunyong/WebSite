package com.website.lt.dao.impl;

import org.springframework.stereotype.Repository;

import com.website.lt.dao.IUserDao;
import com.website.lt.model.User;

@Repository("userDao")
public class UserDao extends BaseDao<User> implements IUserDao {
	
	@Override
	public User loadUser(String userName) {
		//获取用户信息
		return (User)this.queryByHql(" from User where account=? ",userName);
	}

}
