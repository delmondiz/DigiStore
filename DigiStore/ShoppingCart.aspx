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
                <li><a href="#" class="yellow-text accent-3">Home</a></li>
                <li><a href="#" class="yellow-text accent-3">Search</a></li>
                <li><a href="#" class="yellow-text accent-3">Sales</a></li>
                <li><a href="3"><i class="material-icons left">shopping_cart</i><span class="new badge">4</span></a></li>
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
            <a href="#"  data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>

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
            <ul class="collapsible collapsible-accordion" data-collapsible="accordion">

                <li class="">
                    <div class="collapsible-header">
                        <i class="material-icons">
                            <img src="img/download.jpg" height="28" width="43" /></i>Beauty
                    </div>
                    <div class="collapsible-body">
                        <div class="row">
                            <div class="col s3">
                                <img  class="responsive-img" src="img/download.jpg" />
                            </div>
                            <div class="col s7 m3">
                                Here We can put the deatail of this cup cake it does look mighty delicious man im hungry
                            </div>
                            <br />
                            <div class="col s3 m2">  
                                <a href="#">Remove</a><br />
                                <br />
                                <a href="#">Edit</a>
                            </div>
                             <div class="col s4 m2"> 
                                <td class="product-cart-actions" data-rwd-label="Qty">
                                    <div><strong>Quantity</strong></div>
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
                            
                            <div class="col s4 m2"><strong>price:</strong>$5.99</div>
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

                                <img class="responsive-img" src="img/download%20(1).jpg" />
                            </div>
                            <div class="col s7 m3">
                                Here We can put the deatail of this cup cake it does look mighty delicious man im hungry
                            </div>
                            <div class="col s3 m2"> 
                                <br />
                                <a href="#">Remove</a><br />
                                <br />
                                <a href="#">Edit</a>
                            </div>
                            <div class="col s4 m2"> 
                                <td class="product-cart-actions" data-rwd-label="Qty">
                                   <div><strong>Quantity</strong></div>
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
                            <div class="col s4 m2"><strong>price:</strong>$5.99</div>
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
                            <div class="col s7 m3">

                                <img class="responsive-img" src="img/images%20(1).jpg" />
                            </div>
                            <div class="col s3">
                            Here We can put the deatail of this cup cake it does look mighty delicious man im hungry
                            </div>
                            <div class="col s3 m2"> 
                                <br />
                                <a href="#">Remove</a><br />
                                <br />
                                <a href="#">Edit</a>
                            </div>
                             <div class="col s4 m2"> 
                                <td class="product-cart-actions" data-rwd-label="Qty">
                                   <div><strong>Quantity</strong></div>
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
                           <div class="col s4 m2"><strong>price:</strong>$5.99</div>
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
                            <div class="col s3">

                                <img class="responsive-img" src="img/images.jpg" />
                            </div>
                             <div class="col s7 m3">
                             Here We can put the deatail of this cup cake it does look mighty delicious man im hungry
                            </div>
                            <div class="col s3 m2"> 
                                <br />
                                <a href="#">Remove</a><br />
                                <br />
                                <a href="#">Edit</a>
                            </div>
                             <div class="col s4 m2"> 
                                <td class="product-cart-actions" data-rwd-label="Qty">
                                   <div><strong>Quantity</strong></div>
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
                            <div class="col s4 m2"><strong>price:</strong>$5.99</div>
                        </div>


                    </div>

                </li>
            </ul>

        </div>
            <h4>Total:$23.94</h4>
            <h7>Tax:$3.11</h7>
            <h4>Grand Total:$27.05</h4>
            
        <button type="button" title="Continue Shopping" class="button waves-effect waves-light btn green accent-4  btn-proceed-checkout btn-checkout"><span><span>Continue Shopping</span></span></button>
        <a class="modal-trigger waves-effect waves-light btn" href="#modal1">Proceed to Checkout</a>
         <!-- Modal Structure -->
  <div id="modal1" class="modal modal-fixed-footer">
    <div class="modal-content">
      <h4>AGREEMENT</h4>
      <p>This is not just a bunch a text but this is you telling me i can take you credit card and do what the hell i want with it. i mean i can go buy a house a car dinner for me and my gf and because you hit agree you cant sue me after once you  find out
          that i robbed your ass of all your money which if your usuing this website at the early stage mean you dont have any money so im fucked anyways. DAMN I HATE LOOSING 
      </p>
    </div>
    <div class="modal-footer">
        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Disagree</a>
      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Agree</a>
    
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

    <script>
        $(document).ready(function () {
      // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
      $('.modal-trigger').leanModal();
  });</script>
    <script type="text/javascript" src="js/init.js"></script>

</body>
</html>
