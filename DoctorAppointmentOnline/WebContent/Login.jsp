<!-- This page will implement the logic for logging-in, an already registered doctor On Screen 2-->

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%	
	String userName= request.getParameter("uname");
	String passWord= request.getParameter("upass");
		
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","Agg560037KA");
	Statement st= conn.createStatement();
	
	ResultSet rs;
	rs= st.executeQuery("select * from doctor where username='"+userName+"'and password='"+passWord+"'");
	
	if(rs.next()){
		session.setAttribute("username", userName);
		
//		ADD NAME FOR SCREEN 3 HERE
		
		response.sendRedirect("SCREEN3"); 
	}
	else{
		session.invalidate();
        request.setAttribute("invalid", "Invalid Credentials");
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
	}
%>
