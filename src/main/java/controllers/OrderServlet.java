package controllers;

import model.Order_pojo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    // Handle GET requests (just load orders for logged-in seller)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    // Handle POST requests (update order status)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("sellerId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String sellerId = (String) session.getAttribute("sellerId");

        // Check if this is a status update request
        String orderIdParam = request.getParameter("order_id");
        String statusParam = request.getParameter("status");

        if (orderIdParam != null && statusParam != null) {
            try {
                int orderId = Integer.parseInt(orderIdParam);
                boolean updated = Order_pojo.updateStatus(orderId, statusParam);
                if (updated) {
                    request.setAttribute("message", "Order status updated successfully!");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid Order ID!");
            }
        }

        // Load orders for this seller
        List<Order_pojo> orders = Order_pojo.getOrdersBySeller(sellerId);
        request.setAttribute("orders", orders);

        // Forward to JSP
        RequestDispatcher rd = request.getRequestDispatcher("Orders.jsp");
        rd.forward(request, response);
    }
}

