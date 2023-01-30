package dance_company.usermanagement.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {
	private static final long serialVersionUID = 1L;
 
	public void init(FilterConfig filterConfig) 
		throws ServletException {
 
	}  
 
      public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) 
	                throws IOException, ServletException {  
 
	response.setContentType("text/html"); 
    	PrintWriter out = response.getWriter();
 
    	//get parameters from request object.
    	HttpSession session = request.getSession(false);
    	String email = (String) session.getAttribute("name");
 
    	//check for null and empty values.
    	if(email == null || email.equals(""))
    	{
    		out.print("Please enter both username " +
    				"and password. <br/><br/>");
    		RequestDispatcher requestDispatcher = 
    			request.getRequestDispatcher("HomeServlet");
    		requestDispatcher.include(request, response);
    	}//Check for valid username and password.
    	else if(email.equals("admin")){
    		 chain.doFilter(request, response);
    	}else{
    		out.print("Wrong username or password. <br/><br/>");
    		RequestDispatcher requestDispatcher = 
    			request.getRequestDispatcher("HomeServlet");
    		requestDispatcher.include(request, response);
    	}	          
     }  
 
    public void destroy() {
 
    }

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}  
}
