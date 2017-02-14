<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 	String log=(String)request.getSession(true).getAttribute("login");
		String ad=(String)request.getSession(true).getAttribute("Ad");
		String cp=(String)request.getSession(true).getAttribute("Cp");
		String ville=(String)request.getSession(true).getAttribute("Ville");
		out.println(log);
		out.println("<br>");
		out.println(ad);
		out.println("<br>");
		out.println(cp);
		out.println(ville);
		out.println("<br>");

		out.println("<a href=\"http://localhost:8080/JspProjet/Bonjour.jsp\" title=\"lien\">retour accueil</a>");


		
	%>
</body>
</html>