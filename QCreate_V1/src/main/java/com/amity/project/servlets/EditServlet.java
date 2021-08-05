package com.amity.project.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amity.project.dao.UserDao;
import com.amity.project.entities.Message;
import com.amity.project.entities.User;
import com.amity.project.helper.ConnectionProvider;
import com.amity.project.helper.Helper;

import java.io.File;
import java.io.PrintWriter;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet EditServlet</title>");
			out.println("</head>");
			out.println("<body>");

			// fetch all data
			String userEmail = request.getParameter("user_email");
			String userName = request.getParameter("user_name");
			String userPassword = request.getParameter("user_password");
			String userContact = request.getParameter("user_contact");
			Part part = request.getPart("image");
			String imageName = part.getSubmittedFileName();
			// get the user from the session
			HttpSession s = request.getSession();
			User user = (User) s.getAttribute("currentUser");
			user.setEmail(userEmail);
			user.setName(userName);
			user.setPassword(userPassword);
			user.setContact(userContact);
			String oldFile = user.getProfile();
			user.setProfile(imageName);

			// update database

			UserDao userdao = new UserDao(ConnectionProvider.getConnection());
			boolean ans = userdao.updateUser(user);
			if (ans) {

				@SuppressWarnings("deprecation")
				String path = request.getRealPath("/pics") + File.separator + user.getProfile();

				// delete code
				@SuppressWarnings("deprecation")
				String pathOldFile = request.getRealPath("/pics") + File.separator + oldFile;
				Helper.deleteFile(pathOldFile);
				if (Helper.saveFile(part.getInputStream(), path)) {
					out.println("Profile Updated");
					Message msg = new Message("Profile details updated", "success", "alert-success");

					s.setAttribute("msg", msg);

				} else {
					out.println("Profile not updated");
					Message msg = new Message("Something went wrong", "error", "alert-danger");

					s.setAttribute("msg", msg);

				}

			} else {
				out.println("Profile not updated");
				Message msg = new Message("Something went wrong", "error", "alert-danger");

				s.setAttribute("msg", msg);

			}
			response.sendRedirect("profile.jsp");

			out.println("</body>");
			out.println("</html>");
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
	// + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
