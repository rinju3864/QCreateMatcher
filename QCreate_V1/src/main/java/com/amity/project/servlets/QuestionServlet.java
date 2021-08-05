package com.amity.project.servlets;

import com.amity.project.api.mainapi;
import com.amity.project.dao.QuesDao;
import com.amity.project.entities.Question;
import com.amity.project.helper.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;

/**
 * Servlet implementation class QuestionServlet
 */
@SuppressWarnings("unused")
@WebServlet("/QuestionServlet")
@MultipartConfig
public class QuestionServlet extends HttpServlet {
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
			out.println("<title>Servlet QuestionServlet</title>");
			out.println("</head>");
			out.println("<body>");

			// fetch the question form data

			String quesno = request.getParameter("qno");
			String sub = request.getParameter("subject");
			String top = request.getParameter("topic");
			String subtop = request.getParameter("subtopic");
			String obj = request.getParameter("objective");
			String lev = request.getParameter("level");
			String ques = request.getParameter("ques");
			String option1 = request.getParameter("opt1");
			String option2 = request.getParameter("opt2");
			String option3 = request.getParameter("opt3");
			String option4 = request.getParameter("opt4");

			Question question = new Question(quesno, sub, top, subtop, obj, lev, ques, option1, option2, option3,
					option4);

			// mainapi api = new mainapi();
			// if(api.POSTRequest()){
			// out.println("done");
			// }
			// out.println("done");
			QuesDao dao = new QuesDao(ConnectionProvider.getConnection());
			if (dao.saveQues(question)) {
				out.println("done");
			} else {
				out.println("error");
			}
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
