package controllers;

import model.Product_pojo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/ShowServlet")
public class ShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        String sellerId = null;
        if (session != null) {
            sellerId = (String) session.getAttribute("sellerId");
        }

        if (sellerId == null) {
            // session expired or not logged in
            resp.sendRedirect("Login.jsp");
            return;
        }

        try {
            Product_pojo pojo = new Product_pojo();

            List<Product_pojo> product = pojo.show(sellerId);

            req.setAttribute("product", product);
            req.getRequestDispatcher("Show_product.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error fetching products: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp); 
    }
}
