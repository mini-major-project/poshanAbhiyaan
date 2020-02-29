<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<title>Poshan Abhiyaan</title>
<script>
	function logout() {
		location.href = "home.html";
	};
</script>
<style>
ul {
	list-style-type: none;
	overflow: hidden;
	background-color: rgb(80, 4, 80);
}
li {
	float: left;
}
li a {
	display: block;
	color: white;
	text-align: center;
	padding: 30px 30px;
	text-decoration: none;
}
* {
	box-sizing: border-box;
}
body {
	font-family: Arial, Helvetica, sans-serif;
}
/* Remove extra left and right margins, due to padding */
.row {
	margin: 0 -5px;
}
/* Responsive columns */
@media screen and (max-width: 600px) {
	.column {
		width: 100%;
		display: block;
		margin-bottom: 20px;
	}
}
/* Style the counter cards */
.center {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 50%;
}
.button {
	background-color: rgb(5, 80, 8);
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
* {
	box-sizing: border-box;
}
}
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}
.container {
	padding: 16px;
}
li.last {
	float: right !important;
}
</style>

</head>
<body>

	<ul>
		<li><a href="InfoHomePage.html">Home</a></li>
		<li><a href="UserHomePage.jsp">Track Your Records</a></li>
		<li><a href="pregnancy.html">About Pregnancy</a></li>
		<li><a href="child.html">About Child Care</a></li>
		<li><a href="profile.jsp"> My Profile</a></li>
		<li class="last"><a href="UserLogout">Logout</a></li>
		<!-- 	<li class="last"><a href="#">Logout</a></li>  -->
	</ul>

	<br />
	<br />
	<center>
		<h1>
			<%
				int noOfChildren = (Integer) session.getAttribute("noOfChildren");
				String isPreg = (String) session.getAttribute("isPregnant");
				if (noOfChildren == 0 && !isPreg.equals("true")) {
			%>
			<h2>
				Add your pregnancy detials or Add Children in <a href="profile.jsp">Profile
					Section</a>
			</h2>
			<br />
			<h2>To Know about Pregnancy and child care navigate</h2>
			<form action="pregnancy.html" method='get'>
				<input type="submit"
					style="margin-left: 100px; color: blanchedalmond; font-size: large; height: 100px; width: 250px; background-color: #99003d; align-content: center"
					name='PregnancyDetails' value="Pregnancy Details">
			</form>
			<br />
			<br />
			<form action="child.html" method='get'>
				<input type="submit"
					style="margin-left: 100px; color: blanchedalmond; font-size: large; height: 100px; width: 250px; background-color: #99003d; align-content: center"
					name='ChildDetails' value="Child Details">
			</form>
			<%
				} else if (session.getAttribute("noOfChildren")!=null && noOfChildren > 0) {
			%>
			<b>Children: Vaccination & Nutritions</b>
		</h1>
	</center>
	<%
		ArrayList<String> childNames = (ArrayList<String>) session.getAttribute("childNames");
			ArrayList<Integer> childIds = (ArrayList<Integer>) session.getAttribute("childIds");
			if (childNames != null && childIds != null)
				for (int i = 0; i < childNames.size(); i++) {
	%>
	<center>
		<br /> <br />
		<form action='ChildDetails.jsp' method='get'>

			<input type="submit"
				style="color: blanchedalmond; font-size: 30px; height: 120px; width: 300px; background-color: #cc0066; align-content: center"
				name="childName" value=" <%out.print(childNames.get(i));%> ">
		</form>
		<%
			}
			}
			if (isPreg.equals("true")) {
		%>
		<br/><br/>
		<h1>
		<b> Pregnancy: Vaccination & Nutritions </b>
		</h1>
	</center>
	<%
	String pregName=(String)session.getAttribute("pregName");
	String startDateOfPreg=(String) session.getAttribute("startDateOfPreg");
	%>
	<center>
		<br /> <br />
		<form action='PregnantDetails.jsp' method='get'>

			<input type="submit"
				style="color: blanchedalmond; font-size: 30px; height: 120px; width: 300px; background-color: #cc0066; align-content: center"
				name="pregName" value=" <%out.print(pregName);%> ">
		</form>
	<%
		}
	%>
	</center>
</body>
</html>