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
<h3>Profile</h3>
<%
String userMail=(String) session.getAttribute("userMail");
int userId = (int) session.getAttribute("userId");
int noOfChildren = 0;
ArrayList<String> childNames = new ArrayList<>();
ArrayList<Integer> childIds = new ArrayList<>();
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/poshanabhiyaan", "root", "root");
	PreparedStatement pstmt = con.prepareStatement("select * from child where parent=?");
	pstmt.setInt(1, userId);
	ResultSet rs = pstmt.executeQuery();
	while (rs.next()) {
		noOfChildren++;
		String cName = rs.getString("cName");
		childNames.add(cName);
		// session.setAttribute("cName", cName);
		int cId = rs.getInt("cId");
		childIds.add(cId);
		// session.setAttribute("cId", cId);
	}
	System.out.println("list: " + childIds);
	session.setAttribute("childNames", childNames);
	session.setAttribute("childIds", childIds);
	session.setAttribute("noOfChildren", noOfChildren);
	session.setAttribute("userId", userId);
} catch (Exception e) {
	e.printStackTrace();
}
for (int i = 0; i < noOfChildren; i++) {
	out.println("<form action='ChildDetails.jsp' method='get'>");
	//out.println("<h2>" + childNames.get(i) + "</h2>");
	out.println("<input type='submit' style=\"color: blanchedalmond; font-size: large; height: 100px; width: 150px; background-color: #0099cc; align-content: center\" name='childName' value='" + childNames.get(i) + "'> ");
	out.println("</form>");
}
%>
<br/><br/>
<h3>Add Children Here</h3>
<a href="addChild.jsp">Add Child</a>
</body>
</html>