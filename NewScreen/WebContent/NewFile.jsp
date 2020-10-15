<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Doctor Registration</title>
<style>

    div.ex {
    background-color:fuchsia;
        text-align: centre;
        width: 300px;
        padding: 10px;
        border: 5px solid grey;
        margin: 0px
    }
</style>
</head>
<body>
<h1>New Doctor</h1>
<div class="ex">
<form action="reg-process.jsp" method="post">
			<table style="with: 50%">
				
				<tr>
					<td>UserName</td>
					<td><input type="text" name="uname" required /></td>
				</tr>
					<tr>
					<td>Password</td>
					<td><input type="password" name="pass" required/></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><input type="text" name="name" required /></td>
				</tr>
				</table>
				<%
			if(null!=request.getAttribute("invalid"))
		    {
		        out.println("<p id='error'></p>"+request.getAttribute("invalid"));
		    }
		%>
			<input type="submit" value="Submit" /></form>
			</div>
</body>
</html>