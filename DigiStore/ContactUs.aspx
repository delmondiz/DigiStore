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
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <ul class="nav navbar-nav navbar-right">
            <li><a href="Home.aspx"><span class="glyphicon glyphicon-user"></span>Log Out</a></li>
        </ul>
        <ul class="dropdown menu" data-dropdown-menu="" role="menubar" data-dropdownmenu="bcfom2-dropdownmenu">
            <a class="navbar-brand" href="Home.aspx">DigiStore</a>
            <li class="has-submenu is-dropdown-submenu-parent is-down-arrow" role="menuitem" tabindex="0" title="Menu" aria-haspopup="true">
                <a href="#" tabindex="-1">Menu</a>
                <ul class="submenu menu vertical is-dropdown-submenu first-sub" data-submenu="" aria-hidden="true" tabindex="-1" role="menu">
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="#" tabindex="-1">browse</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="#" tabindex="-1">etc</a></li>
                </ul>
            </li>
        </ul>

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
