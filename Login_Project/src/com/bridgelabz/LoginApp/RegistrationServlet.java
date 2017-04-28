package com.bridgelabz.LoginApp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@WebServlet("/RegistrationServlet")*/
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter printWriter=response.getWriter();
		
		
		String fname=request.getParameter("fname");
		String Sname=request.getParameter("sname");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String password=request.getParameter("passwrd");
		
		

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String qry = "insert into abc.bridgelab values(?,?,?,?,?)";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=manoj");

			preparedStatement = connection.prepareStatement(qry);

			preparedStatement.setString(1, fname);
			preparedStatement.setString(2, Sname);
			preparedStatement.setString(3,mobile);
			preparedStatement.setString(4,email);
			preparedStatement.setString(5,password);
			int i=preparedStatement.executeUpdate();
            if(i>0)
            {
                  RequestDispatcher requestDispatcher=request.getRequestDispatcher("SuccessfullyRegister.html");
                  requestDispatcher.forward(request, response);
            }
            else
            {
				printWriter.println("<html><body bgcolor='#169393'><h1>Sorry There Is Something Problems Occured!!! </h1></body></html>");

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
