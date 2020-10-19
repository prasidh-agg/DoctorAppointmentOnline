<!-- The credentials entered by the patient are saved the patient is redirected 
to the appointment booking page.  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

// Get Patient name and mobile from the patient booking form
String patientName = request.getParameter("name");
String patientNumber = request.getParameter("num");

// Create session attributes to retrieve in the PatientDoctorNameDate page later
session.setAttribute("patientName", patientName);
session.setAttribute("patientNumber", patientNumber);

// Dispatch the request to the Patient appointment page
RequestDispatcher rd = request.getRequestDispatcher("/PatientAppointment.jsp");
rd.forward(request, response);

%>