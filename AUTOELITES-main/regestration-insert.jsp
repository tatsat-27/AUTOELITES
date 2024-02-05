<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

		<%
		String username=request.getParameter("un");
		String email=request.getParameter("em");
		int phone=Integer.parseInt(request.getParameter("ph"));
		String password=request.getParameter("ps");


		try
		{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","sahil1111");
			Statement statement = connection.createStatement();
			String command = "INSERT into userdata values('"+username+"','"+email+"',"+phone+",'"+password+"')";
            statement.executeUpdate(command);
			//out.println("Data is successfully updated!");
			response.sendRedirect("login.html");
		}
		catch(Exception e)
		{
		System.out.print(e);
		e.printStackTrace();
		}
		%>
