<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DigiStore.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>_Store_ Inventory</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
</head>
<body>
<ul id="accountDropdown" class="dropdown-content">
        <li>Manage Store</li>
        <li>Order History</li>
        <li>Settings</li>
        <li>Log In/Out</li>
    </ul>
    <nav>
        <nav class="blue darken-3" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container" href="#" class="brand-logo center yellow-text accent-3">DigiStore</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="#" class="yellow-text accent-3">Home</a></li>
                <li><a href="#" class="yellow-text accent-3">Search</a></li>
                <li><a href="#" class="yellow-text accent-3">Sales</a></li>
                <li><a class="dropdown-button centered" href="#" data-activates="accountDropdown">
                    <img class="circle" src="/img/icon.png" height="30" width="30" /></a></li>
            </ul>

            <ul id="nav-mobile" class="side-nav">
                <h4 class="center blue-text darken-3">Menu</h4>
                <li>
                    <div class="divider"></div>
                </li>
                <li><a href="#">Home</a></li>
                <li><a href="#">Browse</a></li>
                <li><a href="#">Cart</a></li>
                <li>
                    <div class="divider"></div>
                </li>
                <li><a href="#">Manage Store</a></li>
                <li><a href="#">Order History</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Log In/Out</a></li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>

            <ul id="accountDropdown" class="dropdown-content">
                <li>Manage Profile</li>
                <li>View Cart</li>
                <li>Order History</li>
                <li>Settings</li>
                <li>Log In/Out</li>
            </ul>
        </div>
    </nav>
    <!-- registration form  -->
    <form class="row">
        <div class="col s12">
            <div class="row">
                <div class="input-field col s6">
                    <input placeholder="John" id="firstName" />
                    <label for="firstName">First Name</label>
                </div>
                <div class="input-field col s6">
                    <input placeholder="Doe" id="lastName" />
                    <label for="lastName">Last Name</label>
                </div>
            </div>
        </div>
    </form>
    <div id="register" class="animate form">
			<form  action="UserHome.aspx" autocomplete="on"> 
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3d4spAr0FMskq0UBEVofzNutc9Q9lrig&callback=initMap&libraries=places,visualization" async defer></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            Materialize.updateTextFields();
            //$('select').material_select();
            //$(".dropdown-button").dropdown();
            //$(".button-collapse").sideNav();
            //$('.carousel').carousel();
            ////$('.carousel.carousel-slider').carousel();
            //$('.carousel.carousel-slider').carousel({ full_width: true });
        });
    </script>
</body>
</html>