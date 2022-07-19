<%@ page import ="java.sql.*" %>
<%
    
    String userid = request.getParameter("username");   
    
    Class.forName("com.mysql.jdbc.Driver");
    
    
    try { 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BuyMe","root", "PASS");
        Statement st = con.createStatement();
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        
        ResultSet rs;
        rs = st.executeQuery("SELECT * FROM CusRep WHERE username='"+userid+"'");
        
        if (rs.next()) {
        	String insertStatement = String.format("DELETE FROM User WHERE username='"+userid+"'");
        	st.executeUpdate(insertStatement);
        	out.println("Account Deleted Successfully! <a href='Admin.jsp'>Return to Dashboard</a>");
        }
        else {
        	out.println("Username not associated with a Customer Representative: <a href='Admin.jsp'>Try again</a>");
        }

        // session.setAttribute("user", userid);
        
        
        
      } catch(SQLException se) {
          out.println("Error: <a href='Admin.jsp'>Try again</a>");
              se.printStackTrace();
      } catch(Exception e) {
              e.printStackTrace();
    }
%>