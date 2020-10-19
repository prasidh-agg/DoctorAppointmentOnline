<!-- The details mentioned by the patient to book the appointment are entered to
the database. -->

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String doctorName = request.getParameter("dname");
String getDate = request.getParameter("date");

Date date=new SimpleDateFormat("yyyy-MM-dd").parse(getDate);

java.sql.Date sqlDate= new java.sql.Date(date.getTime());

String patientName= session.getAttribute("patientName").toString();
String patientNumber= session.getAttribute("patientNumber").toString();

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient", "root", "password");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into Patient(doctorname,name,mobilenumber,adate)values('"+doctorName+"','"+patientName+"','"+patientNumber+"','"+sqlDate+"')");

if(i>0){
    session.invalidate();
	request.setAttribute("booked", "Thanks for booking the appointment with ");
	request.setAttribute("dname", doctorName);
	RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
    rd.forward(request, response);
    }

%>
