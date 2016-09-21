<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DigiStore.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
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
                        <h1>Login</h1>
                    </div>
                    <div class="col s12 l6 valign">
                        <h5>Not a member? <br /> <a href="Register.aspx" class="btn waves-light" style="width:100%">Go to Sign up!</a></h5>
                    </div>
                </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <label for="username">Username</label>
                            <input type="text" placeholder="coolone1234" id="username" required="required" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <label for="password">Password</label>
                            <input type="password" placeholder="hunter2" id="password" required="required" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <input type="submit" value="Sign in" id="submitSignup" class="btn waves-light" style="width:100%" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <a href="ForgotPassword.aspx" class="btn waves-light amber" style="width:100%">Forgot Password?</a>
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
