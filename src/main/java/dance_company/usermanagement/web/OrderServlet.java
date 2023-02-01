package dance_company.usermanagement.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.DbCon;
import dance_company.usermanagement.dao.*;
import dance_company.usermanagement.model.*;
import dance_company.usermanagement.model.Product;


@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if (action.equalsIgnoreCase("orderList")) {
				doGetOrderList(request, response);
			} else if (action.equalsIgnoreCase("view_timetable")) {
				doGetTimetable(request, response);
			} else if (action.equalsIgnoreCase("delete_Class")) {
				doGetDeleteClass(request, response);	
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	protected void doGetOrderList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			HttpSession session = request.getSession(false);
			int userId = (int) session.getAttribute("userId");
			OrderDAO odao = new OrderDAO(DbCon.getConnection());
			List<Order> orders = odao.getAllOrders(userId);
			request.setAttribute("orders", orders);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/orders.jsp");
			dispatcher.forward(request, response);
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	protected void doGetTimetable(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			HttpSession session = request.getSession(false);
			int userId = (int) session.getAttribute("userId");
			OrderDetailsDAO odetails = new OrderDetailsDAO(DbCon.getConnection());
			List<OrderDetails> timetable = odetails.getOderDetails(userId);
			request.setAttribute("timetable", timetable);
			request.getRequestDispatcher("timetable.jsp").forward(request, response);
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	protected void doGetDeleteClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
		int id = Integer.parseInt(request.getParameter("id"));
		OrderDetailsDAO odetails = new OrderDetailsDAO(DbCon.getConnection());
		odetails.deleteOrderDetails(id);
		response.sendRedirect("OrderServlet?action=view_timetable");	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
