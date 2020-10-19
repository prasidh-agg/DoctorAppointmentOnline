<!-- After the doctor enters the credentials, the credentials are verified
by connecting to the database. If the credentials are correct, the doctor is redirected 
to the appointment list, otherwise, the doctor gets a notification of 'Invalid Credentials' -->

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%	

// 	Get username and password of the doctor for validation
	String userName= request.getParameter("uname");
	String passWord= request.getParameter("upass");
	String pass = passWord;
	
// 	Start a connection and statement for the Mysql database
	Class.forName("com.mysql.cj.jdbc.Driver");
		
//	Enter your own SQL workbench Password here
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","SQL PASSWORD HERE");

	Statement st= conn.createStatement();
	
// 	Create a result set
	ResultSet rs;
	rs= st.executeQuery("select * from doctor where username='"+userName+"'and password='"+pass+"'");
	
// 	If credentials are valid, redirect to Appointment List page.
	if(rs.next()){
		
		session.setAttribute("username", userName);
		response.sendRedirect("AppointmentsList.jsp"); 
	}

// 	If invalid credentials then redirect back to home page.
	else{
		session.invalidate();
        request.setAttribute("invalid", "Invalid Credentials");
        RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
        rd.forward(request, response);
	}
	
// 	Close the result set and the connection
	rs.close();
	conn.close();
%>
