package dance_company.usermanagement.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.basic.BasicPanelUI;

import connection.DbCon;
import dance_company.usermanagement.dao.*;
import dance_company.usermanagement.model.*;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if(action.equalsIgnoreCase("add")) {
				doGetAdd(request, response);
			} else if (action.equalsIgnoreCase("view_cart")) {
//				HttpSession session = request.getSession();
//				List<Product> cart = (ArrayList<Product>) session.getAttribute("cart");	
				response.sendRedirect("cart.jsp");
			} else if (action.equalsIgnoreCase("remove")) {
				doGetRemove(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace(); 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	protected void doGetAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try (PrintWriter out = response.getWriter()) {
//			ArrayList<Product> cartList = new ArrayList<>();
			int id = Integer.parseInt(request.getParameter("id"));
			ProductDao pdao = new ProductDao(DbCon.getConnection());
			Product p = pdao.getSingleSchedule(id);
			HttpSession session = request.getSession(false);
			String url = request.getContextPath();
			List<Product> cart = (ArrayList<Product>) session.getAttribute("cart");
			
			if ( cart == null) {
				cart = new ArrayList<Product>();
				cart.add(p);
				session.setAttribute("cart", cart);
//				request.getRequestDispatcher("detail?id=" + id).forward(request, response);
				response.sendRedirect("detail?id=" + id);
			}
				else {					
				boolean exist = false;
				
				for (Product c : cart) {
					if (c.getTime().equals(p.getTime())) {
						exist = true;
//						session.setAttribute("cart", cart);
//						response.sendRedirect("BookingServlet");
						String noti = "You have another at same time";
						request.setAttribute("noti", noti);
//						response.sendRedirect("detail?id=" + id);
						RequestDispatcher dispatcher = request.getRequestDispatcher("detail?id=" + id);
						dispatcher.forward(request, response);
					}
				}

				if (exist == false) {
					cart.add(p);	
//					session.setAttribute("cart", cart);
//					request.getRequestDispatcher("detail?id=" + id).forward(request, response);
					System.out.println("New Item");
					response.sendRedirect("detail?id=" + id);
				}
				
			}
			
			
		}

		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	protected void doGetRemove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try (PrintWriter out = response.getWriter()) {
			int id = Integer.parseInt(request.getParameter("id"));
//			ProductDao pdao = new ProductDao(DbCon.getConnection());
//			Product p = pdao.getSingleSchedule(id);
			HttpSession session = request.getSession();
			
			Product b = null;;
			List<Product> cart = (ArrayList<Product>) session.getAttribute("cart");
			for (Product c : cart) {
				if (c.getId() == id) {
					b = c;
				}
				
			}
			cart.remove(b);
			session.setAttribute("cart", cart);
			response.sendRedirect("CartServlet?action=view_cart");
//			request.getRequestDispatcher("CartServlet?action=view_cart").forward(request, response);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
	
	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		try (PrintWriter out = response.getWriter()) {
//			ArrayList<Product> cartList = new ArrayList<>();
//			int id = Integer.parseInt(request.getParameter("id"));
//			ProductDao pdao = new ProductDao(DbCon.getConnection());
//			Product p = pdao.getSingleSchedule(id);
//			HttpSession session = request.getSession();
//
//			ArrayList<Product> cart_list = (ArrayList<Product>) session.getAttribute("cart-list");
//			if (cart_list == null) {
//				cartList.add(p);
//				session.setAttribute("cart-list", cartList);
//				response.sendRedirect("cart.jsp");
//			} else {
//				cartList = cart_list;
//
//				boolean exist = false;
//				for (Product c : cart_list) {
//					if (c.getTime() == p.getTime()) {
//						exist = true;
//						out.println(
//								"<h3 style='color:crimson; text-align: center'>Item Already in Cart. <a href='cart.jsp'>GO to Cart Page</a></h3>");
//					}
//				}
//
//				if (!exist) {
//					cartList.add(p);				
//				}
//				session.setAttribute("cart-list", cartList);
//				response.sendRedirect("cart.jsp");
//			}
//			
//		}
//
//		catch (ClassNotFoundException | SQLException e) {
//			e.printStackTrace();
//		}
//	}
