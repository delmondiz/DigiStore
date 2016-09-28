<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Service Page.aspx.cs" Inherits="DigiStore.Service_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>

<!-- Materialize Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Custom CSS  -->
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />


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

    <div class="container">
        <div class="section">
            <div class="row">

                <div class="parallax-container">
                    <div class="parallax">
                        <img src="img/sample_store.jpg">
                    </div>
                </div>

                <ul class="collection with-header">
                    <li class="collection-header">
                        <div class="section white">
                            <div class="row container">
                                <h2 class="header">Store Name</h2>
                                <p class="grey-text text-darken-3 lighten-3">Description about the store here.</p>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="container col s12">
                    <div class="col l6 m6 s12">
                        <ul class="collapsible" data-collapsible="accordion">
                            <li>
                                <div class="collapsible-header active blue darken-3 yellow-text accent-3">Store Information</div>
                                <div class="collapsible-body">
                                    <p>
                                        1000 Main St.
                                <br />
                                        Toronto, Ontario
                                <br />
                                        (555) 555-5555
                                <br />
                                        sample@gmail.com
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

                    </div>

                    <div class="col l6 m6 s12">
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
                    </div>
                </div>
            </div>
            <div class="col l0 m6 s10">
                <ul class="collapsible" data-collapsible="accordion">
                    <li>
                        <div class="collapsible-header active blue darken-3 yellow-text accent-3">Book Service Appointment</div>
                        <div class="collapsible-body">
                            <p>Book Your Appointment </p>
                             <div class="input-field col s6">
                            <input type="date" value="click here to Select Date" class="datepicker" length="10">
                             </div>
                            <button type="button" title="Request Date" class="button waves-effect waves-light btn blue accent-4  btn-proceed-checkout btn-checkout"><span><span>Request Date</span></span></button>
                           
                        </div>
                    </li>

                    <li>
                        
                     
                    </li>
                </ul>
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
        <script>
            $('.datepicker').pickadate({
                selectMonths: true, // Creates a dropdown to control month
                selectYears: 15 // Creates a dropdown of 15 years to control year
            });
        </script>
</body>
</html>
