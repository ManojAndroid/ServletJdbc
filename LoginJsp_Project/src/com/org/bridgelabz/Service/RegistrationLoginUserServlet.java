package com.org.bridgelabz.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegistrationLoginUserServlet")
public class RegistrationLoginUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter printWriter = response.getWriter();

		HttpSession httpSession = request.getSession();
		String fpassword = (String) httpSession.getAttribute("fpassword");
		if (fpassword == null) {
			response.sendRedirect("landing");
		} else {

			String fname = request.getParameter("fname");

			if (fname == null || (fname = fname.trim()).length() == 0) {
				printWriter.println("<p>Name: MISSING</p>");
			}
			String Sname = request.getParameter("sname");

			if (Sname == null || (Sname = Sname.trim()).length() == 0) {
				printWriter.println("<p>LastName: MISSING</p>");
			}
			String fage = request.getParameter("age");

			if (fage == null) {
				printWriter.println("<p>Age: MISSING</p>");
			}
			String gender = request.getParameter("gender");

			if (gender == null || gender.length() == 0) {
				printWriter.println("<p>Gender: MISSING</p>");
			}
			String skills = request.getParameter("generalized");

			if (skills == null || skills.length() == 0) {
				printWriter.println("<p>Gender: MISSING</p>");
			}
			String languages = request.getParameter("lang");

			if (languages == null || languages.length() == 0) {
				printWriter.println("<p>Gender: MISSING</p>");
			}
			String address = request.getParameter("address");

			if (address == null || (address = address.trim()).length() == 0) {
				printWriter.println("<p>Name: MISSING</p>");
			}
			Connection connection = null;
			PreparedStatement preparedStatement = null;

			String qry = "insert into abc.formdata values(?,?,?,?,?,?,?,?)";

			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=manoj");

				preparedStatement = connection.prepareStatement(qry);

				preparedStatement.setString(1, fname);
				preparedStatement.setString(2, Sname);
				preparedStatement.setString(3, fage);
				preparedStatement.setString(4, languages);
				preparedStatement.setString(5, gender);
				preparedStatement.setString(6, skills);
				preparedStatement.setString(7, address);
				preparedStatement.setString(8, fpassword);
				int i = preparedStatement.executeUpdate();
				if (i > 0) {

					response.sendRedirect("ViewData");
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
