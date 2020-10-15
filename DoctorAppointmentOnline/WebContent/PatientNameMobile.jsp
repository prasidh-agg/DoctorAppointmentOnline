<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

String patientName = request.getParameter("name");
String patientNumber = request.getParameter("num");

session.setAttribute("patientName", patientName);
session.setAttribute("patientNumber", patientNumber);

RequestDispatcher rd = request.getRequestDispatcher("/PatientAppointment.jsp");
rd.forward(request, response);

%>