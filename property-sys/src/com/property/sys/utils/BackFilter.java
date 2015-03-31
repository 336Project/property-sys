package com.property.sys.utils;


import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.property.sys.model.Role;
import com.property.sys.model.User;
import com.sechand.platform.base.BaseUtil;
import com.sechand.platform.base.auth.AuthorityFilter;

public class BackFilter extends AuthorityFilter{

	@Override
	public void customDoFilter(ServletRequest arg0, ServletResponse arg1)
			throws IOException {
		HttpServletRequest request= (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		String basePath=request.getContextPath();
		//获取请求的路径
		String requestURI=request.getRequestURI();
		String uri=requestURI.replace(basePath, "");
		if("/admin/admin_index.jsp".equals(uri)){
			User user=(User) request.getSession().getAttribute(BaseUtil.KEY_LOGIN_USER_SESSION);
			if(user==null||!user.getRoleCode().equals(Role.CODE_ADMIN)){//
				System.out.println("调用jsp时,Session 用户不是管理员");
				response.sendRedirect(basePath+"/error.jsp");
			}
		}
	}

	

}
