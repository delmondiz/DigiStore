<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DigiStore.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- source code to look pretty -->
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
    <!-- nav bar at the top of page  -->
  <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Home.aspx">DigiStore</a>
    </div>  
       <ul class="nav navbar-nav navbar-right">
      <li><a href="Register.aspx"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
     
    </ul>
  </div>
</nav>
       <br><br>
   <div id="container_demo" >
	<!-- creating the login in form with fields to input -->
	<a class="hiddenanchor" id="toregister"></a>
	<a class="hiddenanchor" id="tologin"></a>
	<div id="wrapper">
		<div id="login" class="animate form">
			<form  action="UserHome.aspx" autocomplete="on"> 
				<h1>Log in</h1> 
				<p> 
					<label for="username" class="uname" data-icon="u" > Your email or username </label>
					<input id="username" name="username" required="required" type="text" placeholder="myusername or mymail@mail.com"/>
				</p>
				<p> 
					<label for="password" class="youpasswd" data-icon="p"> Your password </label>
					<input id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO" /> 
				</p>
				<p class="keeplogin"> 
					<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
					<label for="loginkeeping">Keep me logged in</label>
				</p>
				<p class="login button"> 
					<input type="submit" value="Login"  /> 
				</p>
				<p class="change_link">
					Not a member yet ?
					<a href="Register.aspx" class="to_register">Join us</a>
				</p>
			</form>
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