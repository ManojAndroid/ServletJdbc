package com.org.bridgelabz.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		request.getRequestDispatcher("Logout.jsp").include(request, response); 
		
		
		PrintWriter printWriter = response.getWriter();
		String firstname = request.getParameter("fname");
		if (firstname == null || (firstname = firstname.trim()).length() == 0) {
			printWriter.println("<p>Name: MISSING</p>");
		}
		String lastname = request.getParameter("lname");
		if (lastname == null || (lastname = lastname.trim()).length() == 0) {
			printWriter.println("<p>LastName: MISSING</p>");
		}

		String email = request.getParameter("Email");
		if (email == null || (email = email.trim()).length() == 0) {
			printWriter.println("<p>Email: MISSING</p>");
		}
		String password = request.getParameter("Password");
		if (password == null || (password = password.trim()).length() == 0) {
			printWriter.println("<p>Password: MISSING</p>");
		}

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String qry = "insert into abc.signup values(?,?,?,?)";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=manoj");

			preparedStatement = connection.prepareStatement(qry);

			preparedStatement.setString(1, firstname);
			preparedStatement.setString(2, lastname);
			preparedStatement.setString(3, email);
			preparedStatement.setString(4, password);
			int i = preparedStatement.executeUpdate();
			if (i > 0) {
				
				
				HttpSession httpSession = request.getSession();
				 httpSession.setAttribute("fpassword",password);
				 //httpSession.setMaxInactiveInterval(1*60);
				request.getRequestDispatcher("Formjsp.jsp").include(request, response);  

				//response.sendRedirect("Formjsp.jsp");
			} else {
				printWriter.println("welcome" + firstname + " " + lastname);
				response.sendRedirect("Login.jsp");
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
