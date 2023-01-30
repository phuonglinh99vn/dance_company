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
import dance_company.usermanagement.dao.*;
import dance_company.usermanagement.model.*;

/**
 * ControllerServlet.java
 * This servlet acts as a page controller for the application, handling all
 * requests from the user.
 * @email Ramesh Fadatare
 */

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
//                case "/new":
//                    showNewForm(request, response);
//                    break;
                case "/insert":
                    insertUser(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
//                case "/edit":
//                    showEditForm(request, response);
//                    break;
                case "/update":
                    updateUser(request, response);
                    break;
                case "list":
                    listUser(request, response);
                    break;
            }
        } catch (Exception e) {
//            throw new ServletException(ex);
        	e.printStackTrace();
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException, ClassNotFoundException{
    	try (PrintWriter out = response.getWriter()) {
    	UserDAO udao = new UserDAO(DbCon.getConnection());	
    	List<user> listUser = udao.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
        dispatcher.forward(request, response);
    	
    	} catch (ClassNotFoundException|SQLException e) {
    		e.printStackTrace();
    		}
    }

//    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
//        dispatcher.forward(request, response);
//    }

//    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
//    throws SQLException, ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        user existingUser = userDAO.selectUser(id);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
//        request.setAttribute("user", existingUser);
//        dispatcher.forward(request, response);
//
//    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        
    	String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        
        user newUser = new user(name, email, password, mobile);
        userDAO.insertUser(newUser);
        response.sendRedirect("UserServlet");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        user book = new user(id, name, email, password);
        userDAO.updateUser(book);
        response.sendRedirect("list");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        UserDAO udao = new UserDAO(DbCon.getConnection());
        udao.deleteUser(id);
        response.sendRedirect("UserServlet?action=list");

    }
}