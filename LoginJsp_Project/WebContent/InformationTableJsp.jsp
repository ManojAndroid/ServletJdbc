<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
var userid;
	var get = function(id, fname, sname, age, language, gender, skill, address) {
		userid=id;
		$("#uid").val(userid);
		$("#id").val(id);
		$("#fname").val(fname);
		$("#sname").val(sname);
		$("#age").val(age);
		$("#language").val(language);
		$("#gender").val(gender);
		$("#skill").val(skill);
		$("#address").val(address);
		

	}
</script>
<style type="text/css">
.inputs {
	background-color: #ffe6e6;
	padding: 5px;
	width:100%;
	border: none;
}
#try{
	padding: 55px;
    width: 66%;
    height: 150px;
    margin-top: 33%;
    margin-left: 10%;
}
#ok,#cancel{
	height: 49px;
    width: 100px;
    margin-left: 31px;

}
p{
   padding-left: 35px;
}
</style>
</head>
<body>
<jsp:include page="Header.jsp" />
	  <% ResultSet rs = (ResultSet) session.getAttribute("data");%>
<div class="container">
		<table class="table" align="center" style="width: 52%; border: 2px solid black">
			<tr>
				<td colspan="2" style="background-color: cyan; padding: 10px; border: 2px solid black;">Employees Information</td>
			</tr>
			<tr style="background-color: #e3f2fd; padding: 10px; border: 2px solid black;">
				<th style="background-color: #e3f2fd; padding: 10px; border: 2px solid black;">Employees Id</th>
				<th style="background-color: #e3f2fd; padding: 10px; border: 2px solid black;">Employees Name</th>
			</tr>

			<%
				int i = 0;
				while (rs.next()) {
			%>
			<tr id="dont"
				onclick="get('<%=rs.getString(9)%> ','<%=rs.getString(1)%> ','<%=rs.getString(2)%> ',' <%=rs.getString(3)%>','<%=rs.getString(4)%> ','<%=rs.getString(5)%> ',' <%=rs.getString(6)%> ',' <%=rs.getString(7)%>')"
				style="background-color: #e3f2fd; padding: 10px; border: 2px solid black;">

				<td style="background-color: #ffe6e6; padding: 10px;">
				<p id="data" data-toggle="modal" data-target="#myModal"><%=rs.getString(9)%></p></td>



				<td style="background-color: #ffe6e6; padding: 10px;">
				<p data-toggle="modal" data-target="#myModal"><%=rs.getString(1)%></p></td>
				<%
					}
				%>
			</tr>
		</table>
	</div>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" style="width:90%">
				 <div class="modal-header" style="background-color:#e3f2fd ">
					<button class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit Your information</h4>
				 </div>
				<div class="modal-body">
					<div style="min-height: 30px; outline: none">
					 <table>
						<form action="UpdateServlet" method="post">
							<tr><th>ID: </th> 
						       <td><input type="text" id="id" name="id" class="inputs" readonly="readonly"><br><br></td></tr>
							
							<tr><tH>FirstName</tH>
							  <td><input type="text" id="fname" name="fname" class="inputs" ><br> <br></td></tr>
						   
						    <tr><tH>LastNmae</tH>
							<td> <input type="text"id="sname" name="sname" class="inputs"> <br><br></td> </tr>
						   
						    <tr><tH>Age</tH>
							  <td> <input type="text" id="age" name="age" class="inputs" ><br> <br></td></tr>
							
							<tr><tH>Language</tH>
						    <td><input type="text" id="language"  name="language"  class="inputs"> <br><br></td></tr>
							
							<tr><tH>Gender</tH>
							<td> <input type="text" id="gender" name="gender" class="inputs"> <br><br></td></tr>
							
							 <tr><tH>Skill</tH>
							 <td> <input type="text" id="skill" name="skill"  class="inputs"><br> <br></td></tr>
							
							 <tr><tH>Address</th>
							 <td><input type="text" id="address" name="address" class="inputs"><br><br></td></tr>
						  
						    <tr><td><input type="submit" value="Edit Info" class="btn btn-info"style="width:250px;  height: 49px;"></td>
							<td><input  data-toggle="modal" data-target="#demo" type="button" value="Delete" class="btn btn-danger"style="width:250px; height: 49px;margin-left: 15px;"></td></tr>
						</form>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="demo" role="dialog">
		<div class="modal-dialog">
		<div id="try" class="modal-content">
		     <p>Are you sure You want to delete ?</p>
		     <form action="delete" method="post">
		         <input type="hidden" id="uid" name="uid" class="inputs">
			     <input type="submit" class="btn btn-danger" id="ok" name="ok" value="OK"/>
			     <input  type="button" class="btn btn-info" data-dismiss="modal"id="cancel"value="Cancel"/>
		   </form>
	   </div>
	 </div>
  </div>
</body>
</html>