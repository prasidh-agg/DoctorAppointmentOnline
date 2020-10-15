<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String patientName=request.getParameter("name");
String patientNumber=request.getParameter("num");



Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient", "root", "Agg560037KA");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into Patient(name,Mobilenumber)values('"+patientName+"','"+patientNumber+"')");

if(i>0){
	session.setAttribute("patientName", patientName);
	request.setAttribute("patientname",patientName);
    RequestDispatcher rd = request.getRequestDispatcher("/PatientAppointment.jsp");
    rd.forward(request, response);
	response.sendRedirect("PatientAppointment.jsp"); 
}


%>