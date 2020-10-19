<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Appointment</title>

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
	
	form input, select{
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
	form input[type="text"]::placeholder, form input[type="date"]::placeholder{
		text-align:center;
	}
	#error{
		color: #5DA9E9;
		margin-top: 0px;
	}
	
	form input:focus::-webkit-input-placeholder { /* Chrome/Opera/Safari */
  		color: transparent;
	}
	
</style>
</head>
<body>
<!-- The connection to the database is created to get the list of doctors. -->
	<%
// 		Start Mysql database connection and statement creater
	    try{
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	
// 	    	Enter your own SQL password here
	    	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","SQL PASSWORD");
	    	Statement st= conn.createStatement();
	    
// 	    	Create a result set to retrieve data
	    	ResultSet rs;
	    	rs= st.executeQuery("select name from doctor");
	%>
		

<!-- This form is created for the patient to book the appointment. The fields to be selected
include doctor name and date. -->
	<form action="PatientDoctorNameDate.jsp" method="post">
		<h2>Book Appointment</h2>
		<label for="dname">Doctor Name</label>
		<select name="dname" id="dname">
			<%  while(rs.next()){ %>
            <option><%= rs.getString(1)%></option>
        <% } %>
		</select>
	<%
        }
        catch(Exception e)
        {
             out.println("Wrong Entry"+e);
        }
	%>		
		<label for="date">Enter date</label>
		<input type="date" id="formdate" name="date">
		<input type="submit" value="Book">
	</form>
</body>
</html>
