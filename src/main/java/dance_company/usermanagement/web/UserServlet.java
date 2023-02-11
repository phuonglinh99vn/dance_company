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

import connection.DbCon;
import constant.PublicConstant;
import dance_company.usermanagement.dao.*;
import dance_company.usermanagement.model.*;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;

	public void init() {
		userDAO = new UserDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		try {
			switch (action) {
			case "delete":
				deleteUser(request, response);
				break;
			case "list":
				listUser(request, response);
				break;
			}
		} catch (Exception e) {
			Logging.Logger(PublicConstant.ERROR, e.getMessage());
		}
	}

	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ClassNotFoundException {
		try (PrintWriter out = response.getWriter()) {
			UserDAO udao = new UserDAO(DbCon.getConnection());
			List<User> listUser = udao.selectAllUsers();
			request.setAttribute("listUser", listUser);
			RequestDispatcher dispatcher = request.getRequestDispatcher("adminportal.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			Logging.Logger(PublicConstant.ERROR, e.getMessage());
		}
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ClassNotFoundException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			UserDAO udao = new UserDAO(DbCon.getConnection());
			udao.deleteUser(id);
			response.sendRedirect("UserServlet?action=list");
		} catch (Exception e) {
			Logging.Logger(PublicConstant.ERROR, e.getMessage());
		}

	}
}