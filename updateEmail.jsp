<%@ page import ="java.sql.*" %>
<%
    
	String userid = request.getParameter("username");
	String email = request.getParameter("email");
	String newEmail = request.getParameter("newEmail");
	Class.forName("com.mysql.jdbc.Driver");
    
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BuyMe","root", "Pass");
    
	PreparedStatement update = con.prepareStatement("UPDATE User SET email = ? WHERE username = ?");

	try{
			update.setString(1, email);
			update.setString(2, userid);
			int res = update.executeUpdate();
			update.close();
			
			if (res >= 1) {
				out.println("Changes have been saved.");
				out.println("<a href='customerRepDashboard.jsp'>Return to dashboard.</a>");
			} else {
				out.println("Changes failed.");
				out.println("<a href='customerRepDashboard.jsp'>Return to dashboard.</a>");
			}
	}

 catch (SQLException se) {
	out.println("Error: Cannot Update <br>");
	out.println("<a href='userManager.jsp'>Return to list of users</a>");
	out.println("<a href='customerRepDashboard.jsp'>Return to dashboard.</a>");
	//se.printStackTrace();
	throw se; 

} catch (Exception e) {
	e.printStackTrace();
}


%>