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
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        
        ResultSet rs;
        String queryCheckUserExistence = String.format("SELECT * FROM User where username='%s';", userid);
        rs = st.executeQuery(queryCheckUserExistence);
        if (rs.next()) {
        	out.println(String.format("Error: username \"%s\" is already taken. <a href='register.jsp'>Try again</a>", userid));
        }
        else {
        	String insertStatement = String.format("INSERT INTO User (username, password, email) VALUES ('%s', '%s', '%s');", userid, pwd, email);
            st.executeUpdate(insertStatement);
            session.setAttribute("user", userid);
            response.sendRedirect("login.jsp");
        }
      } catch(SQLException se) {
          out.println("Error: <a href='register.jsp'>Try again</a>");
              se.printStackTrace();
      } catch(Exception e) {
              e.printStackTrace();
    }
%>