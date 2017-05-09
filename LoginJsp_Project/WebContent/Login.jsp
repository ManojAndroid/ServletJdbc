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
	background-color:white ;
}

::-webkit-input-placeholder {
	font-size: 16px;
	text-align: center;
	font-weight: bold;
}

.div {
	align: center;
	border: 1px solid white;
	width: 450px;
	height: 320px;
	margin-left: 400px;
	align: center;
	background-color: white;
	box-shadow: 5px 5px 5px 5px;
}
input
{
width: 315px;
 height: 40px;

}
form{
border: 1px solid white;
background-color:white;
padding-top: 10px;
height: 220px;
width: 418px
}
</style>
<script type="text/javascript">

function ValidateEmail()  
{  
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
var email=document.getElementById("eid").value;
var pass=document.getElementById("passid").value;
if(!email.match(mailformat))  
{  
	alert("Enter valid email address!");  
	return false;
} 
if(pass.length==" ")
	{
	alert("Enter Password!");  
	return false;
	}
else  
{  
return true; 
}  
}  

</script>
<body >
<jsp:include page="Header.jsp" />
	<div class="div" align="center" style="">
		<label><h3>
				<u>Welcome To Login Page</u>
			</h3></label>
		<form method="post">

			<label><input type="email" name="Email" id="eid" placeholder="Enter Email" ></label>
			<br> <br> 
			<label> <input type="password" id="passid" name="Password" placeholder="Enter Password"></label> 
			<br> <br><br> 
			<input type="submit" class="btn btn-info" onclick=" return ValidateEmail()" formaction="LoginToFormjspServlet" value="Login"
			 style="width:300px; height: 45px">
			
		</form>

	</div>

</body>
</html>