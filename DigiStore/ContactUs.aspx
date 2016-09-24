<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="DigiStore.ContactUs" %>

<!DOCTYPE html>
<html class="" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Digital Store Front</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="../Styles/newcss.css">
    <link rel="stylesheet" href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
    <link href="Style/StyleSheet.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>

<body>
    <nav class="blue darken-3" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container" href="Home.aspx" class="brand-logo center yellow-text accent-3">DigiStore</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="Home.aspx" class="yellow-text accent-3">Home</a></li>
                <li><a href="Map.aspx" class="yellow-text accent-3">Search</a></li>
                <li><a href="#" class="yellow-text accent-3">Sales</a></li>
                <li><a class="dropdown-button centered" href="#" data-activates="accountDropdown" style="height:100%">
                    <img class="circle" src="/img/icon.png" height="30" width="30" /></a></li>
            </ul>

            <ul id="nav-mobile" class="side-nav">
                <h4 class="center blue-text darken-3">Menu</h4>
                <li>
                    <div class="divider"></div>
                </li>
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="Map.aspx">Search</a></li>
                <li><a href="ViewCart.aspx">Cart</a></li>
                <li>
                    <div class="divider"></div>
                </li>
                <li><a href="StoreInventory.aspx">Manage Store</a></li>
                <li><a href="#">Order History</a></li>
                <li><a href="Profile.aspx">Profile</a></li>
                <li><a href="#">Log In/Out</a></li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>

            <ul id="accountDropdown" class="dropdown-content">
                <li><a href="Profile.aspx">Profile</a></li>
                <li><a href="ViewCart.aspx">Cart</a></li>
                <li><a href="#">Order History</a></li>
                
                <li><a href="#">Log In/Out</a></li>
            </ul>
        </div>
    </nav>

    <div id="container_demo">
        <div id="wrapper">
            <br />
            <br />
            <h1>Contact Us</h1>
        </div>
        <div class="col-sm-4">
            <h4>Please fill out</h4>

        </div>

    </div>

    <br>


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
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
    <script>
        $(document).foundation();
    </script>
    <script type="text/javascript" src="https://intercom.zurb.com/scripts/zcom.js"></script>


</body>
</html>
