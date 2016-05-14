<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DigiStore.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
      <li><a href="Home.aspx"><span class="glyphicon glyphicon-log-in"></span>Logout</a></li>
    </ul>
      <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Menu
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">ADD A BUSINESS</a></li>
          <li><a href="#">Browse Products</a></li>
          <li><a href="#">Browse Services</a></li> 
        </ul>
      </li>
    </ul>
  </div>
</nav>
       <br><br>
       <div class="container">
  <h3>Welcome (UserName)</h3> 
  <div class="row">
    <div class="col-md-4">
      <p>WE WILL PUT UP INFORMATION</p>
      <p>OR WE CAN PUT UP PICTURES</p>    
    </div>
    <div class="col-md-4"> 
      <p>WE WILL PUT UP INFORMATION</p>
      <p>OR WE CAN PUT UP PICTURES</p> 
    </div>
  </div>
</div>
    
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
