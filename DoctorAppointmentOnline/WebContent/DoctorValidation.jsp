<!-- After the doctor enters the credentials, the credentials are verified
by connecting to the database. If the credentials are correct, the doctor is redirected 
to the appointment list, otherwise, the doctor gets a notification of 'Invalid Credentials' -->

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%	
	String userName= request.getParameter("uname");
	String passWord= request.getParameter("upass");
	String pass = passWord;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","password");
	Statement st= conn.createStatement();
	
	ResultSet rs;
	rs= st.executeQuery("select * from doctor where username='"+userName+"'and password='"+pass+"'");
	
	if(rs.next()){
		
		session.setAttribute("username", userName);
		response.sendRedirect("AppointmentsList.jsp"); 
	}
	else{
		session.invalidate();
        request.setAttribute("invalid", "Invalid Credentials");
        RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
        rd.forward(request, response);
	}
	rs.close();
	conn.close();
%>
