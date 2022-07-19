<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BuyMe","root", "PASS");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("SELECT * from User where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        rs = st.executeQuery("SELECT * FROM Admin WHERE username='" + userid + "'");
        if (rs.next()) {
        	out.println("welcome " + userid); 
        	response.sendRedirect("Admin.jsp");
        }
    	else {
    		rs = st.executeQuery("SELECT * FROM CusRep WHERE username='" + userid + "'");
    		if (rs.next()) {
    	 		response.sendRedirect("customerRepDashboard.jsp");
    		}
    	 	else {
    	        response.sendRedirect("UserDash.jsp");
    		}
    	}
        
        session.setAttribute("user", userid);
      
    }
    else {
        out.println("Invalid username or password <a href='login.jsp'>try again</a>");
    }
        
    
%>
    	
   
    	
    
        
    
   