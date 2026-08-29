package controllers;

import model.Dashboard_pojo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       
        HttpSession session = request.getSession();
        String portId = (String) session.getAttribute("sellerId");

        if (portId == null) {
            response.sendRedirect("Login.jsp"); 
            return;
        }

        Dashboard_pojo dashboard = new Dashboard_pojo();
        dashboard.loadCounts(portId);

        
        request.setAttribute("productsCount", dashboard.getProductsCount());
        request.setAttribute("ordersCount", dashboard.getOrdersCount());
        request.setAttribute("reportedProductsCount", dashboard.getReportedProductsCount());

     
        request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
    }
}

