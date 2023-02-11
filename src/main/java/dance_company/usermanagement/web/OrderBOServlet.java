package dance_company.usermanagement.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.DbCon;
import constant.PublicConstant;
import dance_company.usermanagement.dao.OrderDAO;
import dance_company.usermanagement.dao.OrderDetailsDAO;
import dance_company.usermanagement.model.Logging;
import dance_company.usermanagement.model.Order;
import dance_company.usermanagement.model.OrderDetails;

@WebServlet("/OrderBOServlet")
public class OrderBOServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderBOServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("orderlist")) {
			doGetOrderList(request, response);
		} else if (action.equalsIgnoreCase("approveOrder")) {
			doApproveOrder(request, response);
		} else if (action.equalsIgnoreCase("orderdetails")) {
			doGetOrders(request, response);
		}
	}

	protected void doGetOrderList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			OrderDAO odao = new OrderDAO(DbCon.getConnection());
			List<Order> orders = odao.getAllOrders();
			List<Order> unapprovedOrders = orders.stream().filter(order -> !order.isApprove())
					.collect(Collectors.toList());
			request.setAttribute("orders", unapprovedOrders);
			RequestDispatcher dispatcher = request.getRequestDispatcher("orders.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			Logging.Logger(PublicConstant.ERROR, e.getMessage());
		}

	}

	protected void doGetOrders(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			HttpSession session = request.getSession(false);
			int id = Integer.parseInt(request.getParameter("id"));
			OrderDetailsDAO odao = new OrderDetailsDAO(DbCon.getConnection());
			List<OrderDetails> orderDetails = odao.getOderDetails(id);
			request.setAttribute("orderId", id);
			request.setAttribute("orderDetails", orderDetails);
			RequestDispatcher dispatcher = request.getRequestDispatcher("orderdetails.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			Logging.Logger(PublicConstant.ERROR, e.getMessage());
		}

	}

	protected void doApproveOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			OrderDAO odao = new OrderDAO(DbCon.getConnection());
			odao.approveOrder(id);
			response.sendRedirect("OrderBOServlet?action=orderlist");
		} catch (Exception e) {
			Logging.Logger(PublicConstant.ERROR, e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
