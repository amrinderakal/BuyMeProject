<!DOCTYPE html>
<html>
<head>
    <title>Q&A</title>
    <td><a href="customerRepDashboard.jsp">Return to Dashboard</a></td>
<%@ page import ="java.sql.*" %>
</head>
<%
    
    Class.forName("com.mysql.jdbc.Driver");
    
    
    try { 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BuyMe","root", "Pass");
        Statement st = con.createStatement();
       // java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        //string totalearnings = string.format("Select sum(earnings) as Total_Earnings from Auction where closed = 'true'");
        ResultSet rs ;
       rs =  st.executeQuery("select questionId, questions, reply from Questions");
       // session.setAttribute("user", userid);

      
    %><table border=1 align=center style="text-align:center">
    <thead>
        <tr>
           <th>ID</th>
           <th>Question</th>
           <th>Reply</th>
           
        </tr>
    </thead>
    <tbody>
      <%while(rs.next())
      {
          %>
          <tr>
              <td><%=rs.getInt("questionId") %></td>
              <td><%=rs.getString("questions") %></td>
              <td><%=rs.getString("reply") %></td>
              
          </tr>
          <%}%>
         </tbody>
      </table><br>
  <%}
    catch(Exception e) {
              e.printStackTrace();
    }
%>
   
    	
    
   
    
    	<h1>Reply</h1>
    	<form action="ReplyInsert.jsp" method="POST">
      Question ID: <input type="text" name="questionId"/> <br/>
       
       Reply:<input type="text" name="reply"/> <br/>
       <input type="submit" value="Submit"/>
      </form>
     
    	</body>
</html>