package com.poly.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class I18nFilter implements Filter{

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
    	HttpServletRequest httpServletRequest = (HttpServletRequest) req;
    	HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
		String lang = req.getParameter("lang");
		if(lang != null) {
			httpServletRequest.getSession().setAttribute("lang", lang);
		}
		chain.doFilter(req, resp);
		
	}

}
