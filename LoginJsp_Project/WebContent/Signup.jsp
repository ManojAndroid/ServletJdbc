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
body {
	background-color:white;
}

::-webkit-input-placeholder {
	font-size: 16px;
	text-align: center;
	font-weight: bold;
}
form{
border: 1px solid white;
background-color:white;
padding-top: 10px;
padding-top: 5px;
height: 344px; 
width: 422px;
}

.div {
	align: center;
	border: 1px solid white;
	width: 450px;
	height: 450px;
	margin-left: 400px;
	align: center;
	background-color:white;
	box-shadow: 5px 5px 5px 5px;
}
input
{
width: 315px;
 height: 40px;

}
</style>
<script type="text/javascript">
	function ValidateEmail() {
		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var email = document.getElementById("eid").value;
		var pass = document.getElementById("passid").value;
		var firstname = document.getElementById("fname").value;
		var lname = document.getElementById("lname").value;
		if (firstname.length == " " || firstname == null||firstname.length<=3) {
			alert("Enter FirstName Length should be more than three characters!");
			return false;
		}
		if (lname.length == " " || lname == null||lname.length<=3) {
			alert("Enter LastName Length should be more than three characters!!");
			return false;
		} 
		if (!email.match(mailformat) || email == null) {
			alert("Enter valid email address!");
			return false;
		}
		if (pass.length == " " || pass == null||pass.length<=6) {
			alert("Enter Password Length should be more than three characters!!!");
			return false;
		}
		
		else {
			return true;
		}
	}
</script>
<body>
<jsp:include page="Header.jsp" />
	<div class="div" align="center">
		<label><h3>
				<u>USER SIGNUP PAGE</u>
			</h3></label>
		<form action="LoginServlet" method="post" onsubmit="return ValidateEmail()" >
			<label><input type="text" name="fname" id="fname"placeholder="Enter FirstName" 
				></label>
				<br><br>
			 <label> <input type="text" name="lname" id="lname"
				placeholder="Enter LastName"></label> 
				<br> <br> 
				<label><input type="email" name="Email" id="eid" placeholder="Enter Email"
				 ></label> <br> <br>
			<label> <input type="password" name="Password" id="passid" placeholder="Enter Password" ></label>
			 <br> <br>
			<br> <input type="submit" class="btn btn-success" value="Signup"
				style="width: 315px; height: 45px">

		</form>

	</div>

</body>
</html>