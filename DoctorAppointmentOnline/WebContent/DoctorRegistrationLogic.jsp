<!-- This page will implement the logic for logging-in, an already registered doctor On Screen 2-->

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%	

// 	Get Name, username and password and store in local variables.
	String name=request.getParameter("name");
	String userName= request.getParameter("uname");
	String passWord= request.getParameter("upass");
	
// 	Start a MySQL connection and create a statement
	Class.forName("com.mysql.cj.jdbc.Driver");

//	Enter your own SQL workbench Password here
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","SQL PASSWORD HERE");
	Statement st= conn.createStatement();
	
// 	Get the count of the doctors with the same username
	String strQuery = "SELECT COUNT(*) FROM doctor where username='"+userName+"'";
	ResultSet rs = st.executeQuery(strQuery);
	
	rs.next();
	String Countrow = rs.getString(1);
	
// 	If the count is 0 then register the doctor
	if(Countrow.equals("0")){
		int i=st.executeUpdate("insert into Doctor(name,username,password)values('"+name+"','"+userName+"','"+passWord+"')");

		if(i>0){
			request.setAttribute("success", "Thanks for registering ");
			request.setAttribute("dname", name);
			RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
	        rd.forward(request, response);
		}
	}

// 	If the username already exists then display the Username already present message
	else{
		request.setAttribute("duplicate", "Username already exists.");
		RequestDispatcher rd = request.getRequestDispatcher("/DoctorRegistration.jsp");
        rd.forward(request, response);
	}
	
%>
