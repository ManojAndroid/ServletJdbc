<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
form {
	background-color:#e3f2fd;
	border:1px solid black;
	margin-bottom: 20px;
	
}
</style>
<script type="text/javascript">
	function ValidateEmail() {
		var id = document.getElementById("id").value;
		var firstname = document.getElementById("fnname").value;
		 var lname = document.getElementById("lname").value;
		 var address = document.getElementById("addr").value;
		 /*var Fage = document.getElementById("fage").value;
	var language = document.getElementById("lan").value;
		 */

		 if (id.length != 4) {
				alert("Enter  four digit id only!!!");
				return false;
			}
		if (firstname.length == " " || firstname == null
				|| firstname.length <= 3) {
			alert("Enter FirstName Length should be more than three characters!");
			return false;
		 }
		if (lname.length == " " || lname == null || firstname.length <= 3) {
			alert("Enter LastName Length should be more than three characters!!");
			return false;
		}
		
		if (Fage == 0 || Fage.length == null) {
			alert("Select Age!!!");
			return false;
		}
		if (language == 0 || language.length == null) {
			alert("Select Language!!!");
			return false;
		}

		if (document.reg.gender[0].checked == false
				&& document.reg.gender[1].checked == false) {
			alert("Select Your Gender!!!");
			return false;
		}
		
		if (document.reg.generalized[0].checked == false
				&& document.reg.generalized[1].checked == false
				&& document.reg.generalized[2].checked == false) {
			alert("Select specialize skills!!!");
			return false;
		}
		if (address.length == " " || address.length == null) {
			alert("Enter Full Address!!!");
			return false;
		}  

		else {
			return true;
		}
	}
</script>

<body bgcolor="#e3f2fd">
	<jsp:include page="Header.jsp" />
	<%
		if (session.getAttribute("fpassword") != null) {
	%>
<center>
	<form action ="RegistrationLoginUserServlet" method="post" name="reg"
		style="background-color: #ffe6e6; width: 50%;align=""">


		<table align="center">
			<tr>
				<h3>Register New Employee Details</h3>
			</tr>
			<tr>
				<th>Enter Id :</th>
				<td><input type="text" id="id" name="id" placeholder="Enter id" style="width: 272px;height: 37px"><br><br></td>
			</tr>

			<tr>
				<th>Enter FirstName :</th>
				<td><input type="text" name="fname" id="fnname" placeholder="Enter FirstName" style="width: 272px;height: 37px"><br>
				<br></td>
			</tr>

			<tr>
				<th>Enter LastName :</th>
				<td><input type="text" id="lname" name="sname" placeholder="Enter  LastName" style="width: 270px;height: 37px"><br>
				<br>
				<br>
				<br></td>
			</tr>


			<tr>
				<th>Select Age:</th>
				<td><select name="age" id="fage " style="width: 82px; ">
						<option value="0">Select</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
				</select> Select Lang: <select name="lang" id="lan" style="width: 105px; ">
						<option value="none">Select</option>
						<option value="Hindi">Hindi</option>
						<option value="English">English</option>
						<option value="Marathi">Marathi</option>
						<option value="Bhojpuri">Bhojpuri</option>
						<option value="Kannad">Kannad</option>
						<option value="Tamil">Tamil</option>
				</select><br>
				<br>
				<br>
				<br></td>
			</tr>
			<tr>
				<th>Select Gender:</th>
				<td><input type="radio" name="gender" value="male">Male
					<input type="radio" name="gender" value="female"> Female <input
					type="radio" name="gender" value="other "> Other<br>
				<br>
				<br>
				<br></td>
			</tr>

			<tr>
				<th>Select Specialized:</th>
				<td><input type="checkbox" name="generalized" value="Java ">
					java <input type="checkbox" name="generalized" value="html ">
					HTML <input type="checkbox" name="generalized" value="Css ">
					CSS<br>
				<br>
				<br>
				<br></td>
			</tr>
			<tr>
				<th>Enter Full Address</th>
				<td><textarea rows="4" cols="30" id="addr" name="address" style="width: 282px;"></textarea><br>
				<br>
				<br></td>
			</tr>


			<tr>
				<td><input type="submit" class="btn btn-success" value="Submit" onclick="return ValidateEmail()"
					style="width: 310px; height: 45px;margin-bottom: 20px;"></td>
					
					<td><input type="reset" class="btn btn-info" value="Reset" 	style="width: 310px; height: 45px;margin-bottom: 20px;"></td>
			</tr>


		</table>

	</form>
</center>
	<%
		}
	%>
</body>
</html>