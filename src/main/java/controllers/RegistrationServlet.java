package controllers;

import model.Registration_pojo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String portId = request.getParameter("port_id");
        String password = request.getParameter("password");
        String location = request.getParameter("location");
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        Registration_pojo user = new Registration_pojo();
        user.setPortId(portId);
        user.setPassword(password);
        user.setLocation(location);
        user.setName(name);
        user.setEmail(email);

        if (user.registerUser()) {
           
            response.sendRedirect("Login.jsp");
        } else {
           
            request.setAttribute("errorMessage", "Port ID or Email already exists!");
            request.getRequestDispatcher("Registration.jsp").forward(request, response);
        }
    }
}
