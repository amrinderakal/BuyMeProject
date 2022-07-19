<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auctions</title>
</head>
<body>
	<h1>Recent Auctions</h1>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BuyMe","root", "Pass");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * " +
								   "FROM Auction " +
								   "ORDER BY itemID DESC " +
								   "LIMIT 5;");
	
	int listingNameDisplayLimit = 50;
	
	int count = 5;
	HashMap<Integer,Integer> hm = new HashMap<Integer,Integer>();
	HashMap<Integer,String> hm_seller = new HashMap<Integer,String>();
	
	while (rs.next()) {
			  String userid = rs.getString("username");
				 int itemid = rs.getInt("itemID");
		String winneruserid = rs.getString("winnerusername");
		 String listingname = rs.getString("listingname");
		 Date startdatetime = rs.getDate("startDateTime");
		   Date enddatetime = rs.getDate("endDateTime");
			float initprice = rs.getFloat("initialPrice");
			  float currbid = rs.getFloat("currentbid");
			  float reserve = rs.getFloat("reserve");
			 boolean closed = rs.getBoolean("closed");
			  float minincr = rs.getFloat("minIncrement");
			  float earning = rs.getFloat("earnings");
			  
		String status = closed ? "Closed" : "Open";
		
		Statement item_st = con.createStatement();
		ResultSet item_rs = item_st.executeQuery("SELECT * FROM Item WHERE itemID = '" + itemid + "';");
		
		//boolean islaptop = false, isdesktop = false, istablet = false;  
		String  color = "dummy_color", brand = "dummy_brand", typeofitem = "dummy_itemtype";
		int modelyear = -1;
		
		if (item_rs.next()) {
			//islaptop  = item_rs.getBoolean("isaLaptop");
			//isdesktop = item_rs.getBoolean("isaDesktop");
			//istablet  = item_rs.getBoolean("isaTablet");
			color     = item_rs.getString("color");
			brand     = item_rs.getString("brand");
			modelyear = item_rs.getInt("modelYear");
			typeofitem  = item_rs.getString("itemtype");
		}
		
		//String typeofitem;
		//if (isdesktop) {
		//	typeofitem = "Desktop";
		//} else if (istablet) {
		//	typeofitem = "Tablet";
		//} else {
		//	typeofitem = "Laptop";
		//}
		
		hm.put(count, itemid);
		hm_seller.put(count, userid);
		
		String     formid = "" + itemid;
		String selleruser = userid;
		
		out.println("<div>");
		  out.println("<h3>" + listingname + "</h3>");
		  out.println("<p>");
		    out.println("Listed by user: '" + userid + "'<br/>");
		    
		    out.println("ITEM ID: " + itemid + "<br/>");
		    
		    out.println("Item type:  " + typeofitem + "<br/>");
		    out.println("Brand:      " + brand + "<br/>");
		    out.println("Model Year: " + modelyear + "<br/>");
		    out.println("Color:      " + color + "<br/>");
		  out.println("</p>");
		  out.println("<p>");
		    out.println("Status: " + status + "<br/>");
		    if (!closed) {
			    out.println("Current bid: " + currbid + "<br/>");
			    out.println("<form action=\"placeBid.jsp\" method=\"POST\">");
			      out.println("Bid amount: <input type=\"number\" step=\".01\" name=\"amou" + formid + "\"/> <br/>");
			      out.println("Turn on automatic bidding: <input type=\"checkbox\" name=\"auto" + formid + "\"/> <br/>");
			      out.println("Bid increment for auto bidding: <input type=\"number\" step=\".01\" name=\"incr" + formid + "\"/> <br/>");
			      out.println("Most I am willing to bid: <input type=\"number\" step=\".01\" name=\"uppe" + formid + "\"/> <br/>");
			      out.println("Note: seller has set increment to be a minimum of $" + minincr + "<br/>");
			      out.println("<input type=\"submit\" name=\"" + count + "\" value=\"Place bid\"/>");
		    } else {
		    	out.println("Sold at $" + earning + " to user '" + winneruserid + "' on " + enddatetime + "<br/>");
		    }
		out.println("</p>");
		out.println("</div>");
		
		count -= 1;
		
		
		// functionality:
		// place bid, button for turning on automatic bidding, have to insert into Buyer table etc.
		
		
	}
	session.setAttribute("hash", hm);
	session.setAttribute("hash_seller", hm_seller);

%>

</body>
</html>