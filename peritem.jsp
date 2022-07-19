<!DOCTYPE html>
<html>
<head>
    <title>Earnings per Item</title>
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
       rs =  st.executeQuery("select itemID, earnings from auction where closed = '1'");
       // session.setAttribute("user", userid);

      
    %><table border=1 align=center style="text-align:center">
    <thead>
        <tr>
           <th>ID</th>
           <th>Earnings</th>
           
        </tr>
    </thead>
    <tbody>
      <%while(rs.next())
      {
          %>
          <tr>
              <td><%=rs.getInt("itemId") %></td>
              <td><%=rs.getFloat("earnings") %></td>
              
          </tr>
          <%}%>
         </tbody>
      </table><br>
  <%}
    catch(Exception e) {
              e.printStackTrace();
    }
%>
</body>
</html>
