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
        #back, #pageone {
            background-image: url('../Images/Storefront1.jpg') !important;
            background-repeat:repeat-y !important;
           background-position:center center !important;
           background-attachment:scroll !important;
          background-size:100% 100% !important;
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
    <script>
         <!-- Code Here changes the page features (HIDE AND SHOW) data role -->
        $(document).ready(function () {

            $("#login").click(function () {
                $("#homepage").hide();
                $("#registrationpage").hide();
                $("#loginpage").show();
                $("#contactpage").hide();
            });

            $("#home").click(function () {
                $("#homepage").show();
                $("#registrationpage").hide();
                $("#loginpage").hide();
                $("#contactpage").hide();
            });

            $("#register").click(function () {
                $("#homepage").hide();
                $("#registrationpage").show();
                $("#loginpage").hide();
                $("#contactpage").hide();
            });

            $("#contact").click(function () {
                $("#homepage").hide();
                $("#registrationpage").hide();
                $("#contactpage").show();
                $("#loginpage").hide();
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
  </div>
            <div data-role="panel" id="left-panel" data-theme="b">
        <p>Left reveal panel.</p>
                 <ul class="submenu menu vertical is-dropdown-submenu first-sub" data-submenu="" aria-hidden="true" tabindex="-1" role="menu">
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Home.aspx" tabindex="-1" id="home">Home</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Login.aspx" tabindex="-1" id="login">Browse</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Register.aspx" tabindex="-1" id="register">Categories</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="ContactUs.aspx" tabindex="-1" id="contact">Whats Hot!</a></li>
                </ul>
        <a href="#" data-rel="close" data-role="button" data-mini="true" data-inline="true" data-icon="delete" data-iconpos="right">Close</a>
    </div><!-- /panel -->
            <div data-role="panel" id="right-panel" data-theme="b" data-position="right">
        <p>Right reveal panel.</p>
                 <ul class="submenu menu vertical is-dropdown-submenu first-sub" data-submenu="" aria-hidden="true" tabindex="-1" role="menu">
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Home.aspx" tabindex="-1" id="home">Anything</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Login.aspx" tabindex="-1" id="login">Cart</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Register.aspx" tabindex="-1" id="register">Manage Profile</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="ContactUs.aspx" tabindex="-1" id="contact">LogOut</a></li>
                </ul>
        <a href="#" data-rel="close" data-role="button" data-mini="true" data-inline="true" data-icon="delete" data-iconpos="right">Close</a>
    </div><!-- /panel -->
 <div data-role="main" class="ui-content">
  


    
		
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
    </form>
</body>
</html>