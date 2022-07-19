<%@ page import ="java.sql.*" %>
<%
    String qid = request.getParameter("questionId");
    String userid = request.getParameter("username");   
    String reply = request.getParameter("reply");
   
    Class.forName("com.mysql.jdbc.Driver");
    
    
    try { 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BuyMe","root", "Pass");
        Statement st = con.createStatement();
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        ResultSet rs;
        rs = st.executeQuery("SELECT * from Questions where questionId='" + qid + "'");
        String currentUsername = String.valueOf(session.getAttribute("user"));
        
        if(rs.next()){
        String insertStatement = String.format("UPDATE Questions SET reply = '%s', cusrepusername = '%s' WHERE questionId = '"+qid+"';", reply,currentUsername);
        st.executeUpdate(insertStatement);
        
        response.sendRedirect("reply.jsp");
        }
      } catch(SQLException se) {
          out.println("Response Not Submitted: <a href='reply.jsp'>Try again</a>");
              se.printStackTrace();
      } catch(Exception e) {
              e.printStackTrace();
    }
%>