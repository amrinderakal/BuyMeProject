<%@ page import ="java.sql.*" %>
<%@ page import="java.util.HashMap"%>
<%
 	String found = null;
	int i = 6;
    while (found == null && i >= 0) {
    	found = request.getParameter("" + i);
    	i -= 1;
    }
    i += 1;
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BuyMe","root", "Pass");
    
    PreparedStatement ps = con.prepareStatement("INSERT INTO " +
    										    "Bids(bidderUsername, sellerUsername, itemID, " +
    						    		    	"bid, upperlimit, increment, isAuto)" +
    						 	 	 	 	    "VALUES (?, ?, ?, ?, ?, ?, ?);");
    
    //   key : value
    // count : itemid
    HashMap<Integer,Integer> hash = (HashMap<Integer,Integer>)session.getAttribute("hash");
    HashMap<Integer,String> hash_seller = (HashMap<Integer,String>)session.getAttribute("hash_seller");
	
    int itemid = hash.get(i);
	String selleruserid = hash_seller.get(i);
	String bidderuserid = String.valueOf(session.getAttribute("user"));
	
	float amou = Float.parseFloat(request.getParameter("amou" + itemid));
	
    String auto_string = request.getParameter("auto" + itemid);
    int auto = auto_string == null || auto_string == "null" ? 0 : 1;
    if (auto == 0) {
        ps.setString(5, "0");
        ps.setString(6, "0");
    } else {
        float incr = Float.parseFloat(request.getParameter("incr" + itemid));
        float uppe = Float.parseFloat(request.getParameter("uppe" + itemid));
        ps.setString(5, "" + uppe);
        ps.setString(6, "" + incr);
    }
    ps.setString(1, bidderuserid);
    ps.setString(2, "" + selleruserid);
    ps.setString(3, "" + itemid);
    ps.setString(4, "" + amou);
    ps.setString(7, "" + auto);
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT itemID, endDateTime, currentbid, closed, minIncrement "+
    							   "FROM Auction " +
    							   "WHERE itemID = "+ itemid +
    							   " LIMIT 1;");
   	//ResultSet rs = st.executeQuery("SELECT itemID, endDateTime, currentbid, closed, minIncrement FROM Auction WHERE itemID = '"+ itemid +"' LIMIT 1;");
    	
    Boolean execute = true;					   
    String outmessage = "";			
    
    rs.next();
    Timestamp endDateTime = rs.getTimestamp("endDateTime");
    Timestamp currentdatetime = new java.sql.Timestamp(new java.util.Date().getTime());
    int cmp = endDateTime.compareTo(currentdatetime);
    if (cmp < 0) {
    	String subquery = "(SELECT bidderUsername "+
    					  "FROM Bids " +
    					  "WHERE sellerUsername = \'" + selleruserid + "\' and itemID = " + itemid +
    					  " ORDER BY bidID DESC " + 
    					  "LIMIT 1)";
    	st.executeUpdate("UPDATE Auction "+ 
    					 "SET closed = 1, earnings = if (currentbid < reserve, -1, currentbid), winnerusername = " + subquery +
    					 " WHERE username = \'" + selleruserid + "\' and itemID = " + itemid + ";");
    	execute = false;
    	outmessage = "<h3>Sorry! It looks like this auction closed on " + endDateTime + ".</h3>" +
    			     "<a href=\"ViewAuctions.jsp\">View auctions</a>";
    } else {
    	float currentbid = rs.getFloat("currentbid");
        //Boolean closed = rs.getBoolean("closed");
        float minIncrement = rs.getFloat("minIncrement");
        
        if (amou < currentbid + minIncrement) execute = false;
        outmessage = "<h3>You must bid at least " + minIncrement + " more than the current bid.</h3>" +
			         "<a href=\"ViewAuctions.jsp\">View auctions</a>";
			         
			
    }
    
    if (execute) {
    	st.executeUpdate("UPDATE Auction "+ 
				 		 "SET currentbid = " + amou +
				         " WHERE username = \'" + selleruserid + "\' and itemID = " + itemid + ";");
    	ps.executeUpdate();
    	response.sendRedirect("ViewAuctions.jsp");
    }
    else {
    	out.println(outmessage);
    }
    	
    
    
    
    
    
    // DO logic to ensure that it's a valid bid (bid amount, increment, etc.)
    //  - endDateTime   :  get current datetime, compare
    //  - currentbid    :  
    //  - closed
    //  - minIncrement
    
    //rs = st.executeQuery("SELECT * from User WHERE username='" + userid + "' and password='" + pwd + "'");
    
    
    //session stuff?
    
    
   	// amou   formid
   	// auto   formid
   	// incr   formid
    
%>