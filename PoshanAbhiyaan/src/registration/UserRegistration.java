package registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mailapi.SendingMail;



/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UserRegistration() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String userName=request.getParameter("userName");
		String userMail=request.getParameter("userMail");
		String userPhone=request.getParameter("userPhone");
		String userAddress=request.getParameter("userAddress");
		String userPinCode=request.getParameter("userPinCode");
		String userPswd=request.getParameter("userPswd");
		
		SendingMail sm = new SendingMail();
		String generatedotp = sm.getRandom();
		System.out.println("Generated otp: " + generatedotp);

		System.out.println("Before including otp: ");
		HttpSession session = request.getSession();
		session.setAttribute("generatedotp", generatedotp);
		session.setAttribute("userMail", userMail);
		session.setAttribute("userMobile", userPhone);
		session.setAttribute("userName", userName);
		session.setAttribute("userPinCode", userPinCode);
		session.setAttribute("userPswd", userPswd);
		session.setAttribute("userAddress", userAddress);
		session.setAttribute("generatedotp", generatedotp);
		
		String children=request.getParameter("children");
		if(children.equals("yes")){
			String noOfChildren= request.getParameter("noofchildren");
			session.setAttribute("noofchildren", noOfChildren);
			for(int i=1;i<=Integer.parseInt(noOfChildren);i++) {
				String name="cName"+i;
				String gender="cGender"+i;
				String dob="cDob"+i;
				
				String cName=request.getParameter("name");
				String cGender=request.getParameter("gender");
				String cDob=request.getParameter("dob");
				System.out.println("cDob in get "+cDob);
				
				session.setAttribute("cName", name);
				session.setAttribute("cGender", gender);
				session.setAttribute("cDob", dob);
			}
		}
		
		
		session.setAttribute("children", children);

		try {
			sm.setMailServerProperties();
			sm.createEmailMessage(userMail, "Your OTP is:"+generatedotp);
			sm.sendEmail();
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("EnterOTP.html");
		rd.forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SendingMail sm = new SendingMail();

		String enteredotp = request.getParameter("otp");
		System.out.println("entered otp by user is: " + enteredotp);

		HttpSession session = request.getSession();

		String userPinCode = (String) session.getAttribute("userPinCode");
		String userName = (String) session.getAttribute("userName");
		String userMobile = (String) session.getAttribute("userMobile");
		String userMail = (String) session.getAttribute("userMail");
		String userPswd = (String) session.getAttribute("userPswd");
		String userAddress = (String) session.getAttribute("userAddress");
		String generatedotp = (String) session.getAttribute("generatedotp");
		String children = (String) session.getAttribute("children");

		System.out.println(
				userName + " " + userMobile + " " + userMail + " " + userPswd + " " + userAddress + " " + userPinCode);

		if (enteredotp.equals(generatedotp)) {
			// sm.insert(userName, userPswd, userAddress, userMobile, userMail,
			// userPinCode);
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/poshanabhiyaan?autoReconnect=true&useSSL=false", "root",
						"root");
				PreparedStatement pstmt = con.prepareStatement(
						"insert into user(userName,userMail,userPswd,userMobile,userAddress,userPinCode) values(?,?,?,?,?,?);");

				pstmt.setString(1, userName);
				pstmt.setString(2, userMail);
				pstmt.setString(3, userPswd);
				pstmt.setString(4, userMobile);
				pstmt.setString(5, userAddress);
				pstmt.setString(6, userPinCode);

				int rs = pstmt.executeUpdate();
				if (rs > 0) {
					PreparedStatement pstmt2 = con.prepareStatement(
							"select userId from user where userMail=?;");

					pstmt2.setString(1, userMail);
					ResultSet rs2=pstmt2.executeQuery();
					int parent=0;
					while(rs2.next()) {
						parent=rs2.getInt("userId");
					}
					
					if(children!=null && children.equalsIgnoreCase("yes")) {
						
							String noOfChildren=(String) session.getAttribute("noofchildren");
							for(int i=1;i<=Integer.parseInt(noOfChildren);i++) {
								String name="cName"+i;
								String gender="cGender"+i;
								String dob="cDob"+i;
								String cName=(String) session.getAttribute("name");
								String cGender=(String) session.getAttribute("gender");
								String cDob=(String) session.getAttribute("dob");
								System.out.println("cDob "+cDob);
								
								PreparedStatement pstmt3 = con.prepareStatement(
										"insert into child(cName,cGender,cDob,parent) values(?,?,?,?);");

								pstmt3.setString(1, cName);
								pstmt3.setString(2, cGender);
								pstmt3.setString(3, cDob);
								pstmt3.setInt(4, parent);

								int rs3 = pstmt3.executeUpdate();
								if(rs3>0) {
									System.out.println("Child entry entered into db");
								}
								
							}
						
					}
					
					System.out.println("Registered Successfully");
					RequestDispatcher rd = request.getRequestDispatcher("UserLogin.html");
					rd.forward(request, response);
					return;
				} else {
					System.out.print("Error");
				}
			}

			catch (Exception e) {
				System.out.println("in catch block for connecting sql driver");
				e.printStackTrace();
			}

			System.out.println("OTP verified - Registered Successfully");
			
		
		} else {
			System.out.println("Invalid OTP");
			RequestDispatcher rd = request.getRequestDispatcher("UserRegistration.html");
			rd.forward(request, response);
			return;
	
		}

	}

}
