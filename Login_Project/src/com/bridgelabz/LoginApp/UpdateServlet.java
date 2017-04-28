package com.bridgelabz.LoginApp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ServletContext servletContext = getServletContext();
		String email = (String) servletContext.getAttribute("uemail");

		String password = (String) servletContext.getAttribute("upass");

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String qry = "select * from abc.bridgelab where Email=? AND Password=?";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=manoj");

			preparedStatement = connection.prepareStatement(qry);

			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				String name = resultSet.getString(1);
				String surname = resultSet.getString(2);
				RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
				dispatcher.forward(request, response);
			} else {

				/*
				 * printWriter.println(
				 * "<html><body bgcolor='cyan'><h1>Invalid Email/Password </h1><a href='Login.html'></a></body></html>"
				 * );
				 */
				RequestDispatcher dispatcher = request.getRequestDispatcher("Redirection.html");
				dispatcher.forward(request, response);
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