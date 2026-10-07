package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Item_pojo;

import java.io.IOException;

/**
 * Servlet implementation class RegisterItemServlet
 */
@WebServlet("/RegisterItemServlet")
public class RegisterItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Item_pojo item_pojo = new Item_pojo();
		item_pojo.setItem_name(request.getParameter("name"));
		item_pojo.setItem_category(request.getParameter("category"));
		item_pojo.setItem_url(request.getParameter("url"));
		item_pojo.setItem_description(request.getParameter("description"));
		
		doGet(request, response);
	}

}
