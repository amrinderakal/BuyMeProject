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
       rs =  st.executeQuery("select username, sum(earnings) as Total_Earnings from auction where closed = '1' group by username ");
       // session.setAttribute("user", userid);

      
    %><table border=1 align=center style="text-align:center">
    <thead>
        <tr>
           <th>Username</th>
           <th>Earnings</th>
           
        </tr>
    </thead>
    <tbody>
      <%while(rs.next())
      {
          %>
          <tr>
              <td><%=rs.getString("username") %></td>
              <td><%=rs.getFloat("Total_Earnings") %></td>
              
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