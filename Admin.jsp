<!DOCTYPE html>
<html>
   <head>
      <title>Admin Page</title>
   </head>
   <body>
   <form action="insertCusRep.jsp" method="POST">
   
    <h1>Administrator Dashboard</h1>
   <h2>Create Customer Service Account</h2>
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       Email:<input type="email" name="email"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <form action="DeleteCusRep.jsp" method="POST">
   <h2>Delete Customer Service Account</h2>	
   Username: <input type="text" name="username"/> <br/>  
   <input type="submit" value="Submit"/>
   </form>
   
   <form action="Salesredirect.jsp" method="POST"> 
   <h2>Generate Sales Reports</h2>
       <select name="select" id="selectbox"> 
       	<option value="totalearnings.jsp">Total Earnings</option>
       	<option value="peritem.jsp">Earnings Per Item</option>
       	<option value="itemtypeearnings.jsp">Earnings Per Item Type</option>
       	<option value="Earningsperuser.jsp">Earnings Per End-User</option>
       	<option value="Bestselling.jsp">Best Selling Items</option>
       	<option value="BestBuyer.jsp">Best Buyers</option>
       </select>
       <input type="submit" value="Submit"/>
     </form>
   </body>
</html>