<html lang="en">
<head>
  <title>Register</title>
</head>
<body>
 <form action="insertRegisterDetails.jsp" method="POST">
      <table>
        <tr>
          <td>Username:</td>
          <td><input type="text" name="username" placeholder="Enter name Here"></td>
        </tr>
        <tr>
          <td>Password:</td>
          <td><input type="password" name="password" placeholder="Enter Password Here"></td>
        </tr>
        <tr>
          <td>Email:</td>
          <td><input type="email" name="email" placeholder="Enter Email Here"></td>
        </tr>
        <tr>
           <td><input type="submit" name="submit" value="submit"></td>
           <td><a href="login.jsp">Login Here</a></td>
        </tr>
      </table>
  </form>
</body>
</html>