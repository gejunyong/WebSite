package com.website.lt.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.website.lt.model.User;
import com.website.lt.service.ILoginService;
import com.website.lt.util.WebTools;

@Controller
@SessionAttributes("loginUser")
public class LoginController {
	@Autowired
	private ILoginService loginService;
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String login(){
		return "login/login";
	}
	
	//login
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(String userName,String password,Model model){
		//System.out.println("pwd:"+WebTools.encryptBasedDes(password));
		
		//account not exsit
		User u=loginService.loadUser(userName);
		if(u==null){
			model.addAttribute("error","username or password is error!");
			return "login/login";
		}
		
		//password is error
		if(!u.getPassword().equals(WebTools.encryptBasedDes(password))){
			model.addAttribute("userName",userName);
			model.addAttribute("error","username or password is error!!");
			return "login/login";
		}
		
		//success
		model.addAttribute("loginUser",u);
		return "redirect:/admin/main";
	}
	
	//logout
	@RequestMapping("/logout")
	public String logout(Model model,HttpSession session) {
		model.asMap().remove("loginUser");
		session.invalidate();
		return "redirect:/login";
	}
}
