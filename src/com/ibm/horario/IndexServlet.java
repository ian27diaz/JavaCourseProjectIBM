package com.ibm.horario;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		response.setContentType("text/html");
		Cookie cookie = new Cookie("authType", "false");
		cookie.setMaxAge(3600);
		response.addCookie(cookie);
		RequestDispatcher disp = 
		request.getRequestDispatcher("/HorarioEscolar/index.jsp");
		disp.forward(request, response); 
	}
}
