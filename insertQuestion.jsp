<%@ page import ="java.sql.*" %>
<%
   
    String userid = request.getParameter("username");   
    String question = request.getParameter("questions");
   
    Class.forName("com.mysql.jdbc.Driver");
    
    
    try { 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BuyMe","root", "Pass");
        Statement st = con.createStatement();
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        
        String currentUsername = String.valueOf(session.getAttribute("user"));
        
       
        String insertStatement = String.format("INSERT INTO Questions (questions,username) VALUES ('%s','%s');", question,currentUsername);
        st.executeUpdate(insertStatement);
        
        response.sendRedirect("createQuestion.jsp");
        
      } catch(SQLException se) {
          out.println("Response Not Submitted: <a href='createQuestion.jsp'>Try again</a>");
              se.printStackTrace();
      } catch(Exception e) {
              e.printStackTrace();
    }
%>