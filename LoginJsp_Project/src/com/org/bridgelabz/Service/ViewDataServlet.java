package com.org.bridgelabz.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ViewData")
public class ViewDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.getRequestDispatcher("Header.jsp").include(request, response);
		
		
		PrintWriter printWriter = response.getWriter();

		HttpSession httpSession = request.getSession();
		  String fpassword= (String) httpSession.getAttribute("fpassword");
		  if(fpassword==null||fpassword==" ")
		  {
			  printWriter.println("Session out login Again");
				//response.sendRedirect("lj2");
		  }
		  else
		  {
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
			while (resultSet.next()) {
				printWriter.println("<html><body>");
				printWriter.println("<center>");
				printWriter.println("<table border='1px solid black;box-shadow= 10px 10px 10px 10px; align='center' width='50%' height='400px'>");
				printWriter.print("<tr><th>Form</th><td>Serial Number" +0000+""+i + "</td></tr>" + "<tr><th>FirstName:</th><td>" + resultSet.getString(1) + "</td></tr>" + "<tr><th>LastName:</th><td>"
						+ resultSet.getString(2) + "</td></tr>" + "<tr><th>Age:</th><td>" + resultSet.getString(3) + "</td></tr>"
						+ "<tr><th>Gender:</th><td>" + resultSet.getString(4) + "</td></tr>" + "<tr><th>Specialized Skill:</th><td>" + resultSet.getString(5)
						+ "</td></tr>" + "<tr><th>Language:</th><td>" + resultSet.getString(6) + "</td></tr>" + "<tr><th>Address:</th><td>"
						+ resultSet.getString(7) + "</td></tr>");
				
				printWriter.println("<center></table>");
				printWriter.println("</body></html>");
				printWriter.println("<br><br>");
				i++;
			}

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
