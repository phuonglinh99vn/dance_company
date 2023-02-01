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

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if (action.equalsIgnoreCase("add")) {
				doGetAdd(request, response);
			} else if (action.equalsIgnoreCase("view_cart")) {
				request.getRequestDispatcher("cart.jsp").forward(request, response);
//				response.sendRedirect("cart.jsp");
			} else if (action.equalsIgnoreCase("remove")) {
				doGetRemove(request, response);
			} else if (action.equalsIgnoreCase("submit_cart")) {
				doGetSubmitCart(request, response);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	protected void doGetAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try (PrintWriter out = response.getWriter()) {
			int id = Integer.parseInt(request.getParameter("schedule"));
			int id1 = Integer.parseInt(request.getParameter("productId"));
			ProductDao pdao = new ProductDao(DbCon.getConnection());
			Product p = pdao.getSingleSchedule(id);
			HttpSession session = request.getSession(false);
			String[] url = request.getHeader("referer").split("/");

			List<Product> cart = (ArrayList<Product>) session.getAttribute("cart");

			if (cart == null) {
				cart = new ArrayList<Product>();
				cart.add(p);
				session.setAttribute("cart", cart);
				response.sendRedirect("detail?id=" + id1);

			} else {
				boolean exist = false;

				for (Product c : cart) {
					if (c.getTime().equals(p.getTime())) {
						exist = true;
						String noti = "You have another class at the same time. \n Please choose another.";
						request.setAttribute("noti", noti);
						RequestDispatcher dispatcher = request.getRequestDispatcher("detail?id=" + id1);
						dispatcher.forward(request, response);
					}
				}

				if (exist == false) {
					cart.add(p);
					session.setAttribute("cart", cart);
					request.getRequestDispatcher("detail?id=" + id1).forward(request, response);
				}

			}

		}

		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

	protected void doGetRemove(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try (PrintWriter out = response.getWriter()) {
			int id = Integer.parseInt(request.getParameter("id"));

			HttpSession session = request.getSession();

			Product b = null;
			;
			List<Product> cart = (ArrayList<Product>) session.getAttribute("cart");
			for (Product c : cart) {
				if (c.getId() == id) {
					b = c;
				}

			}
			cart.remove(b);
			session.setAttribute("cart", cart);
			response.sendRedirect("CartServlet?action=view_cart");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doGetSubmitCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NullPointerException {

		try (PrintWriter out = response.getWriter()) {
			HttpSession session = request.getSession(false);

			List<Product> cart = (ArrayList<Product>) session.getAttribute("cart");
			if ((Integer) session.getAttribute("userId") == null ) {
				request.setAttribute("noti", "You have not logged in!" );
				RequestDispatcher dispatcher = request.getRequestDispatcher("CartServlet?action=view_cart");
				dispatcher.forward(request, response);
				
			} else {
			Integer userId = (int) session.getAttribute("userId");
			OrderDAO orderDAO = new OrderDAO(DbCon.getConnection());
			Order order = new Order(userId, null);
			int orderId = orderDAO.addOrder(order);
			OrderDetailsDAO oDAO = new OrderDetailsDAO(DbCon.getConnection());

			for (Product product : cart) {
				OrderDetails orderDetails = new OrderDetails(orderId, product.getId());
				oDAO.addOrderDetails(orderDetails);
			}
			session.removeAttribute("cart");
			response.sendRedirect("BookingServlet");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("schedule"));
		int id1 = Integer.parseInt(request.getParameter("productId"));
		doGetAdd(request, response);
	}
}
