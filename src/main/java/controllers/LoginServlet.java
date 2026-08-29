package controllers;

import model.User_pojo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String sellerIdParam = request.getParameter("seller_id");
        String password = request.getParameter("password");

        if (sellerIdParam != null && password != null &&
            !sellerIdParam.trim().isEmpty() && !password.trim().isEmpty()) {

            boolean validUser = User_pojo.login(sellerIdParam, password);

            if (validUser) {
                HttpSession session = request.getSession();
                session.setAttribute("sellerId", sellerIdParam);
                response.sendRedirect("DashboardServlet");
            } else {
                request.setAttribute("errorMessage", "Invalid Port ID or Password!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("errorMessage", "Please enter both Port ID and Password!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
}
