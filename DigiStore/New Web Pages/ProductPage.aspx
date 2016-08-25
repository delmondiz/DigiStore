<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHomePage.aspx.cs" Inherits="DigiStore.New_Web_Pages.UserHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
      <!--title and style might need to move this to a style sheet page make it look neater -->
<head runat="server">
    <title>DigiStore</title>
    <style>

        #text {
            color: white;
        }
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
             background-image: url('../Images/Storefront5.jpg') ;//!important;
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
            $("#HomePage").click(function () {
                $("#Item").hide();
            });
            $('#UserServicesPage').click(function () {
                $("#DropdownServices").show();
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
      <a align="left" href="#left-panel" data-theme="d" data-icon="arrow-r" data-iconpos="notext" data-shadow="false" data-iconshadow="false" class="ui-icon-nodisc">Open left panel</a>
     <ul align="left" class="breadcrumbs">
<li><a href="#">Home</a></li>
<li><a href="#">Products</a></li>>
<li>
<span class="show-for-sr">Current: </span> STORE NAME
</li>
</ul>
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
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="UserHomePage.aspx" id="HomePage" tabindex="-1">Home</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Login.aspx" tabindex="-1" >Browse</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Register.aspx" tabindex="-1" >Categories</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="ContactUs.aspx" tabindex="-1" >Whats Hot!</a></li>
                </ul>
        <a href="#" data-rel="close" data-role="button" data-mini="true" data-inline="true" data-icon="delete" data-iconpos="right">Close</a>
    </div><!-- /panel -->
            <div data-role="panel" id="right-panel" data-theme="b" data-position="right">
        <p>Right reveal panel.</p>
                 <ul class="submenu menu vertical is-dropdown-submenu first-sub" data-submenu="" aria-hidden="true" tabindex="-1" role="menu">
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="#" tabindex="-1">Anything</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="#" tabindex="-1" >Cart</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="#" tabindex="-1" >Manage Profile</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="#" tabindex="-1" >LogOut</a></li>
                </ul>
        <a href="#" data-rel="close" data-role="button" data-mini="true" data-inline="true" data-icon="delete" data-iconpos="right">Close</a>
    </div><!-- /panel -->

 <div data-role="main" class="ui-content">
   <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="width: 100%">
            Select Location
    <select>
<option value="husker">Toronto</option>
<option value="starbuck">Brampton</option>
<option value="hotdog">Mississauaga</option>
<option value="apollo">Milton</option>
</select>
    </div>


       <!--this display the cart page which we will have to modify what has been clicked to display what the user acutlly puts *use this as a template* -->
     <div id="Item">
         <br />
    <div class="row">
<div class="medium-6 columns">
<img class="thumbnail" src="http://placehold.it/650x350">
<div class="row small-up-4">
</div>
</div>
<div class="medium-6 large-5 columns">
<h3>My Awesome Product</h3>
<p>here we type info about the product anything the customer wants </p>
<label>Size
<select>
<option value="husker">Small</option>
<option value="starbuck">Medium</option>
<option value="hotdog">Large</option>
<option value="apollo">Yeti</option>
</select>
</label>
<div class="row">
<div class="small-3 columns">
<label for="middle-label" class="middle">Quantity</label>
</div>
<div class="small-9 columns">
<input type="text" id="middle-label" placeholder="One fish two fish">
</div>
</div>
<a href="#" class="button large expanded">Add to cart</a>

</div>
</div>
       
      
        
    </div>

     <div>
         <br><br>
         <div class="column row">
<hr>
<ul class="tabs" data-tabs="1fkyx9-tabs" id="example-tabs">
<li class="tabs-title is-active" role="presentation"><a href="#panel1" aria-selected="true" role="tab" aria-controls="panel1" id="panel1-label">Reviews</a></li>
<li class="tabs-title" role="presentation"><a href="#panel2" role="tab" aria-controls="panel2" aria-selected="false" id="panel2-label">Similar Products</a></li>
</ul>
<div class="tabs-content" data-tabs-content="example-tabs">
<div class="tabs-panel is-active" id="panel1">
<h4>Reviews</h4>
<div class="media-object stack-for-small">
<div class="media-object-section">
<img class="thumbnail" src="http://placehold.it/200x200">
</div>
<div class="media-object-section">
<h5>Mike Stevenson</h5>
<p>THIS PRODUCT WAS SHIT IT GAVE ME BUBBLES AND SHIT CAME OUT LIQUID</p>
</div>
</div>
<div class="media-object stack-for-small">
<div class="media-object-section">
<img class="thumbnail" src="http://placehold.it/200x200">
</div>
<div class="media-object-section">
<h5>Mike Stevenson</h5>
<p>FOOD TASTE NICE BLESS UP FROM THE FAM UP</p>
</div>
</div>
<div class="media-object stack-for-small">
<div class="media-object-section">
<img class="thumbnail" src="http://placehold.it/200x200">
</div>
<div class="media-object-section">
<h5>Mike Stevenson</h5>
<p>I'm going to improvise. Listen, there's something you should know about me... about inception. An idea is like a virus, resilient, highly contagious. The smallest seed of an idea can grow. It can grow to define or destroy you</p>
</div>
</div>
<label>
My Review
<textarea placeholder="None"></textarea>
</label>
<button class="button">Submit Review</button>
</div>
<div class="tabs-panel" id="panel2">
<div class="row medium-up-3 large-up-5">
<div class="column">
<img class="thumbnail" src="http://placehold.it/350x200">
<h5>Other Product <small>$22</small></h5>
<p>In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam.</p>
<a href="#" class="button hollow tiny expanded">Buy Now</a>
</div>
<div class="column">
<img class="thumbnail" src="http://placehold.it/350x200">
<h5>Other Product <small>$22</small></h5>
<p>In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam.</p>
<a href="#" class="button hollow tiny expanded">Buy Now</a>
</div>
<div class="column">
<img class="thumbnail" src="http://placehold.it/350x200">
<h5>Other Product <small>$22</small></h5>
<p>In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam.</p>
<a href="#" class="button hollow tiny expanded">Buy Now</a>
</div>
<div class="column">
<img class="thumbnail" src="http://placehold.it/350x200">
<h5>Other Product <small>$22</small></h5>
<p>In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam.</p>
<a href="#" class="button hollow tiny expanded">Buy Now</a>
</div>
<div class="column">
<img class="thumbnail" src="http://placehold.it/350x200">
<h5>Other Product <small>$22</small></h5>
<p>In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam.</p>
<a href="#" class="button hollow tiny expanded">Buy Now</a>
</div>
</div>
</div>
</div>
</div>
       <div class="container">
             <!--Here im designing the footer *problem is its not showing have to fix it -->    
  <div class="row">
  

   
  </div>
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