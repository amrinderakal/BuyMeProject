  <title>Earnings per Item</title>
<%@ page import ="java.sql.*" %>
</head>
<%
    
    Class.forName("com.mysql.jdbc.Driver");
    
    
    try { 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BuyMe","root", "Aka83668");
        Statement st = con.createStatement();
       // java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        //string totalearnings = string.format("Select sum(earnings) as Total_Earnings from Auction where closed = 'true'");
        ResultSet rs ;
       rs =  st.executeQuery("select winnerusername, sum(earnings) as Money_Spent from auction where closed = '1' group by winnerusername order by Money_Spent desc limit 5; ");
       // session.setAttribute("user", userid);

      
    %><table border=1 align=center style="text-align:center">
    <thead>
        <tr>
           <th>Winner Name</th>
           <th>Money Spent</th>
           
        </tr>
    </thead>
    <tbody>
      <%while(rs.next())
      {
          %>
          <tr>
              <td><%=rs.getString("winnerusername") %></td>
              <td><%=rs.getFloat("Money_Spent") %></td>
              
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