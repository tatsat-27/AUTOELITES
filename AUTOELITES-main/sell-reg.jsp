<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

		<%
		String username=request.getParameter("un");
		String email=request.getParameter("em");
		int phone=Integer.parseInt(request.getParameter("nu"));
		String carnum =request.getParameter("cno");
		String apd =request.getParameter("dt");
		


		try
		{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","sahil1111");
			Statement statement = connection.createStatement();
			String command = "INSERT into sell values('"+username+"','"+email+"',"+phone+",'"+carnum+"','"+apd+"')";
            statement.executeUpdate(command);
			//out.println("Data is successfully updated!");
			
			%>
			<script>
				alert("your information has been saved!")
				response.sendRedirect("sell.html");
			</script><%
			
		}
		catch(Exception e)
		{
		System.out.print(e);
		e.printStackTrace();
		}
		%>
