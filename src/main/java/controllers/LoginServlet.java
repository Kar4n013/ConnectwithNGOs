package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import Dao.LoginDao;

@SuppressWarnings("serial")
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user = request.getParameter("admin");
		String dept = "admin_box";
		if (user == null) {
			user = request.getParameter("donor");
			dept = "donor_box";
		}

		String password = request.getParameter("pass");

		if (user != null && password != null && !user.trim().isEmpty() && !password.trim().isEmpty()) {
			if (LoginDao.login(user, password, dept)) {
				HttpSession session = request.getSession();
				session.setAttribute("userId", user);
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
