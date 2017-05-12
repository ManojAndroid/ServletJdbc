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
.div {
	width: 500px;
	background-color:white;
	height: 700px;
	border:1px solid 	white;
	margin-left: 400px;
	margin-top:5px;
	background-color:white;
	margin-bottom: 5px;
	box-shadow: 5px 5px 5px 5px;

}
form{
border: 1px solid white;
background-color:white;
padding-top: 10px;
width: 480px;
height:620px;
}
</style>
<script type="text/javascript">
	function ValidateEmail() {
		var firstname = document.getElementById("fnname").value;
		var lname = document.getElementById("lname").value;
		var address = document.getElementById("addr").value;
		var Fage = document.getElementById("fage").value;
		var language = document.getElementById("lan").value;
		var id = document.getElementById("id").value;

		
		if (firstname.length == " " || firstname == null||firstname.length<=3) {
			alert("Enter FirstName Length should be more than three characters!");
			return false;
		}
		if (lname.length == " " || lname == null||firstname.length<=3) {
			alert("Enter LastName Length should be more than three characters!!");
			return false;
		} 
		if (id.length!=4) {
			alert("Enter  four digit id only!!!");
			return false;
		} 
		if (Fage== 0 || Fage.length == null) {
			alert("Select Age!!!");
			return false;
		} 
		if (language ==0 || language.length == null) {
			alert("Select Language!!!");
			return false;
		} 
		
		 if (document.reg.gender[0].checked==false&&document.reg.gender[1].checked==false) {
			alert("Select Your Gender!!!");
			return false;
		} 
		
		 if (document.reg.generalized[0].checked==false&&document.reg.generalized[1].checked==false&&document.reg.generalized[2].checked==false) {
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
<body >
<jsp:include page="Header.jsp" />
 <%if(session.getAttribute("fpassword")!=null){%>
<div class="div" align="center">
<center><h4><u></font color="white">Register New Employee</font></u></h4></center>
<form action="RegistrationLoginUserServlet" method="post" name="reg" >
		<label>	Enter FirstName :
			<input type="text" name="fname" id="fnname" placeholder="Enter FirstName" style="width: 255px; height: 37px"></label>
			<br><br> 
			<label>	Enter LastName :
			<input type="text" id="lname" name="sname" placeholder="Enter  LastName" style="width: 255px; height: 37px "></label><br>
			<br>
		<label>	Enter Id :
			<input type="text" id="id" name="id" placeholder="Enter id" style="width: 255px; height: 37px "></label><br>
			<br>
			<label> Select Age: 
			        <select name="age" id="fage" style="width: 86px; ">
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
			</select></label>
			
	       <label> Select Lang:
		    <select name="lang" id="lan" style="width: 93px; ">
				    <option value="none">    Select  </option>
					<option value="Hindi">   Hindi   </option>
					<option value="English"> English </option>
					<option value="Marathi"> Marathi </option>
					<option value="Bhojpuri">Bhojpuri</option>
					<option value="Kannad">  Kannad  </option>
					<option value="Tamil">   Tamil   </option>
			</select></label>
			
			<br><br><br>
		<label> Select Gender: 
			 <input type="radio" name="gender" value="male" style="width: 41px; ">Male
             <input type="radio" name="gender" value="female" style="width: 36px; "> Female
             <input type="radio" name="gender" value="other" style="width: 38px; "> Other
			</label>
		
			 <br> <br>
			<br> 
		<label>	Select Specialized:
			<input type="checkbox" name="generalized" value="Java" style="width: 39px; height: 23px; "> java
			 <input type="checkbox" name="generalized" value="html" style="width:  40px; height: 23px; "> HTML 
			<input type="checkbox" name="generalized" value="Css" style="width:  40px; height: 23px; "> CSS
			</label>
			 <br> <br><br>
			<label> Enter Full Address</label>
			<center> <textarea rows="4" cols="30" id="addr" name="address" t="" style="width:350px; height: 92px"></textarea><br>  
		
			<br>
			<br>
			
			<input type="submit" class="btn btn-success" value="Submit" onclick="return ValidateEmail()" style="width:350px; height:45px;">
		</center>
	</form>
</div>
 <% }%>
</body>
</html>