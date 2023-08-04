package com.poly.servlet;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.UserDAO;
import com.poly.dao.VideoDAO;
import com.poly.model.User;
import com.poly.model.Video;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet({ "/admin/ad-home", "/admin/ad-user", "/admin/ad-video", "/admin/edit-user/*", "/admin/create-user",
		"/admin/update-user", "/admin/delete-user", "/admin/edit-video/*", "/admin/create-video", "/admin/update-video",
		"/admin/delete-video" })
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		if (uri.contains("admin/ad-home")) {
			this.doHome(request, response);
		} else if (uri.contains("ad-user")) {
			this.doUser(request, response);
		} else if (uri.contains("ad-video")) {
			this.doVideo(request, response);
		} else if (uri.contains("edit-user")) {
			this.doEditUser(request, response);
		} else if (uri.contains("update-user")) {
			this.doUpdateUser(request, response);
		} else if (uri.contains("delete-user")) {
			this.doDeleteUser(request, response);
		} else if (uri.contains("edit-video")) {
			this.doEditVideo(request, response);
		} else if (uri.contains("create-video")) {
			this.doCreateVideo(request, response);
		} else if (uri.contains("update-video")) {
			this.doUpdateVideo(request, response);
		} else if (uri.contains("delete-video")) {
			this.doDeleteVideo(request, response);
		} else
			request.getRequestDispatcher("/views/admin/ad-layout.jsp").forward(request, response);
	}

	private void doDeleteVideo(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	private void doUpdateVideo(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	private void doCreateVideo(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
//		File dir = new File(request.getServletContext().getRealPath("/src/main/webapp/views/assets/images"));
//		System.out.println(dir);
//
//		if (!dir.exists()) {
//			dir.mkdirs(); // Tạo đường dẫn
//		}
//
//		// lưu các file upload vào thư mục uploads
//		Part photo = request.getPart("poster"); // file hình
//		File photoFile = new File(dir, photo.getSubmittedFileName());
//		photo.write(photoFile.getAbsolutePath());

	}

	private void doEditVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		String videoid = uri.substring(uri.lastIndexOf("/") + 1);

		VideoDAO videoDAO = new VideoDAO();
		List<Video> videos = videoDAO.findAll();
		request.setAttribute("videos", videos);
		Video video = videoDAO.findById(videoid);
		request.setAttribute("video", video);

		request.setAttribute("view", "/views/admin/ad-video.jsp");
		request.getRequestDispatcher("/views/admin/ad-layout.jsp").forward(request, response);
	}

	private void doDeleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userId = request.getParameter("userId");
		UserDAO userDAO = new UserDAO();
		userDAO.remove(userId);
		response.sendRedirect("/luntpc04659_Assignment/admin/ad-user");
	}

	private void doUpdateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			UserDAO userDAO = new UserDAO();
			userDAO.update(user);
//			request.setAttribute("view", "/views/admin/ad-user.jsp");
//			request.getRequestDispatcher("/views/admin/ad-layout.jsp").forward(request, response);
			response.sendRedirect("/luntpc04659_Assignment/admin/ad-user");
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void doEditUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String userid = uri.substring(uri.lastIndexOf("/") + 1);

		UserDAO userDAO = new UserDAO();
		List<User> users = userDAO.findAll();
		request.setAttribute("users", users);
		User user = userDAO.findById(userid);
		request.setAttribute("user", user);

		request.setAttribute("view", "/views/admin/ad-user.jsp");
		request.getRequestDispatcher("/views/admin/ad-layout.jsp").forward(request, response);
	}

	private void doVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		VideoDAO videoDAO = new VideoDAO();
		List<Video> videos = videoDAO.findAll();
		request.setAttribute("videos", videos);

		request.setAttribute("view", "/views/admin/ad-video.jsp");
		request.getRequestDispatcher("/views/admin/ad-layout.jsp").forward(request, response);
	}

	private void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getMethod();

		UserDAO userDAO = new UserDAO();
		List<User> users = userDAO.findAll();
		request.setAttribute("users", users);

		request.setAttribute("view", "/views/admin/ad-user.jsp");
		request.getRequestDispatcher("/views/admin/ad-layout.jsp").forward(request, response);
	}

	private void doHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("view", "/views/admin/ad-index.jsp");
		request.getRequestDispatcher("/views/admin/ad-layout.jsp").forward(request, response);
	}

}
