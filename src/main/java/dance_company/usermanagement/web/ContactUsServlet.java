package dance_company.usermanagement.web;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ContactUsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/contactus.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String senderName = request.getParameter("name");
		String senderEmail = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");

		Properties props = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "25");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
		Session session = Session.getDefaultInstance(props, null);

		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(senderEmail, senderName));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress("bemap139@gmail.com"));
			msg.setSubject(subject);
			msg.setText(message);
			Transport.send(msg);

			response.sendRedirect("contactus.jsp?success=true");
		} catch (AddressException e) {
			e.printStackTrace();
			response.sendRedirect("contactus.jsp?error=true");
		} catch (MessagingException e) {
			e.printStackTrace();
			response.sendRedirect("contactus.jsp?error=true");
		}
	}
}

