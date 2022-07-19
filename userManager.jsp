<!DOCTYPE html>
<html>
   <head>
      <title>Customer Representative Page</title>
   </head>
   <body>
   <form action="updateEmail.jsp" method="POST">
   
    <h1>Customer Representative Functions</h1>
   <h2>Update User Email</h2>
       Username: <input type="text" name="username"/> <br/>
       New Email:<input type="text" name="email"/> <br/>
       <input type="submit" value="Update"/>
     </form>
 
    <form action="deleteUser.jsp" method="POST">
    <h2>Delete User Account</h2>
        Username: <input type="text" name="userid"/> <br/>
       <input type="submit" value="Delete"/>   
    </form>
    
    <a href="customerRepDashboard.jsp">Return to Dashboard!</a><br>
  </body>
</html>