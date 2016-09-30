 <html class="" lang="en">
<head>
    <title>DigiStore - Profile</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0" />

    <!-- All the sources needed and try and make it look pretty -->
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
    <link href="css/theme.css" rel="stylesheet" />
    <!-- Materialize Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Custom CSS  -->
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />

</head>

<body>
    <nav class="blue darken-3" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container" href="Home.aspx" class="brand-logo center yellow-text accent-3">DigiStore</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="Home.aspx" class="yellow-text accent-3">Home</a></li>
                <li><a href="Map.aspx" class="yellow-text accent-3">Search</a></li>
                
                <li><a class="dropdown-button centered" href="#" data-activates="accountDropdown" style="height:100%">
                    <img class="circle" src="/img/icon.png" height="30" width="30" /></a></li>
                <li><a href="3"><i class="material-icons left">shopping_cart</i><span class="new badge">4</span></a></li>
            </ul>

            <ul id="nav-mobile" class="side-nav">
                <h4 class="center blue-text darken-3">Menu</h4>
                <li>
                    <div class="divider"></div>
                </li>
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="Map.aspx">Search</a></li>
                <li><a href="ShoppingCart.aspx">Cart</a></li>
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
                <li><a href="ShoppingCart.aspx">Cart</a></li>
                <li><a href="#">Order History</a></li>
                
                <li><a href="#">Log In/Out</a></li>
            </ul>
        </div>
    </nav>



    <div class="container">
        <div class="section">

            <div class="row">
                <div class="section no-pad-bot" id="index-banner">
                    <h1 class="header center blue-text darken-3">Username's Profile</h1>
                </div>

                <div class="row">
                    <div class="card-panel blue darken-3">
                        <div class="card-content row">
                            <div class="col s12">
                                <div class="card">
                                    <div class="card-content">
                                        <span class="card-title"><i class="material-icons">settings</i>General</span>
                                        <br />
                                        <p class="row">
                                            <span class="col s6">
                                                <label for="firstname">First Name</label>
                                                <input type="text" placeholder="Bob" id="firstname" required="required" />
                                            </span>
                                            <span class="col s6">
                                            <label for="lastname">Last Name</label>
                                            <input type="text" placeholder="Barker" id="lastname" required="required" />
                                                </span>
                                            <span class="col s6">
                                            <label for="email">Email</label>
                                            <input type="text" placeholder="bobbarker@gmail.com" id="email" required="required" />
                                                </span>
                                            <span class="col s6">
                                            <label for="addressStreet">Street</label>
                                            <input type="text" placeholder="555 Main St." id="street" required="required" />
                                                </span>
                                            <span class="col s6">
                                            <label for="addressCity">Town/City</label>
                                            <input type="text" placeholder="Toronto" id="addressCity" required="required" />
                                                </span>
                                            <span class="col s6">
                                            <label for="addressProvince">State/Province</label>
                                            <input type="text" placeholder="Ontario" id="addressProvince" required="required" />
                                                </span>
                                            <span class="col s6">
                                            <label for="addressPostal">Postal Code</label>
                                            <input type="text" placeholder="ABC123" id="addressPostal" required="required" />
                                            <a class="waves-effect waves-light btn blue darken-3 yellow-text accent-3">Save Changes</a>
                                                </span>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="col s12">
                                <div class="card">
                                    <div class="card-content">
                                        <span class="card-title"><i class="material-icons">lock</i>Change Password</span>
                                        <br />
                                        <p>
                                            <input placeholder="Old Password" id="old_pass" type="text" class="validate">
                                            <input placeholder="New Password" id="new_pass" type="text" class="validate">
                                            <input placeholder="Confirm Password" id="confirm_pass" type="text" class="validate">
                                            <br />
                                            <a class="waves-effect waves-light btn blue darken-3 yellow-text accent-3">Save Changes</a>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="col s12">
                                <div class="card">
                                    <div class="card-content">
                                        <span class="card-title"><i class="material-icons">credit_card</i>Payment</span>
                                        <br />
                                        <p>
                                            <label for="cardholder">Cardholder</label>
                                            <input placeholder="Bob Barker" id="cardholder" type="text" class="validate">
                                            <label for="card_number">Card Number</label>
                                            <input placeholder="5555 5555 5555 5555" id="card_number" type="text" class="validate">
                                            <label for="expiry">Expiry Date</label>
                                            <input placeholder="TODAY!!?!??!" id="expiry" type="text" class="validate">
                                            <br />
                                            <a class="waves-effect waves-light btn blue darken-3 yellow-text accent-3">Save Changes</a>
                                        </p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
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

    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    <script type="text/javascript" src="js/init.js"></script>

</body>
</html>

