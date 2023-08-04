package com.poly.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.FavoriteDAO;
import com.poly.dao.UserDAO;
import com.poly.dao.VideoDAO;
import com.poly.utils.CookieUtils;
import com.poly.utils.JpaUtils;
import com.poly.model.Favorite;
import com.poly.model.User;
import com.poly.model.Video;

@WebServlet({ "/user/home", "/user/favorite-video", "/user/change-password", "/user/forgot-password",
		"/user/description-video/*", "/user/edit-profile", "/user/login", "/user/register", "/logout",
		"/user/view-all","/user/like-video/*"})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EntityManager em = JpaUtils.getEntityManager();
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
		}else if (uri.contains("view-all")) {
			this.doViewAll(request, response);
		}else if (uri.contains("like-video")) {
			this.doLikeVideo(request, response);
		} else
			request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
	}

	private void doLikeVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String id = uri.substring(uri.lastIndexOf("/") + 1);
		User user = (User) request.getSession().getAttribute("user");
		FavoriteDAO favoriteDAO = new FavoriteDAO();
		Favorite favorite = new Favorite();
		favorite.setUser(user);
		VideoDAO videoDAO = new VideoDAO();
		Video video = videoDAO.findById(id);
		favorite.setVideo(video);
		favoriteDAO.create(favorite);
//		request.setAttribute("view", "/views/user/index.jsp");
		response.sendRedirect("/luntpc04659_Assignment/user/favorite-video");
	}

	private void doViewAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Video> video = new ArrayList<Video>();
		VideoDAO videoDAO = new VideoDAO();
		video = videoDAO.findAll();
		request.setAttribute("allvideo", video);
		request.setAttribute("view", "/views/user/videos.jsp");
		request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
		
	}

	private void doLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().setAttribute("user", "");
		request.getSession().setAttribute("role", "");
		request.setAttribute("view", "/views/user/index.jsp");

		response.sendRedirect("/luntpc04659_Assignment/user/home");
	}

	private void doFavoriteVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = (User) request.getSession().getAttribute("user");
		TypedQuery<Video> query = em.createNamedQuery("Video.findByUserId", Video.class);
		query.setParameter("keyword", user.getUserId());
		List<Video> list = query.getResultList();
		for(Video x : list) {
			System.out.println(x.getTitle());
		}
		request.setAttribute("favorites", list);
		request.setAttribute("view", "/views/user/favorite-video.jsp");
		request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
	}

	private void doDescriptionVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		String id = uri.substring(uri.lastIndexOf("/") + 1);
		VideoDAO videoDAO = new VideoDAO();
		Video video = videoDAO.findById(id);
		request.setAttribute("video", video);

		List<Video> videos = videoDAO.findAll();
		request.setAttribute("videos", videos);
		request.setAttribute("view", "/views/user/description-video.jsp");
		request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
	}

	private void doEditProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		User user = (User) request.getSession().getAttribute("user");
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			User user = new User();
			try {
				BeanUtils.populate(user, request.getParameterMap());
				User userSession = (User) request.getSession().getAttribute("user");
				user.setAdmin(userSession.getAdmin());
				UserDAO userDAO = new UserDAO();
				userDAO.update(user);
				request.getSession().setAttribute("user", user);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		request.setAttribute("view", "/views/user/edit-profile.jsp");
		request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
	}

	private void doForgotPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("view", "/views/user/forgot-password.jsp");
		request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
	}

	private void doRegister(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		UserDAO userDAO = new UserDAO();
		if (method.equalsIgnoreCase("GET")) {
//			
			request.setAttribute("view", "/views/user/register.jsp");
			request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
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
					response.sendRedirect("/luntpc04659_Assignment/user/home");
				} else {
					request.setAttribute("error", "Xác nhận mật khẩu không đúng!");
					request.setAttribute("view", "/views/user/register.jsp");
					request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
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
			request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
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
					request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
				} else if (!user.getPassword().equals(password)) {
					request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
					request.setAttribute("view", "/views/user/login.jsp");
					request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
				} else {
					int hours = (remember == null) ? 0 : 24; // 0 = xóa
					CookieUtils.add("UserId", username, hours, response);
					CookieUtils.add("role", String.valueOf(user.getAdmin()), hours, response);
					System.out.println(user.getAdmin());
					request.getSession().setAttribute("user", user);

					if (user.getAdmin()) {
						System.out.println("admin");
						request.getSession().setAttribute("role", "admin");
					}
					response.sendRedirect("/luntpc04659_Assignment/user/home");

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	private void doChangePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getMethod();
		UserDAO userDAO = new UserDAO();
		if (method.equalsIgnoreCase("GET")) {
			request.setAttribute("view", "/views/user/change-password.jsp");
			request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
		}
		if (method.equalsIgnoreCase("POST")) {
			String username = request.getParameter("userId");
			String password = request.getParameter("password");
			String newPass = request.getParameter("newPassword");
			String passCon = request.getParameter("passwordConfirm");

			try {

				User user = userDAO.findById(username);
				if (!user.getPassword().equals(password)) {
					request.setAttribute("error", "Mật khẩu cũ không đúng!");
					request.setAttribute("view", "/views/user/change-password.jsp");
//					request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
				} else if (!newPass.equals(passCon)) {
					request.setAttribute("error", "Xác nhận mật khẩu không đúng!");
					request.setAttribute("view", "/views/user/change-password.jsp");
//					request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
				} else {

					user.setPassword(newPass);
					userDAO.update(user);
					request.getSession().setAttribute("user", user);
					request.setAttribute("view", "/views/user/index.jsp");
					response.sendRedirect("/luntpc04659_Assignment/user/home");

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	private void doHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Video> video = new ArrayList<Video>();
		VideoDAO videoDAO = new VideoDAO();
		video = videoDAO.findAll();
		request.setAttribute("videos", video);
		request.setAttribute("view", "/views/user/index.jsp");
		request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
	}
}
