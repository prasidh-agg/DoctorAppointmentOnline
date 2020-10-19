<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

// Get Doctor name and appointment date from patient booking form
String doctorName = request.getParameter("dname");
String getDate = request.getParameter("date");

// Get the appointment date and parse it for the required format
Date date=new SimpleDateFormat("yyyy-MM-dd").parse(getDate);

// Convert the Java Util date into Java SQL date
java.sql.Date sqlDate= new java.sql.Date(date.getTime());

// Convert the patient Name and Number coming back from Patient booking form session
String patientName= session.getAttribute("patientName").toString();
String patientNumber= session.getAttribute("patientNumber").toString();

// Start the database  local connection
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient", "root", "Agg560037KA");
Statement st=conn.createStatement();

// Insert the doctor into the doctor table with the entered details
int i=st.executeUpdate("insert into Patient(doctorname,name,mobilenumber,adate)values('"+doctorName+"','"+patientName+"','"+patientNumber+"','"+sqlDate+"')");

if(i>0){
    session.invalidate();
	request.setAttribute("booked", "Thanks for booking the appointment with ");
	request.setAttribute("dname", doctorName);
	RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
    rd.forward(request, response);
    }
%>
