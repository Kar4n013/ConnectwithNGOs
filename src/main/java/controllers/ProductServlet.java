package controllers;

import model.Product_pojo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Product_pojo pojo = new Product_pojo();
		ServletContext context = getServletContext();
		HttpSession session = req.getSession(false);
		String sellerId = (String) session.getAttribute("sellerId"); 

		String insert = req.getParameter("insert");
		String update = req.getParameter("update");
		String delete = req.getParameter("delete");
		String show = req.getParameter("show");
		String preupdate = req.getParameter("preupdate");
		
		String flag = insert + update + delete + show + preupdate ;
		
		if (flag.equals("insertnullnullnullnull")) {
			pojo.setSeller_port_id(sellerId);
			pojo.setProduct_name(req.getParameter("productName"));
			pojo.setDescription(req.getParameter("description"));
			pojo.setQuantity(Integer.parseInt(req.getParameter("quantity")));
			pojo.setPrice(Integer.parseInt(req.getParameter("price")));
			try {
				pojo.insert();
				List<Product_pojo> product = pojo.show(sellerId);
				req.setAttribute("product", product);
				req.getRequestDispatcher("Show_product.jsp").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
				req.getRequestDispatcher("Login.jsp").forward(req, resp);
			}
		} 
		else if (flag.equals("nullnullnullnullpreupdate")) {
			pojo.setSeller_port_id(sellerId);
			int product_id = Integer.parseInt(req.getParameter("product_id"));
			pojo.setProduct_id(product_id);
			try {
				if (pojo.verify()) {
					req.setAttribute("product", pojo);
					pojo.preupdate();
					RequestDispatcher dispatcher = context.getRequestDispatcher("/Update_product.jsp");
					dispatcher.forward(req, resp);
				} else {
					req.setAttribute("errorMsg",
							"We couldn’t verify this product. The Product ID is incorrect or it doesn’t belong to your account.");
					RequestDispatcher dispatcher = context.getRequestDispatcher("/Update_product.jsp");
					dispatcher.forward(req, resp);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (flag.equals("nullupdatenullnullnull")) {
			pojo.setSeller_port_id(sellerId);
			pojo.setProduct_id(Integer.parseInt(req.getParameter("product_id")));
			pojo.setProduct_name(req.getParameter("productName"));
			pojo.setDescription(req.getParameter("description"));
			pojo.setQuantity(Integer.parseInt(req.getParameter("quantity")));
			pojo.setPrice(Integer.parseInt(req.getParameter("price")));
			try {
				if (pojo.verify()) {
					pojo.update();
					List<Product_pojo> product = pojo.show(sellerId);
					req.setAttribute("product", product);
					req.getRequestDispatcher("Show_product.jsp").forward(req, resp);
				} else {
					req.setAttribute("errorMsg",
							"We couldn’t verify this product. The Product ID is incorrect or it doesn’t belong to your account.");
					RequestDispatcher dispatcher = context.getRequestDispatcher("/Update_product.jsp");
					dispatcher.forward(req, resp);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		else if (flag.equals("nullnulldeletenullnull")) {
			pojo.setSeller_port_id(sellerId);
			pojo.setProduct_id(Integer.parseInt(req.getParameter("product_id")));
			try {
				if (pojo.verify()) {
					pojo.delete();
					List<Product_pojo> product = pojo.show(sellerId);
					req.setAttribute("product", product);
					req.getRequestDispatcher("Show_product.jsp").forward(req, resp);
				} else {
					req.setAttribute("errorMsg",
							"We couldn’t verify this product. The Product ID is incorrect, or it doesn’t belong to your account.");
					RequestDispatcher dispatcher = context.getRequestDispatcher("/Delete_product.jsp");
					dispatcher.forward(req, resp);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		else if (flag.equals("nullnullnullshownull")) {
		    req.getRequestDispatcher("ShowServlet").forward(req, resp);
		}
	}
}
