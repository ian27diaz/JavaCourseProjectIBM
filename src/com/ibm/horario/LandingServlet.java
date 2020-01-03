package com.ibm.horario;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LandingServlet extends HttpServlet {
	private static final long serialVersionUID = 4L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Hola desde LandingServlet()");
		boolean userFound = false;
		for(Cookie c: request.getCookies()) {
			if(c.getName().equals("currentUser") && !c.getValue().equals("")) {
				System.out.println("From LandingServlet => " + c.getValue());
				c.setValue("");
				response.addCookie(c);
				userFound = true;
				System.out.println("From LandingServlet (after) => " + c.getValue());
				break;
			}
		}
		
		if(!userFound) {
			System.out.println("Desde LandingServlet() => No hay tal usuario, wtf?");
			response.sendRedirect("/JavaCourseProject/index");
		} else {
			RequestDispatcher disp = 
					request.getRequestDispatcher("/HorarioEscolar/Landing.jsp");
					disp.forward(request, response);
			
		}
		
	}
}
