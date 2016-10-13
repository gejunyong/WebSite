package com.website.lt.service;

import com.website.lt.model.User;

public interface ILoginService {
	public User loadUser(String userName);

	public void update(User u);
}
