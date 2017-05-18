package com.zh.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.bean.SessionUser;

public class AdminFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		SessionUser suser = (SessionUser)((HttpServletRequest)request).getSession().getAttribute("_user");
		String basePath = request.getScheme()
				+ "://"
				+ request.getServerName()
				+ ":"
				+ request.getServerPort()
				+ ((HttpServletRequest)request).getContextPath()
				+ "/";
		if(suser == null){
			((HttpServletResponse)response).sendRedirect(basePath + "login.jsp");
		}else{
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
