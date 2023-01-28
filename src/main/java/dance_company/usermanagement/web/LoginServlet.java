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
import dance_company.usermanagement.dao.*;
import dance_company.usermanagement.model.*;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
			String[] url = request.getHeader("referer").split("/");
			HttpSession session = request.getSession(false);
			UserDAO udao = new UserDAO(DbCon.getConnection());
			user user = udao.userLogin(email, password);
			if (user != null) {
				
				session.setAttribute("name", user.getName());
				session.setAttribute("userId", user.getId());
				response.sendRedirect(url[url.length-1]);
//				RequestDispatcher dispatcher = request.getRequestDispatcher(urlString);
//				dispatcher.forward(request, response);
			} else {
				String warn = "Your email or passowrd is incorrect!";
				session.setAttribute("warn", warn);
				
//				RequestDispatcher dispatcher = request.getRequestDispatcher(url[url.length-1]);
//				dispatcher.forward(request, response);
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}
}