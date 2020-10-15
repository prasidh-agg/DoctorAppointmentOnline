<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String doctorName=request.getParameter("dname");

String ddate=request.getParameter("formdate");
SimpleDateFormat sdf=new SimpleDateFormat("mm/dd/yyyy");

Date adate= sdf.parse(ddate);
java.sql.Date sqlDate= new java.sql.Date(adate.getTime());

String patientName= session.getAttribute("patientName").toString();
String patientNumber= session.getAttribute("patientNumber").toString();

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient", "root", "Agg560037KA");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into Patient(doctorname,name,mobilenumber,adate)values('"+doctorName+"','"+patientName+"','"+patientNumber+"','"+sqlDate+"')");

if(i>0){
	session.setAttribute("doctorName", doctorName);
	response.sendRedirect("HomePage.jsp"); 
}


%>