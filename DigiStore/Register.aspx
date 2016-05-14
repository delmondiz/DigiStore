﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DigiStore.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- again making it look pretty -->
     <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" href="../Styles/newcss.css">
  <link rel="stylesheet" href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
   <link href="Style/StyleSheet.css" rel="stylesheet" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
  <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Home.aspx">DigiStore</a>
    </div>
       <ul class="nav navbar-nav navbar-right">
      <li><a href="Login.aspx"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
     
    </ul>
  </div>
</nav>
       <br><br>
    <!-- registration form  -->
    <div id="register" class="animate form">
			<form  action="UserHome.aspx" autocomplete="on"> 
				<h1> Sign up </h1> 
                <p> 
					<label for="FirstName" class="Fname" data-icon="p">First Name: </label>
					<input id="FirstName" name="FirstName"  type="text" placeholder="eg. John"/>
				</p>
                 <p> 
					<label for="LastName" class="Lname" data-icon="p">Last Name: </label>
					<input id="LastName" name="LastName"  type="text" placeholder="eg. Johnson"/>
				</p>
                 <p> 
					<label for="Address" class="uAddress" data-icon="p">Address: </label>
					<input id="Address" name="Address"  type="text" placeholder="eg. 30 street name crt"/>
				</p>
                <p> 
					<label for="PostalCode" class="uPostalCode" data-icon="p">Postal Code: </label>
					<input id="PostalCode" name="PostalCode"  type="text" placeholder="eg. L4Z4R5"/>
				</p>
                	<p> 
					<label for="usernamesignup" class="uname" data-icon="u">Your username</label>
					<input id="usernamesignup" name="usernamesignup"  type="text" placeholder="mysuperusername690" />
				</p>
				<p> 
					<label for="emailsignup" class="youmail" data-icon="e" > Your email</label>
					<input id="emailsignup" name="emailsignup"  type="email" placeholder="mysupermail@mail.com"/> 
				</p>
				<p> 
					<label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
					<input id="passwordsignup" name="passwordsignup"  type="password" placeholder="eg. X8df!90EO"/>
				</p>
				<p> 
					<label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password </label>
					<input id="passwordsignup_confirm" name="passwordsignup_confirm"  type="password" placeholder="eg. X8df!90EO"/>
				</p>
				<p class="signin button"> 
					<input type="submit" value="Sign up" /> 
				</p>
				<p class="change_link">  
					Already a member ?
					<a href="Login.aspx" class="to_register"> Go and log in </a>
				</p>
			</form>
		</div>
		
	</div>
</div>  
    
    <!-- simple footer -->
        <footer>
  <div id="navcontainer">
<ul id="navlist">
<li id="active"><a href="#" id="current">Contact</a></li>
<li><a href="#">About</a></li>
<li><a href="#">Employment</a></li>
<li><a href="#">Legal</a></li>
</ul>
</div>
</footer>
</body>
</html>