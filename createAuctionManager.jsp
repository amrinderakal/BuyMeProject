<%@ page import ="java.sql.*" %>

<%
    String listingname = request.getParameter("listingname");   
    String itemtype = request.getParameter("itemtype");
    String color = request.getParameter("color");
    String brand = request.getParameter("brand");
    String modelYear = request.getParameter("modelYear");
    String endDateTime = request.getParameter("endDateTime");
   	String initialPrice = request.getParameter("initialPrice");
   	String reserve = request.getParameter("reservePrice");
   	String minIncrement = request.getParameter("minIncrement");
   	
   	
   
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BuyMe","root", "PASS");
   Statement st = con.createStatement();
   java.sql.Timestamp startDateTime = new java.sql.Timestamp(new java.util.Date().getTime());
   String currentUsername = String.valueOf(session.getAttribute("user"));

   //out.println(startDateTime);
   
      try{ 
       	 ResultSet rs;
         String queryCreateItem = String.format("INSERT INTO Item(itemtype, color, brand, modelYear) VALUES ('%s', '%s', '%s', %s);",itemtype, color, brand, modelYear);
         st.executeUpdate(queryCreateItem); 
         
         
         String itemIDQuery = String.format("SELECT itemID FROM Item ORDER BY itemID DESC LIMIT 1");
         rs = st.executeQuery(itemIDQuery);
         rs.next();
         int itemID = rs.getInt("itemID");
         
        
         ResultSet result;
         String queryCreateAuction = String.format("INSERT INTO Auction(itemID, username, winnerusername, listingname, startDateTime, endDateTime, initialPrice, currentbid, reserve, closed, earnings, minIncrement) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', %s, %s, %s, %s, %s, %s);", itemID, currentUsername, "winnerusername", listingname, startDateTime, endDateTime, initialPrice, "NULL", reserve, "NULL", "NULL", minIncrement);
		 st.executeUpdate(queryCreateAuction);
		 
		 out.println("Auction Created!: <a href='UserDash.jsp'>Back to Dashboard</a>");
		
		
      } catch(SQLException se) {
    	 out.println("Error: <a href='createAuction.jsp'>Try again</a>");
         se.printStackTrace();
   }   catch(Exception e) {
       e.printStackTrace();
}    
%>        