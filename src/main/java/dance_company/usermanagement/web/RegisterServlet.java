package dance_company.usermanagement.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dance_company.usermanagement.model.*;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);		
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			
			
			String userName= request.getParameter("name");
			String userEmail= request.getParameter("email");
			String userPassword= request.getParameter("pwd");
			String userPhone= request.getParameter("mobile");
			
			//creating user object to store edata
			user user= new user(userName, userEmail, userPassword, userPhone);
			
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("message","*Registration SuccessFul !! User id is:" + userId);
			response.sendRedirect("register.jsp");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
