<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<String> cNames = (ArrayList) session.getAttribute("cNames");
		ArrayList<Integer> cIds = (ArrayList) session.getAttribute("cIds");
	%>
	<h2>
		Vaccination Information of
		<%
		out.println(request.getParameter("childName"));
	%>:
	</h2>
	<%
		try {
			java.sql.Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/poshanabhiyaan", "root", "root");
			String childName=request.getParameter("childName");
			int childId=0;
			for(int i=0;i<cNames.size();i++){
				String name=cNames.get(i);
				if(name.equals(childName)){
					childId=cIds.get(i);
				}
			}
				PreparedStatement pstmt = con.prepareStatement("select * from user where userId=?");
				pstmt.setInt(1, childId);
				ResultSet rs = pstmt.executeQuery();
		} catch (SQLException e) {
			out.println("SQLException caught: " + e.getMessage());
		}
	
	%>
</body>
</html>