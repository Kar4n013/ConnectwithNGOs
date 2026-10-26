package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Item_pojo;
import model.User_pojo;

import java.io.IOException;

import Dao.ItemDao;

/**
 * Servlet implementation class RegisterItemServlet
 */
@WebServlet("/RegisterItemServlet")
@MultipartConfig
public class RegisterItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		User_pojo user_pojo = (User_pojo) session.getAttribute("user");
		
		System.out.println(user_pojo);
		
		Item_pojo item_pojo = new Item_pojo();
		item_pojo.setItem_title(request.getParameter("title"));
		item_pojo.setItem_category(request.getParameter("Category"));
		item_pojo.setItem_description(request.getParameter("description"));
		Part img = request.getPart("image");
		item_pojo.setItem_name(java.util.UUID.randomUUID()+".jpg");
		
		String path = "C:\\Users\\Karan Giri\\eclipse-workspace\\FinalProjects\\ConnectwithNGOs\\Uploads\\";
		
		
		
		ItemDao itemDao = new ItemDao(user_pojo, item_pojo);
		if (itemDao.insertItem()) {
		img.write(path+item_pojo.getItem_name());		
		response.sendRedirect("Dashboard.jsp");
		}
		
	}

}
