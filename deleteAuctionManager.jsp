<%@ page import ="java.sql.*" %>
<%
    
    String itemID = request.getParameter("itemID");   
	String userid = request.getParameter("username");   
    
    Class.forName("com.mysql.jdbc.Driver");
    
    
    try { 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BuyMe","root", "PASS");
        Statement st = con.createStatement();
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        String insertStatement = String.format("DELETE FROM Auction WHERE username='"+userid+"' and itemID = '"+itemID+"'");
        st.executeUpdate(insertStatement);
        
        
        
        out.println("Auction Deleted Successfully! <a href='customerRepDashboard.jsp'>Return to Dashboard</a>");
        
      } catch(SQLException se) {
          out.println("Error: <a href='Admin.jsp'>Try again</a>");
              se.printStackTrace();
      } catch(Exception e) {
              e.printStackTrace();
    }
%>