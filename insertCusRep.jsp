<%@ page import ="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    
    
    try { 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BuyMe","root", "Pass");
        Statement st = con.createStatement();
        ResultSet rs;
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        String insertStatement = String.format("INSERT INTO User (username, password, email) VALUES ('%s', '%s', '%s');", userid, pwd, email);
        st.executeUpdate(insertStatement);
        
       
        rs = st.executeQuery("SELECT * FROM User WHERE username='"+userid+"'");
        session.setAttribute("user", userid);
        	
        	if(rs.next()) {
        		String insertCusStatement = String.format("INSERT INTO CusRep(username) VALUES ('%s');", userid);
        		st.executeUpdate(insertCusStatement);
        		out.println("Customer Representative Account Successfully Created! <a href='Admin.jsp'>Return to Dashboard</a>");
        	}
    		
              
        }catch(SQLException se) {
          out.println("There was an error: <a href='Admin.jsp'>Try again</a>");
              se.printStackTrace();
      } catch(Exception e) {
              e.printStackTrace();
    }
%>