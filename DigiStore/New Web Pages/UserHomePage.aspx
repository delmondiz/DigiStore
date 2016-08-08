<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHomePage.aspx.cs" Inherits="DigiStore.New_Web_Pages.UserHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DigiStore</title>
    <style>
        #FooterTag {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  padding: 1rem;
  background-color: red;
  text-align: center;
}
        #HeaderTag {
            background-color: red;

        }
        #footerbtn {
            background-color: white;
            color: black;
        }
        .ui-page, .ui-body-c, .ui-page-active, .ui-overlay-c, .ui-mobile-viewport
{
    background: transparent !important;
}
        #pageone > .ui-panel-wrapper {
            background-image: url('../Images/Storefront3.jpg') !important;
             background-repeat: repeat-y !important;
            background-position: center center !important;
            background-attachment: scroll !important;
            background-size: 100% 100% !important
        }
        
    </style>
     <!-- Include meta tag to ensure proper rendering and touch zooming -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Include jQuery Mobile stylesheets -->
  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
  <!-- Include the jQuery library -->
  <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <!-- Include the jQuery Mobile library -->
  <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
     <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
    <link rel="stylesheet" href="css/bootstrap-image-gallery.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="../Styles/newcss.css">
    <link rel="stylesheet" href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
    <link href="Style/StyleSheet.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script>
         <!-- Code Here changes the page features (HIDE AND SHOW) data role -->
        $(document).ready(function () {

            $("#Items").click(function () {
                $("#Item").show();
            });

                      
        });
    </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script>
		$( document ).on( "pageinit", "#demo-page", function() {

			$( document ).on( "swipeleft swiperight", "#demo-page", function( e ) {
				// We check if there is no open panel on the page because otherwise
				// a swipe to close the left panel would also open the right panel (and v.v.).
				// We do this by checking the data that the framework stores on the page element (panel: open).
				if ( $.mobile.activePage.jqmData( "panel" ) !== "open" ) {
					if ( e.type === "swipeleft"  ) {
						$( "#right-panel" ).panel( "open" );
					} else if ( e.type === "swiperight" ) {
						$( "#left-panel" ).panel( "open" );
					}
				}
			});
		});
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="back">
        <div data-role="page" id="pageone">
 <div id="HeaderTag" data-role="header">
    <h1>DigiStore</h1>
      <a href="#left-panel" data-theme="d" data-icon="arrow-r" data-iconpos="notext" data-shadow="false" data-iconshadow="false" class="ui-icon-nodisc">Open left panel</a>
     <a href="#right-panel" class="ui-icon-nodisc">Hello (Username)</a>
     <ul class="nav navbar-nav navbar-right">
            <!-- nav bar items   -->
            <!-- Class badge give the items the # we can use do $(this).text()); to update and modify text-->
            <
            <li><a href="ViewCart.aspx" id="Items"><span class="glyphicon glyphicon-user"></span>Cart Items<span class="badge">2</span></a></li>
           
        </ul>
  </div>
            <div data-role="panel" id="left-panel" data-theme="b">
        <p>Left reveal panel.</p>
                 <ul class="submenu menu vertical is-dropdown-submenu first-sub" data-submenu="" aria-hidden="true" tabindex="-1" role="menu">
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Home.aspx" tabindex="-1">Home</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Login.aspx" tabindex="-1" >Browse</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Register.aspx" tabindex="-1" >Categories</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="ContactUs.aspx" tabindex="-1" >Whats Hot!</a></li>
                </ul>
        <a href="#" data-rel="close" data-role="button" data-mini="true" data-inline="true" data-icon="delete" data-iconpos="right">Close</a>
    </div><!-- /panel -->
            <div data-role="panel" id="right-panel" data-theme="b" data-position="right">
        <p>Right reveal panel.</p>
                 <ul class="submenu menu vertical is-dropdown-submenu first-sub" data-submenu="" aria-hidden="true" tabindex="-1" role="menu">
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Home.aspx" tabindex="-1">Anything</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Login.aspx" tabindex="-1" >Cart</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Register.aspx" tabindex="-1" >Manage Profile</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="ContactUs.aspx" tabindex="-1" >LogOut</a></li>
                </ul>
        <a href="#" data-rel="close" data-role="button" data-mini="true" data-inline="true" data-icon="delete" data-iconpos="right">Close</a>
    </div><!-- /panel -->

 <div data-role="main" class="ui-content">
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

     <div id="Item" style="display: none;">
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


    
		
              <div id="FooterTag" data-role="footer" class="ui-bar">
    <footer>
        <div id="navcontainer">
            
                <a href="#" id="footerbtn" data-role="button"  data-icon="star">Contact</a>
                <a href="#" id="footerbtn"  data-role="button"  data-icon="info">About</a>
                <a href="#" id="footerbtn"  data-role="button">Employment</a>
                <a href="#" id="footerbtn"  data-role="button"  data-icon="alert">Legal</a>
           
        </div>
        <script>
        $(document).foundation();
    </script>
    <script type="text/javascript" src="https://intercom.zurb.com/scripts/zcom.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="//blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
    <script src="js/bootstrap-image-gallery.min.js"></script>
    </footer>
</div>
        </div>




 
    
    </div>
            
  
       </div>

     
    </form>
</body>
</html>