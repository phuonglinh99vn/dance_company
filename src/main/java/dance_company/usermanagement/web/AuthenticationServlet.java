package dance_company.usermanagement.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.DbCon;
import dance_company.usermanagement.dao.UserDAO;
import dance_company.usermanagement.model.User;

@WebServlet("/Authentication")
public class AuthenticationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AuthenticationServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if (action.equalsIgnoreCase("login")) {
				Login(request, response);
			} else if (action.equalsIgnoreCase("logout")) {
				Logout(request, response);
			} else if (action.equalsIgnoreCase("register")) {
				Register(request, response);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	private void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
			String[] url = request.getHeader("referer").split("/");
			UserDAO udao = new UserDAO(DbCon.getConnection());
			User user = udao.userLogin(email, password);
			User admin = udao.adminLogin(email, password);
			HttpSession session = request.getSession(false);

			if (user != null && admin == null) {
				session.setAttribute("name", user.getName());
				session.setAttribute("userId", user.getId());
				response.sendRedirect(url[url.length - 1]);
			} else if (admin != null ) {
				session.setAttribute("name", admin.getName());
				response.sendRedirect(url[url.length - 1]);
			} else {
				String warn = "Your email or passowrd is incorrect! \n Please login again";
				request.setAttribute("warn", warn);
				request.getRequestDispatcher("/index.jsp").forward(request, response);

			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	private void Logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		session.removeAttribute("name");
		response.sendRedirect("HomeServlet");
	}

	private void Register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String userName = request.getParameter("name");
			String userEmail = request.getParameter("email");
			String userPassword = request.getParameter("pwd");
			String userPhone = request.getParameter("mobile");

			User user = new User(userName, userEmail, userPassword, userPhone);
			UserDAO udao = new UserDAO(DbCon.getConnection());
			udao.insertUser(user);
			response.sendRedirect("HomeServlet");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
