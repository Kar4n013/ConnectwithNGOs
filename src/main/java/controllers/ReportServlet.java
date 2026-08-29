package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import model.Report_pojo;

import java.io.IOException;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Report_pojo> reports = Report_pojo.getAllReports();
        request.setAttribute("reports", reports);
        request.getRequestDispatcher("Report_product.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String reportedIdParam = request.getParameter("reported_id");
        String statusParam = request.getParameter("status");

        if (reportedIdParam != null && statusParam != null) {
            try {
                int reportedId = Integer.parseInt(reportedIdParam);
                boolean updated = Report_pojo.updateStatus(reportedId, statusParam);
                if (updated) {
                    request.setAttribute("message", "Status updated successfully!");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid Report ID!");
            }
        }

       
        List<Report_pojo> reports = Report_pojo.getAllReports();
        request.setAttribute("reports", reports);
        request.getRequestDispatcher("Report_product.jsp").forward(request, response);
    }
}
