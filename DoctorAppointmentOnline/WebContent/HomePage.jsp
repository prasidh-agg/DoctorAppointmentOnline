<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HomePage</title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500&display=swap');

	*{
		box-sizing: border-box;
		font-family: 'Ubuntu', sans-serif;
	}
	
	body{
		background-color: #5DA9E9;
		color: #fff;
		display: flex;
		height: 100vh;
		align-items: center;
		justify-content: space-between;
	}
	form{
		background-color: #003F91;
		border-radius: 10px;
		padding: 50px;
		margin: auto;
		display: flex;
		flex-direction: column;
		font-family: inherit;
		max-width: 40vw;
		
	}
	
	form h2{
		text-align: center;
		margin-bottom: 30px;
	}
	
	form label{
		font-size: 1.2rem;
	}
	
	form input{
		margin: 10px 0;
		border-radius: 5px;
		border: none;
		height: 30px;
	}
	
	form input:focus{
		outline-color: #6D326D;
	}
	form input[type="submit"]{
		background-color: #6D326D;
		color: #fff;
	}
	form input[type="submit"]:hover{
		transform: scale(1.06);
		transition: transform 0.2s;
		backface-visibility: hidden;
	}
	form input[type="text"]::placeholder, form input[type="password"]::placeholder{
		text-align:center;
	}
	#error, #register-success, #booked{
		color: #5DA9E9;
		margin-top: 0px;
	}
	form a{
		color: #fff;
		text-align: right;
	}
	form a:hover{
		text-decoration:none;
	}
	form input:focus::-webkit-input-placeholder { /* Chrome/Opera/Safari */
  		color: transparent;
	}
	
</style>

</head>
<body>
	
	<form action="DoctorValidation.jsp" method="post">
		<h2>Doctor's Login</h2>
		
		<label for="uname">Username</label>
		<input type="text" id="uname" name="uname" placeholder="Enter your User Name" autocomplete="off">
		<label for="upass">Password</label>
		<input type="password" id="upass" name="upass" placeholder="Enter your Password" autocomplete="off">
		<%
			if(null!=request.getAttribute("invalid"))
		    {
		        out.println("<p id='error'></p>"+request.getAttribute("invalid"));
		    }
		%>
		
		<input type="submit" value="Login">
		<a href="DoctorRegistration.jsp">Register</a>  
		<%
			if(null!=request.getAttribute("success"))
		    {
		        out.println("<p id='register-success'></p>"+request.getAttribute("success")+request.getAttribute("dname")+".");
		    }
		%>
		
	</form>
	
	<form action="PatientNameMobile.jsp" method="post"> 
		<h2>Patient's Login</h2>
		
		<label for="name">Name</label>
		<input type="text" id="name" name="name" placeholder="Enter your Name" autocomplete="off" required>
		<label for="num">Mobile No.</label>
		<input type="text" id="num" name="num" placeholder="Enter your Number" autocomplete="off" required>
		
		<%
			if(null!=request.getAttribute("booked"))
		    {
		        out.println("<p id='booked'></p>"+request.getAttribute("booked")+request.getAttribute("dname")+".");
		    }
		%>
		
		<input type="submit" value="Proceed">
	</form>
</body>
</html>