package com.website.lt.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	//main page of admin
	@RequestMapping(value={"/admin/","/admin/main"})
	public String main(){
		return "admin/main";
	}
}
