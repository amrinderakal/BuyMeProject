<%@ page import ="java.sql.*" %>
<%
    
    String userid = request.getParameter("username");   
    
    Class.forName("com.mysql.jdbc.Driver");
    
    
    try { 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BuyMe","root", "Pass");
        Statement st = con.createStatement();
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        String insertStatement = String.format("DELETE FROM User WHERE username='"+userid+"'");
        st.executeUpdate(insertStatement);
        
        session.setAttribute("username", userid);
        
        out.println("Account Deleted Successfully! <a href='userManager.jsp'>Return to Dashboard</a>");
        
      } catch(SQLException se) {
          out.println("Error: <a href='userManager.jsp'>Try again</a>");
              se.printStackTrace();
      } catch(Exception e) {
              e.printStackTrace();
    }
%>