package controllers;

import model.Profile_pojo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("sellerId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String portId = (String) session.getAttribute("sellerId");
        Profile_pojo profile = Profile_pojo.getProfile(portId);
        request.setAttribute("profile", profile);
        request.getRequestDispatcher("Profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("sellerId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String portId = (String) session.getAttribute("sellerId");
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            boolean deleted = Profile_pojo.deleteProfile(portId);
            if (deleted) {
                session.invalidate();
                response.sendRedirect("Login.jsp");
                return;
            } else {
                request.setAttribute("message", "Failed to delete profile.");
            }
        } 
        else if ("updatePassword".equals(action)) {
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");

            // Verify current password first
            boolean isValid = Profile_pojo.verifyPassword(portId, currentPassword);

            if (isValid) {
                boolean updated = Profile_pojo.updatePassword(portId, newPassword);
                if (updated) {
                    request.setAttribute("message", "Password updated successfully!");
                } else {
                    request.setAttribute("message", "Failed to update password.");
                }
            } else {
                request.setAttribute("message", "Current password is incorrect.");
            }
        } 
        else if ("update".equals(action)) {
            String name = request.getParameter("name");
            String location = request.getParameter("location");
            String email = request.getParameter("email");

            boolean updated = Profile_pojo.updateProfile(portId, name, location, email);
            if (updated) {
                request.setAttribute("message", "Profile updated successfully!");
            } else {
                request.setAttribute("message", "Failed to update profile.");
            }
        }

        // Refresh profile and forward
        Profile_pojo profile = Profile_pojo.getProfile(portId);
        request.setAttribute("profile", profile);
        request.getRequestDispatcher("Profile.jsp").forward(request, response);
    }
}
