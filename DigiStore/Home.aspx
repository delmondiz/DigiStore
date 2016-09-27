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
            <a id="logo-container" href="Home.aspx" class="brand-logo center yellow-text accent-3">DigiStore</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="Home.aspx" class="yellow-text accent-3">Home</a></li>
                <li><a href="Map.aspx" class="yellow-text accent-3">Search</a></li>
                <li><a href="#" class="yellow-text accent-3">Sales</a></li>
                <li><a class="dropdown-button centered" href="#" data-activates="accountDropdown" style="height:100%">
                    <img class="circle" src="/img/icon.png" height="30" width="30" /></a></li>
            </ul>

            <ul id="nav-mobile" class="side-nav">
                <h4 class="center blue-text darken-3">Menu</h4>
                <li>
                    <div class="divider"></div>
                </li>
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="Map.aspx">Search</a></li>
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
                <li><a href="ViewCart.aspx">Cart</a></li>
                <li><a href="#">Order History</a></li>
                
                <li><a href="#">Log In/Out</a></li>
            </ul>
        </div>
    </nav>

    <div class="section no-pad-bot">
        <div class="container">

            <h1 class="header center blue-text darken-3">Featured Shops</h1>

        </div>
    </div>

    <div class="container">
            <div class="center col l12 m12 s12">
                <div class="carousel">
                    <a class="carousel-item" href="#one!">
                        <img src="http://lorempixel.com/250/250/nature/1"></a>
                    <a class="carousel-item" href="#two!">
                        <img src="http://lorempixel.com/250/250/nature/2"></a>
                    <a class="carousel-item" href="#three!">
                        <img src="http://lorempixel.com/250/250/nature/3"></a>
                    <a class="carousel-item" href="#four!">
                        <img src="http://lorempixel.com/250/250/nature/4"></a>
                    <a class="carousel-item" href="#five!">
                        <img src="http://lorempixel.com/250/250/nature/5"></a>
                </div>
        </div>
        <div class="section">
            <div class="row">
                <div class="col s12">
                    <ul class="tabs">
                        <li class="tab col s3"><a href="#highestRating">Highest Rated Stores</a></li>
                        <li class="tab col s3"><a href="#mostPopular">Most Popular Stores</a></li>
                        <li class="tab col s3"><a href="#newestStores">Newest Stores</a></li>
                        <li class="tab col s3"><a href="#random">Random</a></li>
                    </ul>
                </div>
                <div id="highestRating" class="col s12">
                    <ul class="collection">
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/kijiji.png" alt="Kijiji" class="circle" />
                                <span class="title">Kijiji</span>
                                <p>A site where people can connect with others in their community.</p>
                                <p>Products: Everything.</p>
                            </li>
                        </a>
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/aliexpress.png" alt="AliExpress" class="circle" />
                                <span class="title">AliExpress</span>
                                <p>Online shopping marketplace.  Buy directly from the source!</p>
                                <p>Products: Everything.</p>
                            </li>
                        </a>
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/steam.png" alt="Steam" class="circle" />
                                <span class="title">Steam</span>
                                <p>The ultimate place for all your gaming needs.</p>
                                <p>Products: Video Games, Video Game Hardware.</p>
                            </li>
                        </a>
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/amazon.png" alt="Amazon" class="circle" />
                                <span class="title">Amazon</span>
                                <p>Earth's most customer-centric company.  Discover anything you want online!</p>
                                <p>Products: Everything.</p>
                            </li>
                        </a>
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/ebay.png" alt="Ebay" class="circle" />
                                <span class="title">Ebay</span>
                                <p>Connecting buyers and sellers globally since 1995.</p>
                                <p>Products: Everything.</p>
                            </li>
                        </a>
                    </ul>
                </div>
                <div id="mostPopular" class="col s12">
                    <ul class="collection">
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/aliexpress.png" alt="AliExpress" class="circle" />
                                <span class="title">AliExpress</span>
                                <p>Online shopping marketplace.  Buy directly from the source!</p>
                                <p>Products: Everything.</p>
                            </li>
                        </a>
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/amazon.png" alt="Amazon" class="circle" />
                                <span class="title">Amazon</span>
                                <p>Earth's most customer-centric company.  Discover anything you want online!</p>
                                <p>Products: Everything.</p>
                            </li>
                        </a>
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/ebay.png" alt="Ebay" class="circle" />
                                <span class="title">Ebay</span>
                                <p>Connecting buyers and sellers globally since 1995.</p>
                                <p>Products: Everything.</p>
                            </li>
                        </a>
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/steam.png" alt="Steam" class="circle" />
                                <span class="title">Steam</span>
                                <p>The ultimate place for all your gaming needs.</p>
                                <p>Products: Video Games, Video Game Hardware.</p>
                            </li>
                        </a>
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/kijiji.png" alt="Kijiji" class="circle" />
                                <span class="title">Kijiji</span>
                                <p>A site where people can connect with others in their community.</p>
                                <p>Products: Everything.</p>
                            </li>
                        </a>
                    </ul>
                </div>
                <div id="newestStores" class="col s12">
                    <ul class="collection">
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/aliexpress.png" alt="AliExpress" class="circle" />
                                <span class="title">AliExpress</span>
                                <p>Online shopping marketplace.  Buy directly from the source!</p>
                                <p>Products: Everything.</p>
                            </li>
                        </a>
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/kijiji.png" alt="Kijiji" class="circle" />
                                <span class="title">Kijiji</span>
                                <p>A site where people can connect with others in their community.</p>
                                <p>Products: Everything.</p>
                            </li>
                        </a>
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/steam.png" alt="Steam" class="circle" />
                                <span class="title">Steam</span>
                                <p>The ultimate place for all your gaming needs.</p>
                                <p>Products: Video Games, Video Game Hardware.</p>
                            </li>
                        </a>
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/ebay.png" alt="Ebay" class="circle" />
                                <span class="title">Ebay</span>
                                <p>Connecting buyers and sellers globally since 1995.</p>
                                <p>Products: Everything.</p>
                            </li>
                        </a>
                        <a href="#">
                            <li class="collection-item avatar">
                                <img src="img/amazon.png" alt="Amazon" class="circle" />
                                <span class="title">Amazon</span>
                                <p>Earth's most customer-centric company.  Discover anything you want online!</p>
                                <p>Products: Everything.</p>
                            </li>
                        </a>
                    </ul>
                </div>
                <div id="random" class="col s12">
                    <ul class="collection">
                        <a href="#">
                            <li class="collection-item avatar">
                               <img src="img/help.png" alt="Random" class="circle" />
                                <span class="title">Click here for a random store!</span>
                                <p>Feeling lucky?</p>
                            </li>
                        </a>
                    </ul>
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

    <script type="text/javascript" src="js/init.js"></script>

</body>
</html>
