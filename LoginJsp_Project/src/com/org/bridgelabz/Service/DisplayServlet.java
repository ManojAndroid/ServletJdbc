package com.org.bridgelabz.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DisplayServlet")
public class DisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("Header.jsp").include(request, response);

		PrintWriter printWriter = response.getWriter();

		HttpSession httpSession = request.getSession();
		String fpassword = (String) httpSession.getAttribute("fpassword");
		if (fpassword == null || fpassword == " ") {
			printWriter.println("Session out login Again");
			// response.sendRedirect("lj2");
		} else {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;

			String qry = "select * from abc.formdata where Password=?";

			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=manoj");

				preparedStatement = connection.prepareStatement(qry);

				preparedStatement.setString(1, fpassword);
				resultSet = preparedStatement.executeQuery();
				int i = 1;
				
				  printWriter.println("<html>"); printWriter.
				  println("<head><link rel='stylesheet' href='css/table.css' type='text/css'> "
				  ); printWriter.println("</head> ");
				  printWriter.println("<body><center>"); printWriter.println(
				  "<table border='1px solid black; align='center' width='100%'"
				  ); printWriter.print(
				  "<tr><th>Emp_Id</th><th>FirstName</th> <th>LastName</th> <th>Age</th> <th>Language</th><th>Gender</th><th>Skills</th><th>Address</th></tr>"
				 );
				 
				while (resultSet.next()) {
				
					 printWriter.print("<tr><td>" +
							 resultSet.getString(9) +"</td>" + "<td>" +
					         resultSet.getString(1) +"</td>" + "<td>" +
							 resultSet.getString(2) + "</td>" + "<td>" +
							 resultSet.getString(3) + "</td>" + "<td>" +
			                 resultSet.getString(4) + "</td>" + "<td>" +
					         resultSet.getString(5) + "</td>" + "<td>" +
					         resultSet.getString(6) + "</td>" + "<td>" +
					         resultSet.getString(7) + "</td>" + "</td></tr>"); i++;
					
				}
				
				 printWriter.println("<center></table>");
				  printWriter.println("</body>");
				  
				  printWriter.println("</html>");
				 
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();

				if (preparedStatement != null)
					try {
						preparedStatement.close();
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				if (connection != null)
					try {
						connection.close();
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
			}
		}
	}

}
