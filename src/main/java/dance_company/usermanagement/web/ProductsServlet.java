package dance_company.usermanagement.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.DbCon;
import dance_company.usermanagement.dao.*;
import dance_company.usermanagement.model.*;


@WebServlet("/detail")
public class ProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			int id = Integer.parseInt(request.getParameter("id"));
			ProductDao pdao = new ProductDao(DbCon.getConnection());
			Product p = pdao.getSingleProduct(id);
			List<Product> s = pdao.getSchedule(id);
			
			request.setAttribute("detail", p);
			request.setAttribute("schedule", s);
			request.getRequestDispatcher("single-product.jsp").forward(request, response);
		}
		
		catch (ClassNotFoundException|SQLException e) {
		e.printStackTrace();
		}

		// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
		// + sign on the left to edit the code.">
		/**
		 * Handles the HTTP <code>GET</code> method.
		 *
		 * @param request  servlet request
		 * @param response servlet response
		 * @throws ServletException if a servlet-specific error occurs
		 * @throws IOException      if an I/O error occurs
		 */
		
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
}