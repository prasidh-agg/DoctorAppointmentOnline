<!-- After the doctor enters the credentials for registration, a connection is created 
to the database. If the username already exists, a notification is displayed saying
 'Username already exists' else the details are successfully saved and the notification saying
 'Thanks for registering' is displayed.-->

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%	
	String name=request.getParameter("name");
	String userName= request.getParameter("uname");
	String passWord= request.getParameter("upass");
		
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","password");
	Statement st= conn.createStatement();
	
	String strQuery = "SELECT COUNT(*) FROM doctor where username='"+userName+"'";
	ResultSet rs = st.executeQuery(strQuery);
	
	rs.next();
	String Countrow = rs.getString(1);
	
	if(Countrow.equals("0")){
		int i=st.executeUpdate("insert into Doctor(name,username,password values('"+name+"','"+userName+"','"+passWord+"')");

		if(i>0){
			request.setAttribute("success", "Thanks for registering ");
			request.setAttribute("dname", name);
			RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
	        rd.forward(request, response);
		}
	}
	else{
		request.setAttribute("duplicate", "Username already exists.");
		RequestDispatcher rd = request.getRequestDispatcher("/DoctorRegistration.jsp");
        rd.forward(request, response);
	}
	
%>
