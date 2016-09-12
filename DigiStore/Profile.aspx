﻿<html class="" lang="en">
<head>
    <title>DigiStore</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0" />


    <!-- All the sources needed and try and make it look pretty -->
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <!--
      SO jQuery must be loaded before materialize. I will never forget this, and nither should you!  
      -->
    <script src="https://code.jquery.com/jquery-3.1.0.min.js" integrity="sha256-cCueBR6CsyA4/9szpPfrX3s49M9vUU5BgtiJj06wt/s=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>

    <!-- Materialize Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Custom CSS  -->
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />

</head>

<body>
    <nav class="blue darken-3" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container" href="#" class="brand-logo left yellow-text accent-3">DigiStore</a>
            <ul class="right">
                <li><a href="#" class="yellow-text accent-3">Join</a></li>
                <li><a href="#" class="yellow-text accent-3">Sign In</a></li>
            </ul>



        </div>
    </nav>



    <div class="container">
        <div class="section">

            <div class="row">
                <div class="section no-pad-bot" id="index-banner">
                    <h1 class="header center blue-text darken-3">Username's Profile</h1>
                </div>
                <ul class="collapsible" data-collapsible="accordion">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">filter_drama</i>General</div>
                        <div class="collapsible-body">
                            <p>
                                Edit your information here.<br /><br />
                                <input placeholder="Bob Barker" id="name" type="text" class="validate">
                                <input placeholder="bobbarker@gmail.com" id="email" type="text" class="validate">
                                <input placeholder="555 Main St." id="address" type="text" class="validate">
                            </p>
                            <p><input placeholder="Old Password" id="old_pass" type="text" class="validate">
                            <input placeholder="New Password" id="new_pass" type="text" class="validate">                        
                            <p><a class="waves-effect waves-light btn">Save Changes</a></p>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">whatshot</i>Payment</div>
                        <div class="collapsible-body">
                            <p>
                                <input placeholder="Card Number: 5555 5555 5555 5555" id="card_number" type="text" class="validate">
                                <input placeholder="Expiry Date: TODAY!!?!??!" id="expiry" type="text" class="validate">
                                <input placeholder="Cardholder Name: Bob Barker" id="cardholder" type="text" class="validate">
                            </p>
                            <p><a class="waves-effect waves-light btn">Save Changes</a></p>
                        </div>
                    </li>
                     <li>
                        <div class="collapsible-header"><i class="material-icons">place</i>Order History</div>
                        <div class="collapsible-body">
                            <p>Nothing yet, you cheap fucker!</p>
                            <p><a href="Link to Order History Page">View All</a></p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <br>
        <br>

        <div class="section">
        </div>
    </div>

    <footer class="page-footer blue darken-3">
        <div class="container">
            <div class="row">
                <div class="col l6 s12">
                    <h5 class="yellow-text accent-3">Company Bio</h5>
                    <p class="grey-text text-lighten-4">We are a team of college students working on this project like it's our full time job. Any amount would help support and continue development on this project and is greatly appreciated.</p>


                </div>
                <div class="col l3 s12">
                    <h5 class="yellow-text">Settings</h5>
                    <ul>
                        <li><a class="white-text" href="#!">Link 1</a></li>
                        <li><a class="white-text" href="#!">Link 2</a></li>
                        <li><a class="white-text" href="#!">Link 3</a></li>
                        <li><a class="white-text" href="#!">Link 4</a></li>
                    </ul>
                </div>
                <div class="col l3 s12">
                    <h5 class="yellow-text">Connect</h5>
                    <ul>
                        <li><a class="white-text" href="#!">Link 1</a></li>
                        <li><a class="white-text" href="#!">Link 2</a></li>
                        <li><a class="white-text" href="#!">Link 3</a></li>
                        <li><a class="white-text" href="#!">Link 4</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                Made by <a class="yellow-text accent-3" href="http://materializecss.com">Materialize</a>
            </div>
        </div>
    </footer>


    <script type="text/javascript" src="js/init.js"></script>

</body>
</html>

