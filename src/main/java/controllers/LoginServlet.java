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

		System.out.println("Servlet activated");
		String user = request.getParameter("admin");

		if (user == null) {
			user = request.getParameter("donor");
		}

		String password = request.getParameter("pass");
		
		System.out.println(user +" + "+ password);
		if (user != null && password != null && !user.trim().isEmpty() && !password.trim().isEmpty()) {
			System.out.println("Proceeding");
			if (LoginDao.login(user, password)) {
				System.out.println("Succesful");
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
