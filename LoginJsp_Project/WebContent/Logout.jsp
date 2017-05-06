<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.div1{
width:100%;
height:50px;
background-color:  #3d3938 ;
}
.div2{
height:50px;
width:100px;
background-color: #3d3938;
border:1px solid balck;
float: right;

}

</style>
<body>
<div class="div1">
<div class="div2">
<center>
<!-- <button formtarget="LogoutServlet"  style="width:100px; height:50px">Logout</button>
 -->
 <form action="LogoutServlet" method="get">
 
 <input type="submit" value="Logout">
 
 </form>
 
</center>
</div>
</div>
</body>
</html>