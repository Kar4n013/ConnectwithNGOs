package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import Dao.RegistrationDao;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RegistrationDao registrationDao = new RegistrationDao();

		final String name = request.getParameter("name");
		final String phone = request.getParameter("phone");
		final String email = request.getParameter("email");
		final String state = request.getParameter("state");
		final String district = request.getParameter("district");
		final String password = request.getParameter("password");

		final String role = request.getParameter("role");
		System.out.println("Done");
		
		if (registrationDao.insert(name, phone, email, state, district, password, role)) {
//			RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
//			dispatcher.forward(request, response);
			System.out.println("got");
			response.sendRedirect("Login.jsp");
		}

	}
}
