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
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="Map.aspx">Browse</a></li>
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
                <li><a href="ViewCart">Cart</a></li>
                <li><a href="#">Order History</a></li>
                
                <li>Log In/Out</li>
            </ul>
        </div>
    </nav>
    <!-- registration form  -->
    <div class="container">
        <form class="row">
            <div class="col s12">
                <div class="row center">
                    <div class="col s12">
                        <h1>Sign up</h1>
                    </div>
                    <div class="col s12">
                        <h5>Already a member? <a href="Login.aspx" class="btn waves-light blue darken-3 yellow-text accent-3 truncate" style="width:100%">Log In!</a></h5>
                    </div>
                </div>
                    <div class="row">
                        <div class="col s12 center">
                            <h2 style="margin-top:0">Account Information</h2>
                            <div class="divider"></div>
                        </div>
                        <div class="input-field col s8">
                            <label for="username">Username*</label>
                            <input type="text" placeholder="coolone1234" id="username" required="required" />
                        </div>
                        <div class="col s4">
                            <a href="#" id="checkUsername" class="btn-large waves-effect blue darken-3 yellow-text accent-3" style="padding:0; width:100%">Check Username</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <label for="password">Password*</label>
                            <input type="password" placeholder="hunter2" id="password" required="required" />
                        </div>
                        <div class="input-field col s6">
                            <label for="confirmPassword">Confirm Password*</label>
                            <input type="password" placeholder="hunter2" id="confirmPassword" required="required" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <label for="firstName">First Name*</label>
                            <input type="text" placeholder="John" id="firstName" required="required" />
                        </div>
                        <div class="input-field col s6">
                            <label for="lastName">Last Name*</label>
                            <input type="text" placeholder="Doe" id="lastName" required="required" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <label for="email">E-mail*</label>
                            <input type="email" placeholder="example@hotmail.com" id="email" required="required" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 center">
                            <h2 style="margin-top:0">Personal Information</h2>
                            <div class="divider"></div>
                        </div>
                        <div class="input-field col s12 l4">
                            <label for="addressCity">Town/City*</label>
                            <input type="text" placeholder="Toronto" id="addressCity" required="required" />
                        </div>
                        <div class="input-field col s12 l4">
                            <label for="addressProvince">State/Province*</label>
                            <input type="text" placeholder="Ontario" id="addressProvince" required="required" />
                        </div>
                        <div class="input-field col s12 l4">
                            <label for="addressPostal">Postal Code*</label>
                            <input type="text" placeholder="H0H0H0" id="addressPostal" required="required" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <label for="addressStreet">Address</label>
                            <input type="text" placeholder="9 Sussex Street" id="addressStreet" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <input type="submit" value="Sign up" id="submitSignup" class="btn waves-light blue darken-3 yellow-text accent-3" style="width:100%" />
                        </div>
                    </div>
                </div>
        </form>
    </div>
        <footer class="page-footer blue darken-3">
        <div class="container">
            <div class="row">
                <div class="col l6 s12">
                    <h5 class="yellow-text accent-3">Company Bio</h5>
                    <p class="grey-text text-lighten-4">We are a team of college students working on this project like it's our full time job. Any amount would help support and continue development on this project and is greatly appreciated.</p>
                </div>
                <div class="col l3 m3 s12">
                    <h5 class="yellow-text accent-3">Settings</h5>
                    <ul>
                        <li><a class="white-text" href="#!">Link 1</a></li>
                        <li><a class="white-text" href="#!">Link 2</a></li>
                        <li><a class="white-text" href="#!">Link 3</a></li>
                        <li><a class="white-text" href="#!">Link 4</a></li>
                    </ul>
                </div>
                <div class="col l3 m3 s12">
                    <h5 class="yellow-text accent-3">Connect</h5>
                    <ul>
                        <li><a class="white-text" href="#!">Link 1</a></li>
                        <li><a class="white-text" href="#!">Link 2</a></li>
                        <li><a class="white-text" href="#!">Link 3</a></li>
                        <li><a class="white-text" href="#!">Link 4</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="footer-copyright blue darken-4">
            <div class="container yellow-text accent-3">
                <p>Made by Oceans4 | Powered by <a class="orange-text text-lighten-3" href="http://materializecss.com">Materialize</a></p>
            </div>
        </div>
    </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
