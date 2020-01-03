package com.ibm.horario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AuthHandler extends HttpServlet {
	private static final long serialVersionUID = 5L;
	Connection conn;
	@Override
	public void init() throws ServletException {
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/cursos";
			Class.forName (driver);
			conn = DriverManager.getConnection(url ,"root","toor");
			System.out.println("On init() => Connection successful");
		} catch(ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch( SQLException ex1) {
			System.out.println("SQLException: " + ex1.getMessage());
		    System.out.println("SQLState: " + ex1.getSQLState());
		    System.out.println("VendorError: " + ex1.getErrorCode());
		}
	}
	@Override
	public void destroy() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			try {
				//Para que de la ilusión de que
				//es una base de datos bien robusta jeje
				Thread.sleep(500);
			} catch (InterruptedException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			response.setContentType("text/html");
			boolean registerOrLog = true;
			for(Cookie c: request.getCookies()) {
				if(c.getName().equals("authType")) {
					registerOrLog = Boolean.parseBoolean(c.getValue());
					break;
				}
			}
			Cookie cookie;
			if(registerOrLog) {
				//photo: 
				//String photo = 
				String username = 			request.getParameter("username");
				String password = 			request.getParameter("password");
				String confirmPassword = 	request.getParameter("password2");
				
				//Check if any of the fields are empty
				if(username.equals("") || password.equals("") || confirmPassword.equals("")) {
					//Redirect with fields not completed message.
					cookie = new Cookie("errorMessage", "Please");
					cookie.setMaxAge(5);
					response.addCookie(cookie);
					response.sendRedirect("/JavaCourseProject/register");
					//System.out.println("Fields are incomplete.");
				}
				if(!password.equals(confirmPassword)) {
					//Redirect with passwords dont match message.
					cookie = new Cookie("errorMessage", "Passwords");
					cookie.setMaxAge(5);
					response.addCookie(cookie);
					response.sendRedirect("/JavaCourseProject/register");
					//System.out.println("Passwords dont match.");
				}
				String selectStatement = "SELECT * FROM Usuario WHERE username = ?";
				PreparedStatement pst;
				try {
					pst = conn.prepareStatement(selectStatement);
					pst.setString(1, username);
					ResultSet rs = pst.executeQuery();
					if(rs.next() == false) {
						//Insert data to the table, create session
						//redirect to cursos page
						Statement statement = conn.createStatement();
						statement.executeUpdate("INSERT INTO Usuario"
								+ "(username, password_, photoPath)"
								+ "VALUES (" + "\"" + username + "\""
								+ "," + "\"" + password + "\"" + "," + "\"" + "\"" + ");");
						Cookie usernameCookie = new Cookie("currentUser", username);
						usernameCookie.setMaxAge(1800);
						response.addCookie(usernameCookie);
						response.sendRedirect("/JavaCourseProject/cursos/" + username);
					} else {
						//Error about username already taken!
						cookie = new Cookie("errorMessage", "Username");
						cookie.setMaxAge(5);
						response.addCookie(cookie);
						response.sendRedirect("/JavaCourseProject/register");
					}
					
					} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			} else {
				String username = 			request.getParameter("username");
				String password = 			request.getParameter("password");
				
				System.out.println("Username => " + username + " - " + password);
				String selectStatement = "SELECT * FROM Usuario WHERE username = ? AND password_ = ?";
				PreparedStatement pst;
				try {
					pst = conn.prepareStatement(selectStatement);
					pst.setString(1, username);
					pst.setString(2, password);
					ResultSet rs = pst.executeQuery();
					if(rs.next() == false) {
						cookie = new Cookie("errorMessage", "Username");
						cookie.setMaxAge(5);
						response.addCookie(cookie);
						response.sendRedirect("/JavaCourseProject/index");
					} else {
						System.out.println("User Found");
						Cookie usernameCookie = new Cookie("currentUser", username);
						usernameCookie.setMaxAge(1800);
						response.addCookie(usernameCookie);
						response.sendRedirect("/JavaCourseProject/cursos/" + username);
					}
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
}
