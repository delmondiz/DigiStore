<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="DigiStore.ViewCart" %>

<!DOCTYPE html>

<html class="" lang="en">
<head>
    <head>
    <!-- All the sources needed and try and make it look pretty -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Digital Store Front</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="../Styles/newcss.css">
    <link rel="stylesheet" href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
    <link href="Style/StyleSheet.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <style>
body {
     background-image: url('Images/Storefront.jpg');
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

    <div id="container_demo">
        <div id="wrapper">
            <h1 style="color: white;">Your Cart</h1>
        </div>
        <div class="col-sm-3">
            <h4 style="color: white;">Here Whats In Your Cart</h4>
            <div class="row">
            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="#">
                    <img class="img-responsive" src="http://placehold.it/400x300" alt="">
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="#">
                    <img class="img-responsive" src="http://placehold.it/400x300" alt="">
                </a>
            </div>
            
        </div>

        </div>
        <div class="col-sm-4">
            <h4 style="color: green;">Cart Total:</h4>
            	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:50%">Product</th>
							<th style="width:10%">Price</th>
							<th style="width:8%">Quantity</th>
							<th style="width:22%" class="text-center">Subtotal</th>
							<th style="width:10%"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="http://placehold.it/100x100" alt="..." class="img-responsive"/></div>
									<div class="col-sm-5">
										<h7 class="nomargin">Product 1</h7>
		
									</div>
								</div>
							</td>
							<td data-th="Price">$1.99</td>
							<td data-th="Quantity">
								<input type="number" class="form-control text-center" value="1">
							</td>
							<td data-th="Subtotal" class="text-center">1.99</td>
							<td class="actions" data-th="">
								<button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
								<button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
							</td>
						</tr>
                        <tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="http://placehold.it/100x100" alt="..." class="img-responsive"/></div>
									<div class="col-sm-5">
										<h7 class="nomargin">Product 2</h7>
		
									</div>
								</div>
							</td>
							<td data-th="Price">$11.99</td>
							<td data-th="Quantity">
								<input type="number" class="form-control text-center" value="1">
							</td>
							<td data-th="Subtotal" class="text-center">11.99</td>
							<td class="actions" data-th="">
								<button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
								<button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>Total 13.98</strong></td>
						</tr>
						<tr>
							<td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong>Total $13.98</strong></td>
							<td><a href="#" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>

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
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
    <script>
        $(document).foundation();
    </script>
    <script type="text/javascript" src="https://intercom.zurb.com/scripts/zcom.js"></script>
</body>
</html>
