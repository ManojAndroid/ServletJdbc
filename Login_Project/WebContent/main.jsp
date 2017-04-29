<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.body {
	border: 5px solid #169393;
	background-color: #169393;
	background-image: url("");
}

.div {
	width: 465px;
	height: 465px;
	background-color: #89c389;
	margin-left: 30%;
	margin-top: 20px;
	background-image: url("img/slide-bg-2.jpg");
}

.div1 {
	width: 321px;
	height: 350px;
	padding-left: 100px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body class="body">

	<div class="div">
		<div class="div1">
			
						<h1><%= "Welcome"+request.getParameter("uname")+" "+request.getParameter("uname")%></h1>
			
			
		</div>
		<center>
			<label> <a href="ViewServlet">
					<button style="width: 140px; height: 50px; border-color: #89c389">
						<big>View</big>
					</button>
			</a></label> <!-- <label> <a href=""><button
						style="width: 104px; height: 50px; border-color: #89c389">
						<big>Update</big>
					</button></a></label> --> <label> <a href="DeleteServlet"><button
						style="width: 140px; height: 50px; border-color: #89c389">
						<big>Delete</big>
					</button> </a></label>
					
					<label> <a href="index.html"><button
						style="width: 140px; height: 50px; border-color: #89c389">
						<big>Logout</big>
					</button> </a></label>

		</center>
	</div>

	</form>

</body>
</html>