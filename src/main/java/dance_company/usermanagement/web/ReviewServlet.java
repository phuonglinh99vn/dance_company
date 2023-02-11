package dance_company.usermanagement.web;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;

import connection.DbCon;
import constant.PublicConstant;
import dance_company.usermanagement.dao.*;
import dance_company.usermanagement.model.*;

@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReviewServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("addReview")) {
			addReview(request, response);
		} else if (action.equalsIgnoreCase("getReviews")) {
			getReviews(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void addReview(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		try {
			int productId = Integer.parseInt(request.getParameter("productId"));
			int userId = (int) session.getAttribute("userId");
			String comment = request.getParameter("comment");
			int rating = Integer.parseInt(request.getParameter("rating"));
			java.util.Date date = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());

			Review review = new Review(productId, userId, rating, comment, sqlDate);
			ReviewDAO reviewDAO = new ReviewDAO(DbCon.getConnection());
			reviewDAO.insertReview(review);
			response.sendRedirect("detail?id=" + productId);
		} catch (Exception e) {
			Logging.Logger(PublicConstant.ERROR, e.getMessage());
		}

	}

	private void getReviews(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int productId = Integer.parseInt(request.getParameter("productId"));
			ReviewDAO reviewDAO = new ReviewDAO(DbCon.getConnection());

			request.setAttribute("reviews", reviewDAO.getReviewsByProductId(productId));
			request.getRequestDispatcher("detail?id=" + productId).forward(request, response);

		} catch (Exception e) {
			Logging.Logger(PublicConstant.ERROR, e.getMessage());
		}

	}
}