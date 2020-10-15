<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HomePage</title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500&display=swap');

	*{
		box-sizing: border-box;
		font-family: 'Ubuntu', sans-serif;
	}
	
	body{
		background-color: #5DA9E9;
		color: #fff;
		display: flex;
		height: 100vh;
		align-items: center;
		justify-content: space-between;
	}
	form{
		background-color: #003F91;
		border-radius: 10px;
		padding: 50px;
		margin: auto;
		display: flex;
		flex-direction: column;
		font-family: inherit;
		max-width: 40vw;
	}
	
	form h2{
		text-align: center;
		margin-bottom: 30px;
	}
	
	form label{
		font-size: 1.2rem;
	}
	
	form input{
		margin: 10px 0;
		border-radius: 5px;
		border: none;
		height: 30px;
	}
	
	form input:focus{
		outline-color: #6D326D;
	}
	form input[type="submit"]{
		background-color: #6D326D;
		color: #fff;
	}
	form input[type="submit"]:hover{
		transform: scale(1.06);
		transition: transform 0.2s;
		backface-visibility: hidden;
	}
	form input[type="text"]::placeholder, form input[type="date"]::placeholder{
		text-align:center;
	}
	#error{
		color: #5DA9E9;
		margin-top: 0px;
	}
	
	form input:focus::-webkit-input-placeholder { /* Chrome/Opera/Safari */
  		color: transparent;
	}
	
</style>

</head>
<body>
	<form action="PatientDoctorNameDate.jsp" method="post">
		<h2>Book Appointment</h2>
		
		<label for="dname">Doctor's name</label>
		<input type="text" id="dname" name="dname" placeholder="Enter Doctor's Name" autocomplete="off">
		<label for="upass">Enter date</label>
		<input type="text" id="appdate" name="date" placeholder="Enter date as dd/mm/yyyy">
		
		<input type="submit" value="Book">
		
	</form>
	
	
</body>
</html>
