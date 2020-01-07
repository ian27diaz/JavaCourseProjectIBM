<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% String currentUsername = "";
	if(request.getCookies().length > 0){
		for(Cookie c: request.getCookies()) {
			System.out.println("(LP) > " + c.getName() + " - " + c.getValue());
			if(c.getName().equals("currentUser")) {
				System.out.println("Landing.JSP => " + c.getValue());
				currentUsername = c.getValue();
				
				break;
			}
		}
	}
	%>
	<h1>Hello from landing page, <%= currentUsername %>!</h1>
</body>
</html>
