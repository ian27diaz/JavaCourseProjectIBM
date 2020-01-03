package com.ibm.horario;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet{
	private static final long serialVersionUID = 2L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		response.setContentType("text/html");
		Cookie cookie = new Cookie("authType", "true");
		cookie.setMaxAge(3600);
		response.addCookie(cookie);
		RequestDispatcher disp = 
				request.getRequestDispatcher("/HorarioEscolar/Register.jsp");
		//System.out.println("From servlet java " + request.getHeader("errorMessage"));
		disp.forward(request, response); 
	}
}
