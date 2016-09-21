<html class="" lang="en">
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
    <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
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
                <li><a href="#" class="yellow-text accent-3">Home</a></li>
                <li><a href="#" class="yellow-text accent-3">Search</a></li>
                <li><a href="#" class="yellow-text accent-3">Sales</a></li>
                <li><a href="#" class="yellow-text accent-3">Profile</a></li>
            </ul>
        </div>
    </nav>



    <div class="container">
        <div class="section">
            <div class="row">

                <div class="parallax-container">
                    <div class="parallax">
                        <div class="parallax">
                            <img src="img/store.jpg">
                        </div>
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

                <div class="col l6 m6 s12">
                    <ul class="collapsible" data-collapsible="accordion">
                        <li>
                            <div class="collapsible-header active">Store Information</div>
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
                            <div class="collapsible-header">Store Hours</div>
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
                            <div class="collapsible-header active">Reviews</div>
                            <div class="collapsible-body">
                                <p>Populated from Database.</p>
                            </div>
                        </li>

                        <li>
                            <div class="collapsible-header">Rate this store</div>
                            <div class="collapsible-body">
                                <p class="range-field">
                                    Select a rating between 1 - 5.
                                    <input type="range" id="test5" min="1" max="5" />
                                    
                                    <textarea id="textarea1" class="materialize-textarea"></textarea>
                                    <label for="textarea1">Textarea</label>
                                    <br />
                                    <button class="btn waves-effect waves-light" type="submit" name="action">
                                        Submit<i class="material-icons right">send</i>
                                    </button>
                                </p>

                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <ul class="collection with-header">
                <li class="collection-header">
                    <div class="section white">
                        <div class="row container">
                            <h5 class="header">Products</h5>
                            <div class="col s12 m7">
                                <div class="card horizontal">
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


    <script type="text/javascript" src="js/parallax.js"></script>


</body>
</html>
