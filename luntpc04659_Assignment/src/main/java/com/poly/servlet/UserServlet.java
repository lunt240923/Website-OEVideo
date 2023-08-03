package com.poly.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.UserDAO;
import com.poly.utils.CookieUtils;
import com.poly.model.User;

@WebServlet({ "/user/home", "/user/favorite-video", "/user/change-password", "/user/forgot-password",
		"/user/description-video", "/user/edit-profile", "/user/login", "/user/register",
		"/logout" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		if (uri.contains("user/home")) {
			this.doHome(request, response);
		} else if (uri.contains("login")) {
			this.doLogin(request, response);
		} else if (uri.contains("logout")) {
			this.doLogout(request, response);
		} else if (uri.contains("register")) {
			this.doRegister(request, response);
		} else if (uri.contains("change-password")) {
			this.doChangePassword(request, response);
		} else if (uri.contains("forgot-password")) {
			this.doForgotPassword(request, response);
		} else if (uri.contains("edit-profile")) {
			this.doEditProfile(request, response);
		} else if (uri.contains("description-video")) {
			this.doDescriptionVideo(request, response);
		} else if (uri.contains("favorite-video")) {
			this.doFavoriteVideo(request, response);
		}

		request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
	}

	private void doLogout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("user", "");
		request.getSession().setAttribute("role", "");
		request.setAttribute("view", "/views/user/index.jsp");
	}

	private void doFavoriteVideo(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		request.setAttribute("view", "/views/user/favorite-video.jsp");
	}

	private void doDescriptionVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("view", "/views/user/description-video.jsp");
	}

	private void doEditProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		User user = (User) request.getSession().getAttribute("user");
		String method = request.getMethod();
		if(method.equalsIgnoreCase("POST")) {
			User user = new User();
			try {
				BeanUtils.populate(user, request.getParameterMap());
				UserDAO userDAO = new UserDAO();
				userDAO.update(user);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		request.setAttribute("view", "/views/user/edit-profile.jsp");
	}

	private void doForgotPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("view", "/views/user/forgot-password.jsp");
	}

	private void doRegister(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		UserDAO userDAO = new UserDAO();
		if (method.equalsIgnoreCase("GET")) {
//			
			request.setAttribute("view", "/views/user/register.jsp");
		}
		if (method.equalsIgnoreCase("POST")) {
			String passcon = request.getParameter("passwordConfirm");
			try {
				User user = new User();
				BeanUtils.populate(user, request.getParameterMap());
				if (user.getPassword().equals(passcon)) {
					userDAO.create(user);
					request.getSession().setAttribute("user", user);
					request.getSession().setAttribute("role", user.getAdmin());
					request.setAttribute("view", "/views/user/index.jsp");
				} else {
					request.setAttribute("error", "Xác nhận mật khẩu không đúng!");
					request.setAttribute("view", "/views/user/register.jsp");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void doLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getMethod();
		UserDAO userDAO = new UserDAO();

		if (method.equalsIgnoreCase("GET")) {
//			String un = CookieUtils.get("UserId", request);

//			if(!username.equals("")) {
//				User user = userDAO.findById(username);
//				request.setAttribute("UserId", username);
//				request.setAttribute("Password", user.getPassword());
//			}
//			request.setAttribute("UserId", un);
			request.setAttribute("view", "/views/user/login.jsp");
		}
		if (method.equalsIgnoreCase("POST")) {
			String username = request.getParameter("userId");
			String password = request.getParameter("password");
			String remember = request.getParameter("remember");

			try {

				User user = userDAO.findById(username);
				if (user == null) {
					request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
					request.setAttribute("view", "/views/user/login.jsp");
				} else if (!user.getPassword().equals(password)) {
					request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
					request.setAttribute("view", "/views/user/login.jsp");
				} else {

					
					int hours = (remember == null) ? 0 : 24; // 0 = xóa
					CookieUtils.add("UserId", username, hours, response);
					CookieUtils.add("role", String.valueOf(user.getAdmin()), hours, response);
					System.out.println(user.getAdmin());
					request.getSession().setAttribute("user", user);
					
					
					if (user.getAdmin() == true) {
						request.getSession().setAttribute("role", "admin");
						request.setAttribute("view", "/views/user/index.jsp");
					} else {
						request.setAttribute("view", "/views/user/index.jsp");
					}
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	private void doChangePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("view", "/views/user/change-password.jsp");
	}

	private void doHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("view", "/views/user/index.jsp");

	}
}
