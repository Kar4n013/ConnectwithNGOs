package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User_pojo;

import java.io.IOException;

import Dao.LoginDao;

@SuppressWarnings("serial")
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userid = request.getParameter("admin");
		String dept = "admin";
		if (userid == null) {
			userid = request.getParameter("donor");
			dept = "donor";
		}

		String password = request.getParameter("pass");

		if (userid != null && password != null && !userid.trim().isEmpty() && !password.trim().isEmpty()) {
			User_pojo user = LoginDao.login(userid, password, dept);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				response.sendRedirect("DashboardServlet");
			} else {
				System.out.println("Unsuccesful");
				request.setAttribute("errorMessage", "Invalid Port ID or Password!");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}

		} else {
			System.out.println("Error");
			request.setAttribute("errorMessage", "Please enter both Port ID and Password!");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	}

}
