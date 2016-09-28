<html class="" lang="en">
<head>
    <title>DigiStore - Storepage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0" />


    <!-- All the sources needed and try and make it look pretty -->
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
    <link href="css/theme.css" rel="stylesheet" />
    <!-- Compiled and minified JavaScript -->
    <!--
      SO jQuery must be loaded before materialize. I will never forget this, and nither should you!  
      -->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>

    <!-- Materialize Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Custom CSS  -->
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />


    <style type="text/css">
        .auto-style1 {
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            position: fixed;
            width: 300px;
            left: -1;
            top: -152;
            -webkit-transform: translateX(-105%);
            transform: translateX(-105%);
            height: -moz-calc(100%);
            z-index: 999;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            overflow-y: auto;
            will-change: transform;
            margin: 0;
            padding-bottom: 60px;
            background-color: #fff;
        }
    </style>


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
            </ul>

            <ul id="nav-mobile" class="auto-style1">
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
                <div class="container col s12">
                    <div class="parallax-container">
                        <div class="parallax">
                            <img src="img/sample_store.jpg">
                        </div>
                    </div>

                    <div class="card-panel blue darken-3">
                        <h5 class="card-title yellow-text accent-3">Store Information</h5>
                        <div class="card-content row">
                            <div class="card col l6 m6 s12">
                                <div class="card-content">
                                    <span class="card-title">Contact</span>
                                    <p>
                                        100 Main St.
                                <br />
                                        Toronto, Ontario
                                <br />
                                        ABC123
                                <br />
                                        <br />
                                        (555) 555-5555
                                <br />
                                        <br />
                                        sample@gmail.com
                                    </p>
                                </div>
                            </div>

                            <div class="card col l6 m6 s12">
                                <div class="card-content">
                                    <span class="card-title">Store Hours</span>
                                    <p>
                                        Monday: 9am - 5pm<br />
                                        Tuesday: 9am - 5pm<br />
                                        Wednesday: 9am - 5pm<br />
                                        Thursday: 9am - 5pm<br />
                                        Friday: 9am - 5pm<br />
                                        Saturday: 9am - 5pm<br />
                                        Sunday: 9am - 5pm<br />
                                    </p>
                                </div>
                            </div>

                            <div class="card col l6 m6 s12">
                                <div class="card-content">
                                    <span class="card-title">Rate this store</span>
                                    <p class="range-field">
                                        Select a rating between 1 - 5.
                                        <input style="background-color: #1565c0" type="range" id="test5" min="1" max="5" />
                                    </p>
                                    <div class="input-field">
                                        <label for="textarea1">Leave a Review!</label>
                                        <textarea id="textarea1" class="materialize-textarea"></textarea>
                                    </div>
                                    <br />
                                    <div class="center-align">
                                        <button class="btn waves-effect waves-light blue darken-3 yellow-text accent-3" type="submit" name="action">
                                            Submit<i class="material-icons right">send</i>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="card col l6 m6 s12">
                                <div class="card-content">
                                    <span class="card-title">Reviews</span>
                                    <p>Populated from Database.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--
                    <div class="col l6 m6 s12" style="padding-left: 0px">
                        <ul class="collapsible" data-collapsible="accordion">
                            <li>
                                <div class="collapsible-header active blue darken-3 yellow-text accent-3">Store Information</div>
                                <div class="collapsible-body">
                                    <p>
                                        Monday: 9am - 5pm<br />
                                        <br />
                                        Tuesday: 9am - 5pm<br />
                                        <br />
                                        Wednesday: 9am - 5pm<br />
                                        <br />
                                        Thursday: 9am - 5pm<br />
                                        <br />
                                        Friday: 9am - 5pm<br />
                                        <br />
                                        Saturday: 9am - 5pm<br />
                                        <br />
                                        Sunday: 9am - 5pm<br />
                                        <br />
                                    </p>
                                </div>
                            </li>

                            <li>
                                <div class="collapsible-header blue darken-3 yellow-text accent-3">Store Hours</div>
                                <div class="collapsible-body">
                                    <p>
                                        Monday: 9am - 5pm<br />
                                        <br />
                                        Tuesday: 9am - 5pm<br />
                                        <br />
                                        Wednesday: 9am - 5pm<br />
                                        <br />
                                        Thursday: 9am - 5pm<br />
                                        <br />
                                        Friday: 9am - 5pm<br />
                                        <br />
                                        Saturday: 9am - 5pm<br />
                                        <br />
                                        Sunday: 9am - 5pm<br />
                                        <br />
                                    </p>
                                </div>
                            </li>
                        </ul>
                    </div> -->

                    <%--<div class="col l6 m6 s12" style="padding-right: 0px">
                        <ul class="collapsible" data-collapsible="accordion">
                            <li>
                                <div class="collapsible-header active blue darken-3 yellow-text accent-3">Reviews</div>
                                <div class="collapsible-body">
                                    <p>Populated from Database.</p>
                                </div>
                            </li>

                            <li>
                                <div class="collapsible-header blue darken-3 yellow-text accent-3">Rate this store</div>
                                <div class="container collapsible-body">
                                    <p class="range-field">
                                        Select a rating between 1 - 5.
                                        <input style="background-color: #1565c0" type="range" id="test5" min="1" max="5" />
                                    </p>
                                    <div class="input-field">
                                        <label for="textarea1">Leave a Review!</label>
                                        <textarea id="textarea1" class="materialize-textarea"></textarea>
                                    </div>
                                    <br />
                                    <div class="center-align">
                                        <button class="btn waves-effect waves-light blue darken-3 yellow-text accent-3" type="submit" name="action">
                                            Submit<i class="material-icons right">send</i>
                                        </button>
                                    </div>
                                    <br />
                                </div>
                            </li>
                        </ul>
                    </div>--%>
                </div>
            </div>

            <div class="card-panel blue darken-3">
                <h5 class="card-title yellow-text accent-3">Products</h5>
                <div class="card-content row">
                    <div class="card horizontal col s12 m6 l4">
                        <div class="card-image">
                            <img src="img/whitedressshirt.png" style="width: 125px">
                        </div>
                        <div class="card-stacked">
                            <div class="card-action">
                                Test Product
                            </div>
                            <div class="card-content">
                                <p>Description of Product.</p>
                            </div>
                        </div>
                    </div>
                    <div class="card horizontal col s12 m6 l4">
                        <div class="card-image">
                            <img src="img/whitedressshirt.png" style="width: 125px">
                        </div>
                        <div class="card-stacked">
                            <div class="card-action">
                                Test Product
                            </div>
                            <div class="card-content">
                                <p>Description of Product.</p>
                            </div>
                        </div>
                    </div>
                    <div class="card horizontal col s12 m6 l4">
                        <div class="card-image">
                            <img src="img/whitedressshirt.png" style="width: 125px">
                        </div>
                        <div class="card-stacked">
                            <div class="card-action">
                                Test Product
                            </div>
                            <div class="card-content">
                                <p>Description of Product.</p>
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
