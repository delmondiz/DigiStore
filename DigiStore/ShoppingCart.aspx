<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
            <a id="logo-container" href="#" class="brand-logo center yellow-text accent-3">DigiStore</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="sass.html"><i class="material-icons left">shopping_cart</i><span class="new badge">4</span></a></li>

            </ul>

            <ul id="nav-mobile" class="side-nav">
                <h4 class="center blue-text darken-3">Menu</h4>
                <hr />
                <li><a href="#">Home</a></li>
                <li><a href="#">Search</a></li>
                <li><a href="#">Sales</a></li>
                <li><a href="#">Profile</a></li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
        </div>
    </nav>

    <div class="container">
        <div class="section">
            <ul class="collapsible collapsible-accordion" data-collapsible="accordion">

                <li class="">
                    <div class="collapsible-header">
                        <i class="material-icons">
                            <img src="img/download.jpg" height="28" width="43" /></i>Beauty
                    </div>
                    <div class="collapsible-body">
                        <div class="row">
                            <div class="col s2">

                                <img src="img/download.jpg" />
                            </div>
                            <div class="col s3">
                                <p>Here We can put the deatail of this cup cake it does look mighty delicious man im hungry</p>
                            </div>
                            <div class="col s2">
                                <br />
                                <a href="#">Remove</a><br />
                                <br />
                                <a href="#">Edit</a>
                            </div>
                             <div class="col s2"> 
                                <td class="product-cart-actions" data-rwd-label="Qty">
                                    <p>Quantity</p>
                                    <input type="number" pattern="\d*" name="cart[184090][qty]" value="1" size="4" data-cart-item-id="GGR-T7P-M" title="Qty" class="input-text qty" maxlength="12">
                                    <button type="submit" name="update_cart_action" data-cart-item-update="" value="update_qty" title="Update" class="button btn-update hide">
                                        <span><span>Update</span></span>
                                    </button>
                                    <ul class="cart-links hide">
                                        <li></li>
                                    </ul>
                                </td>
                                 <a href="#">update</a><br />
                            </div>
                            <br />
                            <div class="col s2">price: $5.99</div>
                        </div>


                    </div>

                </li>
                <li class="">
                    <div class="collapsible-header">
                        <i class="material-icons">
                            <img src="img/download%20(1).jpg" height="28" width="43" /></i>Lovley
                    </div>
                    <div class="collapsible-body">
                        <div class="row">
                            <div class="col s3">

                                <img src="img/download%20(1).jpg" />
                            </div>
                            <div class="col s3">
                                <p>Here We can put the deatail of this cup cake it does look mighty delicious man im hungry</p>
                            </div>
                            <div class="col s2">
                                <br />
                                <a href="#">Remove</a><br />
                                <br />
                                <a href="#">Edit</a>
                            </div>
                            <div class="col s2"> 
                                <td class="product-cart-actions" data-rwd-label="Qty">
                                    <p>Quantity</p>
                                    <input type="number" pattern="\d*" name="cart[184090][qty]" value="1" size="4" data-cart-item-id="GGR-T7P-M" title="Qty" class="input-text qty" maxlength="12">
                                    <button type="submit" name="update_cart_action" data-cart-item-update="" value="update_qty" title="Update" class="button btn-update hide">
                                        <span><span>Update</span></span>
                                    </button>
                                    <ul class="cart-links hide">
                                        <li></li>
                                    </ul>
                                </td>
                                 <a href="#">update</a><br />
                            </div>
                            <div class="col s2">price: $5.99</div>
                        </div>


                    </div>
                </li>
                <li class="">
                    <div class="collapsible-header">
                        <i class="material-icons">
                            <img src="img/images%20(1).jpg" height="28" width="43" /></i>Crazy
                    </div>
                    <div class="collapsible-body">
                        <div class="row">
                            <div class="col s2">

                                <img src="img/images%20(1).jpg" />
                            </div>
                            <div class="col s3">
                                <p>Here We can put the deatail of this cup cake it does look mighty delicious man im hungry</p>
                            </div>
                            <div class="col s2">
                                <br />
                                <a href="#">Remove</a><br />
                                <br />
                                <a href="#">Edit</a>
                            </div>
                             <div class="col s2"> 
                                <td class="product-cart-actions" data-rwd-label="Qty">
                                    <p>Quantity</p>
                                    <input type="number" pattern="\d*" name="cart[184090][qty]" value="1" size="4" data-cart-item-id="GGR-T7P-M" title="Qty" class="input-text qty" maxlength="12">
                                    <button type="submit" name="update_cart_action" data-cart-item-update="" value="update_qty" title="Update" class="button btn-update hide">
                                        <span><span>Update</span></span>
                                    </button>
                                    <ul class="cart-links hide">
                                        <li></li>
                                    </ul>
                                </td>
                                 <a href="#">update</a><br />
                            </div>
                            <div class="col s2">price: $5.99</div>
                        </div>


                    </div>
                </li>
                <li class="">
                    <div class="collapsible-header">
                        <i class="material-icons">
                            <img src="img/images.jpg" height="28" width="43" /></i>Nasty
                    </div>
                    <div class="collapsible-body">
                        <div class="row">
                            <div class="col s2">

                                <img src="img/images.jpg" />
                            </div>
                            <div class="col s3">
                                <p>Here We can put the deatail of this cup cake it does look mighty delicious man im hungry</p>
                            </div>
                            <div class="col s2">
                                <br />
                                <a href="#">Remove</a><br />
                                <br />
                                <a href="#">Edit</a>
                            </div>
                             <div class="col s2"> 
                                <td class="product-cart-actions" data-rwd-label="Qty">
                                    <p>Quantity</p>
                                    <input type="number" pattern="\d*" name="cart[184090][qty]" value="1" size="4" data-cart-item-id="GGR-T7P-M" title="Qty" class="input-text qty" maxlength="12">
                                    <button type="submit" name="update_cart_action" data-cart-item-update="" value="update_qty" title="Update" class="button btn-update hide">
                                        <span><span>Update</span></span>
                                    </button>
                                    <ul class="cart-links hide">
                                        <li></li>
                                    </ul>
                                </td>
                                 <a href="#">update</a><br />
                            </div>
                            <div class="col s2">price: $5.99</div>
                        </div>


                    </div>

                </li>
            </ul>

        </div>
        
            <button type="button" title="Proceed to Checkout" class="button waves-effect waves-light btn red accent-4  btn-proceed-checkout btn-checkout"><span><span>Proceed to Checkout</span></span></button>
       

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
