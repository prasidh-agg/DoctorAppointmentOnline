<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String name = request.getParameter("name");

    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/xyz",
            "root", "Sonak@98765");
    
    Statement st = con.createStatement();
    ResultSet rs;
	rs= st.executeQuery("select * from Doctor where uname='"+user+"'");
	
	if(rs.next()){
		 
		session.invalidate();
        request.setAttribute("invalid", "UserName Already Exists!");
        RequestDispatcher rd = request.getRequestDispatcher("NewFile.jsp");
        rd.forward(request, response);
	}
	else{
       
    int i = st.executeUpdate("insert into Doctor(name,uname, pass) values ('" + name + "','" + user + "','" + pwd + "')");
    
       // session.setAttribute("uname", user);
        response.sendRedirect("https://www.google.com");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    }
%>


    