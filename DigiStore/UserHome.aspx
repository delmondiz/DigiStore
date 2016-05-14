<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="DigiStore.UserHome" %>

<!DOCTYPE html>
<html class="" lang="en">
<head>
    <!-- All the sources needed and try and make it look pretty -->
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
    <!-- Created an onclick event so we can hide the service and product divs  -->
    <script>
        $(document).ready(function () {
            $("#lsService").click(function () {
                $("#disProduct").hide(); $("#disService").show();
            });
            $("#lsProducts").click(function () {
                $("#disProduct").show(); $("#disService").hide();
            });
        });
    </script>
    <style>
        body {
            background-image: url('Images/Storefront5.jpg');
            background-size: 100% 100%;
        }
    </style>

</head>

<body>
    <!-- Simple Nav Bar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <ul class="nav navbar-nav navbar-right">
            <!-- nav bar items   -->
            <!-- Class badge give the items the # we can use do $(this).text()); to update and modify text-->
            <li><a href="#"><span class="glyphicon glyphicon-user"></span>Services Notification<span id="ServiceUpcoming" class="badge">5</span></a></li>
            <li><a href="ViewCart.aspx"><span class="glyphicon glyphicon-user"></span>Cart Items<span id="Item#" class="badge">2</span></a></li>
            <li><a href="Home.aspx"><span class="glyphicon glyphicon-user"></span>Log Out</a></li>
        </ul>
        <ul class="dropdown menu" data-dropdown-menu="" role="menubar" data-dropdownmenu="bcfom2-dropdownmenu">
            <a class="navbar-brand" href="UserHome.aspx">DigiStore</a>
            <li class="has-submenu is-dropdown-submenu-parent is-down-arrow" role="menuitem" tabindex="0" title="Menu" aria-haspopup="true">
                <a href="#" tabindex="-1">Menu</a>
                <ul class="submenu menu vertical is-dropdown-submenu first-sub" data-submenu="" aria-hidden="true" tabindex="-1" role="menu">
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="#" tabindex="-1">Browse</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="ViewCart.aspx" tabindex="-1">View Cart</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="#" tabindex="-1">View Notification</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="#" tabindex="-1">etc</a></li>
                </ul>
            </li>
        </ul>

    </nav>
    <br />
    <br />
    <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="width: 100%">
            Select Location
    <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" style="width: 100%">
            <li class="text-center"><a href="#">Downtown Toronto</a></li>
            <li class="text-center"><a href="#">Brampton</a></li>
            <li class="text-center"><a href="#">Mississauga</a></li>
            <li class="text-center"><a href="#">Vaughn</a></li>
            <li class="text-center"><a href="#">Bolton</a></li>
            <li class="text-center"><a href="#">North York</a></li>
            <li class="text-center"><a href="#">Oakville</a></li>

        </ul>
    </div>

    <div id="container_demo">
        <div id="wrapper">

            <h1 style="color: white;">Weclome To Your DigiStore (Username)</h1>
        </div>
        <div class="col-sm-4">
            <h4 style="color: white;">What are you looking for</h4>
            <button id="lsService" type="button" class="btn btn-primary">Service</button>
            <br />
            <br />
            <button id="lsProducts" type="button" class="btn btn-primary">Product</button>
        </div>
        <!--  Creating colums  -->
        <div class="col-sm-4">
            <div class="input-group" id="adv-search">
                <input type="text" class="form-control" placeholder="Search" />
                <div class="input-group-btn">
                    <div class="btn-group" role="group">
                        <div class="dropdown dropdown-lg">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
                            <div class="dropdown-menu dropdown-menu-right" role="menu">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="filter">Filter by</label>
                                        <select class="form-control">
                                            <option value="0" selected>All Snippets</option>
                                            <option value="1">Featured</option>
                                            <option value="2">Most popular</option>
                                            <option value="3">Top rated</option>
                                            <option value="4">Most commented</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="contain">Author</label>
                                        <input class="form-control" type="text" />
                                    </div>
                                    <div class="form-group">
                                        <label for="contain">Contains the words</label>
                                        <input class="form-control" type="text" />
                                    </div>
                                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                </form>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                    </div>
                </div>
            </div>



            <!-- gave div id's do we can call the function at top to display and hide when we want -->
            <div id="disService" style="display: none;">
                <h4 style="color: wheat;">Services</h4>

                <!-- Used a dropdown list for products and services  -->
                <!--  when have database will have to import it to list instead  -->
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                        Select One
    <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">Some Stuff</li>
                        <li><a href="#">Skylights</a></li>
                        <li><a href="#">Vacuum Cleaners</a></li>
                        <li><a href="#">Barber</a></li>
                        <li><a href="#">CupCake</a></li>
                        <li><a href="#">Auto Sales</a></li>
                        <li><a href="#">Guns</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">Add More To list</li>
                        <li><a href="#">About Us</a></li>
                    </ul>
                </div>

            </div>

            <div id="disProduct" style="display: none;">
                <h4 style="color: white;">Products</h4>
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                        Select One
    <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">Some Stuff</li>
                        <li><a href="#">Apperal</a></li>
                        <li><a href="#">Food</a></li>
                        <li><a href="#">Hair</a></li>
                        <li><a href="#">Toys</a></li>
                        <li><a href="#">Auto Sales</a></li>
                        <li><a href="#">Home Decor</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">Add More To list</li>
                        <li><a href="#">About Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <h4 style="color: white;">We Can Show Results Here</h4>

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
