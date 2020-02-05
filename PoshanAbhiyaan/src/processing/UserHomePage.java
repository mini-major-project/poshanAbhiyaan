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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		  PrintWriter out=response.getWriter();
		  HttpSession session=request.getSession();
		  
		  String userMail=(String) session.getAttribute("userMail");
		  int userId=(int) session.getAttribute("userId");
		  int noOfChildren=0;
		  ArrayList<String> childNames=new ArrayList<>();
		  ArrayList<Integer> childIds=new ArrayList<>();
		  
		  try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/poshanabhiyaan", "root", "root");
				PreparedStatement pstmt = con.prepareStatement("select * from child where parent=?");
				pstmt.setInt(1, userId);
				ResultSet rs = pstmt.executeQuery();
			    while(rs.next()) {
			    	noOfChildren++;
			    	String cName = rs.getString("cName");
			    	session.setAttribute("cName", cName);
			    	
			    	childNames.add(cName);
					int cId=rs.getInt("cId");
					childIds.add(cId);
			    }
						session.setAttribute("noOfChildren", noOfChildren);
//						session.setAttribute("userMobile", userMobile);
//						session.setAttribute("userName", userName);
						session.setAttribute("userId", userId);		
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		  out.println("<html><head></head><body>");
		  out.println("<h1>Children: Vaccination & Nutritions</h1>");
		  for(int i=0;i<noOfChildren;i++) { 
			  out.println("<h2>"+childNames.get(0)+"</h2>");
			  out.println("<a href=\"ChildDetails.jsp\">Vaccinations</a>");
		  }
		  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
