package com.website.lt.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import com.website.lt.model.User;


public class LoginFilter implements Filter {
	@Override
	public void destroy() {

	}
	private Logger log=Logger.getLogger(this.getClass());
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hsq = (HttpServletRequest)req;
		if(!hsq.getRequestURL().toString().endsWith("/login")&&!hsq.getRequestURL().toString().contains("/resources/")){
			User u = (User)hsq.getSession().getAttribute("loginUser");
			if(hsq.getRequestURL().toString().contains("/admin")&&u==null){
				//System.out.println("无相应权限，跳转至首页！");
				((HttpServletResponse)resp).sendRedirect(hsq.getContextPath()+"/login");
				//((HttpServletResponse)resp).sendRedirect(hsq.getContextPath()+"/index");
				return;
			}
		}
		chain.doFilter(req, resp);
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
