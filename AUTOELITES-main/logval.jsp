<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- validateLogin.jsp -->

<%@ page import="java.sql.*" %>
<%
	String email=request.getParameter("em");
    String password = request.getParameter("pas");

    try {
        // Establish a JDBC connection to the Oracle database.
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sahil1111");

        // Prepare an SQL query to retrieve the user's password from the database.
        PreparedStatement statement = connection.prepareStatement("SELECT password FROM userdata WHERE email = ?");
        statement.setString(1, email);
        ResultSet result = statement.executeQuery();

        if (result.next()) {
            String correctPassword = result.getString("password");

            // Compare the entered password with the correct password from the database.
            if (password.equals(correctPassword)) {
                // Redirect the user to the appropriate page.
                %><script>
                alert("WELCOME ! to AUTOELITES ")
                </script><%
            } else {
                // Display an error message and prompt the user to enter valid data.
                out.println("Incorrect password. Please try again.");
            }
        } else {
            // Display an error message and prompt the user to enter valid data.
            out.println("Invalid username. Please try again.");
        }

        // Close the database connection and release any resources.
        result.close();
        statement.close();
        connection.close();

    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>