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
import dance_company.usermanagement.dao.*;
import dance_company.usermanagement.model.*;

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
			if (action.equalsIgnoreCase("view_timetable")) {
				doGetTimetable(request, response);
			} else if (action.equalsIgnoreCase("delete_Class")) {
				doGetDeleteClass(request, response);
			}
		} catch (Exception e) {
			Logging.Logger(PublicConstant.ERROR, e.getMessage());
		}

	}

	protected void doGetTimetable(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			HttpSession session = request.getSession(false);
			int userId = (int) session.getAttribute("userId");
			OrderDetailsDAO odetails = new OrderDetailsDAO(DbCon.getConnection());
			List<OrderDetails> timetable = odetails.getTimetable(userId);
			request.setAttribute("timetable", timetable);
			request.getRequestDispatcher("timetable.jsp").forward(request, response);

		} catch (Exception e) {
			Logging.Logger(PublicConstant.ERROR, e.getMessage());
		}

	}

	protected void doGetDeleteClass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException, ClassNotFoundException {

		try {
			int id = Integer.parseInt(request.getParameter("id"));
			OrderDetailsDAO odetails = new OrderDetailsDAO(DbCon.getConnection());
			odetails.deleteOrderDetails(id);
			response.sendRedirect("OrderServlet?action=view_timetable");
		} catch (Exception e) {
			Logging.Logger(PublicConstant.ERROR, e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
