<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments List</title>

<script>
	window.onload = function(){
	    defaultDate()
	};
	
	function defaultDate()
	{
	console.log("load event detected!");
	var today = new Date();
	document.getElementById("appdate").value = [ today.getFullYear(), today.getMonth()+1, today.getDate(),].join('-');
	}
</script>


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
		height: 60vh;
		align-items: center;
		flex-direction: column;
		justify-content: space-between;
	}
	#head{
		background-color: #6D326D;
		width: 100vw;
		text-align: center;
		padding: 10px;
		height: 10vh;
		display: flex;
		align-items: center;
		justify-content: space-around;
	}
	table, tr,td{
		border: solid 1px #6D326D;
		padding: 5px;
		text-align: center;
	}
	table{
		border-radius: 10px;
	}
	tr,td{
		border-radius: 5px;
	}
	.header{
		background-color: #6D326D;
		font-size: 1.2rem;
	}
	table td{
		background-color:#003F91;
	}
	input{
		margin: 10px 0;
		border-radius: 5px;
		border: none;
		height: 30px;
		padding: 5px;
	}
	
	input:focus{
		outline-color: #6D326D;
	}
	input[type="submit"]{
		background-color: #6D326D;
		color: #fff;
	}
	input[type="submit"]:hover{
		transform: scale(1.06);
		transition: transform 0.2s;
		backface-visibility: hidden;
	}
	a{
		color: #fff;
		text-align: right;
		font-size: 1.15rem;
	}
	a:hover{
		text-decoration:none;
	}
</style>

</head>
	<body>
		<div id="head">
			<h1>Appointment List</h1>
			<a href="HomePage.jsp">Logout</a>
		</div>
		<form action="AppointmentsList.jsp" method="post" id="date-form" name="date-form">
			<input type="date" name="appdate" id="appdate">
			<input type="submit" value="Search">
		</form>
		
		<table>
			<tr>
				<td class="header">Patient Name</td>
				<td class="header">Contact No.</td>
				<td class="header">Appointment Date</td>
			</tr>
	<%
	try{
		
		String getDate = request.getParameter("appdate");
		String userName= session.getAttribute("username").toString();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","Agg560037KA");
		Statement st= conn.createStatement();
		
		ResultSet rs;
		rs=st.executeQuery("select name from doctor where username='"+userName+"'");
		
		while(rs.next()){
			String dname= rs.getString("name");
			ResultSet rs2;
			rs.close();
			
			//check if getDate is null or if form hasnt been submitted yet.
			if(getDate==null){
				
				//get string of current date
				DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDateTime now = LocalDateTime.now();
				String formattedDate = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				
				//convert current date from java to sql
				Date date2=new SimpleDateFormat("yyyy-MM-dd").parse(formattedDate);
				java.sql.Date defDate= new java.sql.Date(date2.getTime());
				
				//execute query for current date
				rs2=st.executeQuery("select * from patient where doctorname='"+dname+"' and adate='"+defDate+"'");
			}
			else{
				Date date=new SimpleDateFormat("yyyy-MM-dd").parse(getDate);
				java.sql.Date sqlDate= new java.sql.Date(date.getTime());
				rs2=st.executeQuery("select * from patient where doctorname='"+dname+"' and adate='"+sqlDate+"'");
			}
			
			while(rs2.next()){
			%>
				<tr>
					<td><%=rs2.getString("name") %></td>
					<td><%=rs2.getString("mobilenumber") %></td>
					<td><%=rs2.getString("adate") %></td>
				</tr>
			<%
			}
			conn.close();
			rs2.close();
			rs.close();	
		}
	}
		catch (Exception e) {
			return;
			}
			%>
	
</table>	
</body>


</html>










