package com.org.bridgelabz.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession httpSession = request.getSession();
		String fpassword = (String) httpSession.getAttribute("fpassword");
		if (fpassword == null) {
			response.sendRedirect("landing");
		} else {
			String fname = request.getParameter("fname");
			String id = request.getParameter("id");
			String age = request.getParameter("age");
			String sname = request.getParameter("sname");
			String language = request.getParameter("language");
			String gender = request.getParameter("gender");
			String skill = request.getParameter("skill");
			String address = request.getParameter("address");

			PrintWriter printWriter = response.getWriter();

			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "update abc.formdata set Firstname=?,Surname=?,Age=?,Language=?,Gender=?,Skill=? ,Address=?, Password=? where ID=?";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=manoj");

				preparedStatement = connection.prepareStatement(sql);

				preparedStatement.setString(1, fname);
				preparedStatement.setString(2, sname);
				preparedStatement.setString(3, age);
				preparedStatement.setString(4, language);
				preparedStatement.setString(5, gender);
				preparedStatement.setString(6, skill);
				preparedStatement.setString(7, address);
				preparedStatement.setString(8, fpassword);
				preparedStatement.setString(9, id);
				int i = preparedStatement.executeUpdate();
				if (i > 0) {

					response.sendRedirect("DisplayServlet");
				} else {
					printWriter.println(
							"<html><body bgcolor='#169393'><h1>Sorry There Is Something Problems Occured!!! </h1></body></html>");

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
