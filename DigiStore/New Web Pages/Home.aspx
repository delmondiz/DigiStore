<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DigiStore.New_Web_Pages.Home" %>

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
  </div>
            <div data-role="panel" id="left-panel" data-theme="b">
        <p>Left reveal panel.</p>
                 <ul class="submenu menu vertical is-dropdown-submenu first-sub" data-submenu="" aria-hidden="true" tabindex="-1" role="menu">
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Home.aspx" tabindex="-1" id="home">Home</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Login.aspx" tabindex="-1" id="login">Login</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Register.aspx" tabindex="-1" id="register">Register</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="ContactUs.aspx" tabindex="-1" id="contact">Contact</a></li>
                </ul>
        <a href="#" data-rel="close" data-role="button" data-mini="true" data-inline="true" data-icon="delete" data-iconpos="right">Close</a>
    </div><!-- /panel -->
 <div data-role="main" class="ui-content">
    <div id="homepage">
           <!-- title for this section -->
            <h4 style="color: red;">This Weeks Featured Stores</h4>
            <!-- this is the link to all the picture needed for the display//We can also add them locally to have out own display -->
            <div id="links">
                <a href="https://farm8.static.flickr.com/7111/26273035544_6237d0bbe7_b.jpg" title="Crimson Flower" data-gallery="">
                    <img src="https://farm8.static.flickr.com/7111/26273035544_6237d0bbe7_s.jpg" class="img-circle"></a><a href="https://farm8.static.flickr.com/7459/26614132050_605033e9d4_b.jpg" title="Shine a Light - Explore # 2" data-gallery=""><img src="https://farm8.static.flickr.com/7459/26614132050_605033e9d4_s.jpg" class="img-circle"></a><a href="https://farm8.static.flickr.com/7635/26859074676_bce1f41fcf_b.jpg" title="Happy Mother's Day!!!" data-gallery=""><img src="https://farm8.static.flickr.com/7635/26859074676_bce1f41fcf_s.jpg" class="img-circle"></a><a href="https://farm8.static.flickr.com/7548/26844176656_9aa41bfb27_b.jpg" title="Country Road Killdeer" data-gallery=""><img src="https://farm8.static.flickr.com/7548/26844176656_9aa41bfb27_s.jpg" class="img-circle"></a><a href="https://farm8.static.flickr.com/7691/26860556426_1c9990f48a_b.jpg" title="Blue Moon Butterfly" data-gallery=""><img src="https://farm8.static.flickr.com/7691/26860556426_1c9990f48a_s.jpg" class="img-circle"></a><a href="https://farm8.static.flickr.com/7001/26614711280_b0553988a2_b.jpg" title="Golden" data-gallery=""><img src="https://farm8.static.flickr.com/7001/26614711280_b0553988a2_s.jpg" class="img-circle"></a><a href="https://farm8.static.flickr.com/7580/26283695194_16345a4f4e_b.jpg" title="Muttertag" data-gallery=""><img src="https://farm8.static.flickr.com/7580/26283695194_16345a4f4e_s.jpg" class="img-circle"></a>
                <div id="blueimp-gallery" class="blueimp-gallery">
                    <!-- The container for the modal slides -->
                    <div class="slides"></div>
                    <!-- Controls for the borderless lightbox -->
                    <h3 class="title"></h3>
                    <a class="prev">‹</a>
                    <a class="next">›</a>
                    <a class="close">×</a>
                    <a class="play-pause"></a>
                    <ol class="indicator"></ol>
                    <!-- The modal dialog, which will be used to wrap the lightbox content -->
                    <div class="modal fade">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" aria-hidden="true">×</button>
                                    <h4 class="modal-title"></h4>
                                </div>
                                <div class="modal-body next"></div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default pull-left prev">
                                        <i class="glyphicon glyphicon-chevron-left"></i>
                                        Previous
                                    </button>
                                    <button type="button" class="btn btn-primary next">
                                        Next
                        <i class="glyphicon glyphicon-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>




                <br>
            </div>

  </div>
     <div id="registrationpage" style="display: none;">
		 <form   autocomplete="on"  > 
                
                <br />
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


     <div id="loginpage" style="display: none;">
          <form  autocomplete="on"  > 
              
                <br />
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
                <br />
				<p class="login button"> 
					<input type="submit" value="Login"  /> 
				</p>
				<p class="change_link">
					Not a member yet ?
					<a href="Register.aspx" class="to_register">Join us</a>
				</p>


          </form>
	
			
		
        </div>

        <div id="contactpage" style="display: none;">
            <br />
				<h1>im just writing a whole leap of foolishness i am assuming i can put like one of those fields like name email and question so we can contact them back and iw as thinking about doing a help page i think that would be smart</h1> 

        </div>


    
		
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
