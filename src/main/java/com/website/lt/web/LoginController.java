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
	public String login(String userName,String password,String code,Model model,HttpSession session){
		//System.out.println("pwd:"+WebTools.encryptBasedDes(password));
		if(!code.toUpperCase().equals(session.getAttribute("code"))){
			model.addAttribute("error","rand code is error!");
			return "login/login";
		}
		
		//account not exsit
		User u=loginService.loadUser(userName);
		if(u==null){
			model.addAttribute("error","username or password is error!");
			return "login/login";
		}
		
		//password is error
		if(!u.getPassword().equals(WebTools.encryptBasedDes(password))){
			model.addAttribute("userName",userName);
			model.addAttribute("error","username or password is error!");
			return "login/login";
		}
		//System.out.println("account:"+u.getAccount()+",p:"+WebTools.encryptBasedDes(password));
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
	
	
	@RequestMapping(value="/admin/account/changepwd")
	public String changepwd(){
		return "admin/account/changepwd";
	}
	
	@RequestMapping(value="/admin/account/changepwd",method=RequestMethod.POST)
	public String changePwd(String pwd_old,String pwd_new,String pwd_new1,Model model,HttpSession session) {
		User u=(User) session.getAttribute("loginUser");
		if(pwd_new==null||pwd_new.equals("")||pwd_new.length()<5){
			model.addAttribute("error","new password Length don't more than 5 !");
			return "admin/account/changepwd";
		}
		
		if(!pwd_new1.equals(pwd_new)){
			model.addAttribute("error","The two passwords don't match !");
			return "admin/account/changepwd";
		}
		
		if(!u.getPassword().equals(WebTools.encryptBasedDes(pwd_old))){
		model.addAttribute("error","The Old password don't match !");
		return "admin/account/changepwd";
		}
		
		u.setPassword(WebTools.encryptBasedDes(pwd_new));
		loginService.update(u);
		
		model.asMap().remove("loginUser");
		session.invalidate();
		return "redirect:/login";
	}
	
}
