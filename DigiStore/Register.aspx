<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DigiStore.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
</head>
<body>
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
    <div class="container">
        <form class="row">
            <div class="col s12">
                <div class="row center valign-wrapper">
                    <div class="col s12 l6 valign">
                        <h1>Sign up</h1>
                    </div>
                    <div class="col s12 l6 valign">
                        <h5>Already a member? <a href="Login.aspx" class="btn waves-light" style="width:100%">Go to Log In!</a></h5>
                    </div>
                </div>
                    <div class="row">
                        <div class="input-field col s10">
                            <label for="username">Username</label>
                            <input type="text" placeholder="coolone1234" id="username" required="required" />
                        </div>
                        <div class="col s2">
                            <input type="button" value="Check Username" id="confirmUsername" class="btn waves-effect" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <label for="password">Password</label>
                            <input type="password" placeholder="hunter2" id="password" required="required" />
                        </div>
                        <div class="input-field col s6">
                            <label for="confirmPassword">Confirm Password</label>
                            <input type="password" placeholder="hunter2" id="confirmPassword" required="required" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <label for="firstName">First Name</label>
                            <input type="text" placeholder="John" id="firstName" required="required" />
                        </div>
                        <div class="input-field col s6">
                            <label for="lastName">Last Name</label>
                            <input type="text" placeholder="Doe" id="lastName" required="required" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <label for="email">E-mail</label>
                            <input type="email" placeholder="example@hotmail.com" id="email" required="required" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 l4">
                            <label for="addressCity">Town/City</label>
                            <input type="text" placeholder="Toronto" id="addressCity" required="required" />
                        </div>
                        <div class="input-field col s12 l4">
                            <label for="addressProvince">State/Province</label>
                            <input type="text" placeholder="Ontario" id="addressProvince" required="required" />
                        </div>
                        <div class="input-field col s12 l4">
                            <input type="text" placeholder="H0H0H0" id="addressPostal" required="required" />
                            <label for="addressPostal">Postal Code</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input type="text" placeholder="9 Sussex Street" id="addressStreet" />
                            <label for="addressStreet">Address</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <input type="submit" value="Sign up" id="submitSignup" class="btn waves-light" style="width:100%" />
                        </div>
                    </div>
                </div>
        </form>
    </div>
    <!-- simple footer -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            Materialize.updateTextFields();
            $(".dropdown-button").dropdown();
            $(".button-collapse").sideNav();
        });
    </script>
</body>
</html>
