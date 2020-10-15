<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String doctorName=request.getParameter("dname");
String ddate=request.getParameter("appdate");

SimpleDateFormat sdf=new SimpleDateFormat("dd/mm/yyyy");
Date adate=sdf.parse(ddate);
java.sql.Date sqlDate= new java.sql.Date(adate.getTime());

String patientName= request.getParameter("patientName");


Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient", "root", "Agg560037KA");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into Patient(doctorname,Adate)values('"+doctorName+"','"+sqlDate+"') where name='"+patientName+"'");

if(i>0){
	session.setAttribute("doctorName", doctorName);
	response.sendRedirect("HomePage.jsp"); 
}


%>