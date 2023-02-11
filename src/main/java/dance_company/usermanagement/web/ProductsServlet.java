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
import constant.PublicConstant;
import dance_company.usermanagement.dao.*;
import dance_company.usermanagement.model.*;

@WebServlet("/detail")
public class ProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			int id = Integer.parseInt(request.getParameter("id"));

			ProductDAO pdao = new ProductDAO(DbCon.getConnection());
			Product p = pdao.getSingleProduct(id);
			List<Product> s = pdao.getSchedule(id);
			request.setAttribute("detail", p);
			request.setAttribute("schedule", s);

			ReviewDAO reviewDAO = new ReviewDAO(DbCon.getConnection());
			List<Review> reviews = reviewDAO.getReviewsByProductId(id);
			request.setAttribute("reviews", reviews);

			request.getRequestDispatcher("singleproduct.jsp").forward(request, response);
		} catch (Exception e) {
			Logging.Logger(PublicConstant.ERROR, e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}