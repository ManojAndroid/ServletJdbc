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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginToFormjspServlet")
public class LoginToFormjspServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("Logout.jsp").include(request, response); 

		PrintWriter printWriter = response.getWriter();

		String email = request.getParameter("Email");
		
		if (email == null || (email = email.trim()).length() == 0) {
			printWriter.println("<p>Email: MISSING</p>");
		}
		
		String password = request.getParameter("Password");
		if (password == null || (password = password.trim()).length() == 0) {
			printWriter.println("<p>Password: MISSING</p>");
		}
		//printWriter.println(email+" "+password);
		
		
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		String qry = "select * from abc.signup where Password=? ";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=manoj");

			preparedStatement = connection.prepareStatement(qry);
			//preparedStatement.setString(1, email);
			preparedStatement.setString(1, password);
			resultSet = preparedStatement.executeQuery();
			

			if (resultSet.next()) {
				/*ServletContext context=request.getServletContext();
				context.setAttribute("logintoform",password);
				
				*
				*/
				HttpSession httpSession = request.getSession();
				 httpSession.setAttribute("fpassword",password);
				response.sendRedirect("LoginFormjsp.jsp");

			} else {
				printWriter.println(
						"<html><body bgcolor='#169393'><h1>Wrong Password /Email id.....<a href='Login.jsp'>BACK</a></h1></body></html>");

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
