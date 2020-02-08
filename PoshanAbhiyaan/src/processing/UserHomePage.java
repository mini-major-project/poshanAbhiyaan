package processing;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserHomePage
 */
@WebServlet("/UserHomePage")
public class UserHomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserHomePage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String userMail = (String) session.getAttribute("userMail");
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

		out.println("<html><head>\r\n" + 
				"<meta charset=\"ISO-8859-1\">\r\n" + 
				"<title>Insert title here</title>\r\n" + 
				"<meta charset=\"UTF-8\">\r\n" + 
				"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
				"<meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n" + 
				"<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n" + 
				"<script src='https://kit.fontawesome.com/a076d05399.js'></script>\r\n" + 
				"<title>Document</title>\r\n" + 
				"<style>\r\n" + 
				"ul {\r\n" + 
				"    list-style-type: none;\r\n" + 
				"   \r\n" + 
				"    overflow: hidden;\r\n" + 
				"    background-color:rgb(80, 4, 80);\r\n" + 
				"  }\r\n" + 
				"  \r\n" + 
				"  li {\r\n" + 
				"    float: left;\r\n" + 
				"  }\r\n" + 
				"  \r\n" + 
				"  li a {\r\n" + 
				"    display: block;\r\n" + 
				"    color: white;\r\n" + 
				"    text-align: center;\r\n" + 
				"    padding: 30px 30px;\r\n" + 
				"    text-decoration: none;\r\n" + 
				"  }\r\n" + 
				"  * {\r\n" + 
				"box-sizing: border-box;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"body {\r\n" + 
				"font-family: Arial, Helvetica, sans-serif;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"/* Remove extra left and right margins, due to padding */\r\n" + 
				".row {margin: 0 -5px;}\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"/* Responsive columns */\r\n" + 
				"@media screen and (max-width: 600px) {\r\n" + 
				".column {\r\n" + 
				"width: 100%;\r\n" + 
				"display: block;\r\n" + 
				"margin-bottom: 20px;\r\n" + 
				"}\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"/* Style the counter cards */\r\n" + 
				"\r\n" + 
				".center {\r\n" + 
				"display: block;\r\n" + 
				"margin-left: auto;\r\n" + 
				"margin-right: auto;\r\n" + 
				"width: 50%;\r\n" + 
				"}\r\n" + 
				"    .button {\r\n" + 
				"background-color: rgb(5, 80, 8);\r\n" + 
				"border: none;\r\n" + 
				"color: white;\r\n" + 
				"padding: 15px 32px;\r\n" + 
				"text-align: center;\r\n" + 
				"text-decoration: none;\r\n" + 
				"display: inline-block;\r\n" + 
				"font-size: 16px;\r\n" + 
				"margin: 4px 2px;\r\n" + 
				"cursor: pointer;\r\n" + 
				"}\r\n" + 
				"    * {\r\n" + 
				"box-sizing: border-box;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".imgcontainer {\r\n" + 
				"  text-align: center;\r\n" + 
				"  margin: 24px 0 12px 0;\r\n" + 
				"  \r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"\r\n" + 
				".container {\r\n" + 
				"  padding: 16px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"</style>\r\n" + 
				"\r\n" + 
				"</head>\r\n" + 
				"<body> <ul>\r\n" + 
				"                <li><a href=\"home.html\">Home</a></li>\r\n" + 
				"                <li><a href=\"track.html\">Track Your Records</a></li>\r\n" + 
				"                <li><a href=\"reviews.html\">Reviews</a></li>\r\n" + 
				"                <li><a href=\"faqs.html\">FAQ's</a></li>         \r\n" + 
				"                <li><a href=\"profile.jsp\"> My Profile</a></li>\r\n" + 
				"                \r\n" + 
				"              </ul>");
		out.println("<h1>Children: Vaccination & Nutritions</h1>");
		//out.println("<h3>" + childNames + "</h3>");

		for (int i = 0; i < noOfChildren; i++) {
			out.println("<form action='ChildDetails.jsp' method='get'>");
			//out.println("<h2>" + childNames.get(i) + "</h2>");
			out.println("<input type='submit' style=\"color: blanchedalmond; font-size: large; height: 120px; width: 300px; background-color: #0099cc; align-content: center\" name='childName' value='" + childNames.get(i) + "'> ");
			out.println("</form>");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
