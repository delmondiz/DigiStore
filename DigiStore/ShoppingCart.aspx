<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="DigiStore.ShoppingCart" %>

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
    <ul class="checkout-types top right">
        <li class="payMethods_1">
            <div class="paypal-logo">
                <a data-action="checkout-form-submit" id="ec_shortcut_e122aed1e26b17e1dfc2d507881d46be"
                    href="https://rdxsports.com/paypal/express/start/button/1/">
                    <img
                        src="http://rdxsports.com/skin/frontend/rdxsports/default/materialize/images/paypal-exp-checkout.png"
                        alt="Checkout with PayPal" class="waves-red waves-effect" title="Checkout with PayPal"></a>
            </div>

        </li>
    </ul>



    </div>
        <div class="section">
            <!--   Icon Section   -->
            <div class="cart-total clearfix">
                <h3>
                    <table id="shopping-cart-totals-table">
                        <colgroup>
                            <col>
                            <col width="1">
                        </colgroup>
                        <tfoot>
                            <tr>
                                <td style="" class="a-right" colspan="1">
                                    <strong>Grand Total</strong>
                                </td>
                                <td style="" class="a-right">
                                    <strong><span class="price">$19.74</span></strong>
                                </td>
                            </tr>
                        </tfoot>
                   
                    </table>
                </h3>
                <div class="clear"></div>
            </div>
            <form  method="post" class="shippingform-main">
                <input name="form_key" type="hidden" value="BBRNpFVqGY0hxc9f">
                <table id="shopping-cart-table" class="cart-table data-table responsive-table">
                    <thead class="hide-on-med-and-down">
                        <tr class="first last">
                            <th rowspan="1"><span class="nobr">Item</span></th>
                            <th rowspan="1">&nbsp;</th>
                            <th class="a-center cart-price-head" colspan="1">

                                <span class="nobr">Unit Price</span>

                            </th>
                            <th rowspan="1" class="a-center">Qty
                            </th>
                            <th class="a-center cart-total-head" colspan="1">Total Price 
                            </th>
                            <th class="a-center hide" rowspan="1">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="first last odd">
                            <td class="product-cart-image">
                                <a href="http://rdxsports.com/rdx-power-lifting-knee-wraps-bandages-support-training" title="CupeCakes!!!!" class="product-image">
                                    <img src="img/download.jpg"  alt=CupeCakes!!!!">
                                </a>
                                <ul class="cart-links hide">
                                    <li>
                                        <a href="http://rdxsports.com/checkout/cart/configure/id/179672/" title="Edit item parameters">Edit</a>
                                    </li>
                                </ul>
                            </td>
                            <td class="product-cart-info">
                                <a href="http://rdxsports.com/checkout/cart/delete/id/179672/uenc/aHR0cDovL3JkeHNwb3J0cy5jb20vY2hlY2tvdXQvY2FydC8,/" title="Remove Item" class="btn-remove hide btn-remove2">Remove Item</a>
                                <h2 class="product-name">
                                    <a href="">CupeCakes!!!!</a>
                                </h2>
                                <div class="product-cart-sku">
                                    <span class="label">SKU:</span> WAH-K2B
                                </div>
                                <div class="product-edit"><a href="" title="Edit item parameters">Edit Item <i class="fa fa-pencil-square"></i></a></div>
                                <div class="product-delete">
                                    <a href="" title="Remove Item" class="btn-remove btn-remove2">Remove <i class="fa fa-times-circle"></i></a>
                                </div>
                            </td>
                            <td class="product-cart-price" data-rwd-label="Price" data-rwd-tax-label="Excl. Tax">
                                <span class="cart-price">
                                    <span class="price">$19.74</span>
                                </span>
                            </td>

                            <td class="product-cart-actions" data-rwd-label="Qty">
                                <input type="number" pattern="\d*" name="cart[179672][qty]" value="1" size="4" data-cart-item-id="WAH-K2B" title="Qty" class="input-text qty" maxlength="12">
                                <button type="submit" name="update_cart_action" data-cart-item-update="" value="update_qty" title="Update" class="button btn-update hide">
                                    <span><span>Update</span></span>
                                </button>
                                <ul class="cart-links hide">
                                    <li>
                                        <a href="http://rdxsports.com/checkout/cart/configure/id/179672/" title="Edit item parameters">Edit</a>
                                    </li>
                                </ul>
                            </td>

                            <td class="product-cart-total" data-rwd-label="Subtotal">
                                <span class="cart-price">
                                    <span class="price">$19.74</span>
                                </span>
                            </td>
                            <td class="a-center product-cart-remove hide last">
                                <a href="http://rdxsports.com/checkout/cart/delete/id/179672/uenc/aHR0cDovL3JkeHNwb3J0cy5jb20vY2hlY2tvdXQvY2FydC8,/" title="Remove Item" class="btn-remove btn-remove2">Remove Item</a>
                            </td>
                        </tr>
                         <tr class="first last odd">
                            <td class="product-cart-image">
                                <a href="http://rdxsports.com/rdx-power-lifting-knee-wraps-bandages-support-training" title="CupeCakes!!!!" class="product-image">
                                    <img src="img/download%20(1).jpg"  alt=CupeCakes!!!!">
                                </a>
                                <ul class="cart-links hide">
                                    <li>
                                        <a href="http://rdxsports.com/checkout/cart/configure/id/179672/" title="Edit item parameters">Edit</a>
                                    </li>
                                </ul>
                            </td>
                            <td class="product-cart-info">
                                <a href="http://rdxsports.com/checkout/cart/delete/id/179672/uenc/aHR0cDovL3JkeHNwb3J0cy5jb20vY2hlY2tvdXQvY2FydC8,/" title="Remove Item" class="btn-remove hide btn-remove2">Remove Item</a>
                                <h2 class="product-name">
                                    <a href="">CupeCakes!!!!</a>
                                </h2>
                                <div class="product-cart-sku">
                                    <span class="label">SKU:</span> WAH-K2B
                                </div>
                                <div class="product-edit"><a href="" title="Edit item parameters">Edit Item <i class="fa fa-pencil-square"></i></a></div>
                                <div class="product-delete">
                                    <a href="" title="Remove Item" class="btn-remove btn-remove2">Remove <i class="fa fa-times-circle"></i></a>
                                </div>
                            </td>
                            <td class="product-cart-price" data-rwd-label="Price" data-rwd-tax-label="Excl. Tax">
                                <span class="cart-price">
                                    <span class="price">$19.74</span>
                                </span>
                            </td>

                            <td class="product-cart-actions" data-rwd-label="Qty">
                                <input type="number" pattern="\d*" name="cart[179672][qty]" value="1" size="4" data-cart-item-id="WAH-K2B" title="Qty" class="input-text qty" maxlength="12">
                                <button type="submit" name="update_cart_action" data-cart-item-update="" value="update_qty" title="Update" class="button btn-update hide">
                                    <span><span>Update</span></span>
                                </button>
                                <ul class="cart-links hide">
                                    <li>
                                        <a href="http://rdxsports.com/checkout/cart/configure/id/179672/" title="Edit item parameters">Edit</a>
                                    </li>
                                </ul>
                            </td>

                            <td class="product-cart-total" data-rwd-label="Subtotal">
                                <span class="cart-price">
                                    <span class="price">$19.74</span>
                                </span>
                            </td>
                            <td class="a-center product-cart-remove hide last">
                                <a href="http://rdxsports.com/checkout/cart/delete/id/179672/uenc/aHR0cDovL3JkeHNwb3J0cy5jb20vY2hlY2tvdXQvY2FydC8,/" title="Remove Item" class="btn-remove btn-remove2">Remove Item</a>
                            </td>
                        </tr>
                         <tr class="first last odd">
                            <td class="product-cart-image">
                                <a href="http://rdxsports.com/rdx-power-lifting-knee-wraps-bandages-support-training" title="CupeCakes!!!!" class="product-image">
                                    <img src="img/images%20(1).jpg"   alt=CupeCakes!!!!"/>
                                </a>
                                <ul class="cart-links hide">
                                    <li>
                                        <a href="http://rdxsports.com/checkout/cart/configure/id/179672/" title="Edit item parameters">Edit</a>
                                    </li>
                                </ul>
                            </td>
                            <td class="product-cart-info">
                                <a href="http://rdxsports.com/checkout/cart/delete/id/179672/uenc/aHR0cDovL3JkeHNwb3J0cy5jb20vY2hlY2tvdXQvY2FydC8,/" title="Remove Item" class="btn-remove hide btn-remove2">Remove Item</a>
                                <h2 class="product-name">
                                    <a href="">CupeCakes!!!!</a>
                                </h2>
                                <div class="product-cart-sku">
                                    <span class="label">SKU:</span> WAH-K2B
                                </div>
                                <div class="product-edit"><a href="" title="Edit item parameters">Edit Item <i class="fa fa-pencil-square"></i></a></div>
                                <div class="product-delete">
                                    <a href="" title="Remove Item" class="btn-remove btn-remove2">Remove <i class="fa fa-times-circle"></i></a>
                                </div>
                            </td>
                            <td class="product-cart-price" data-rwd-label="Price" data-rwd-tax-label="Excl. Tax">
                                <span class="cart-price">
                                    <span class="price">$19.74</span>
                                </span>
                            </td>

                            <td class="product-cart-actions" data-rwd-label="Qty">
                                <input type="number" pattern="\d*" name="cart[179672][qty]" value="1" size="4" data-cart-item-id="WAH-K2B" title="Qty" class="input-text qty" maxlength="12">
                                <button type="submit" name="update_cart_action" data-cart-item-update="" value="update_qty" title="Update" class="button btn-update hide">
                                    <span><span>Update</span></span>
                                </button>
                                <ul class="cart-links hide">
                                    <li>
                                        <a href="http://rdxsports.com/checkout/cart/configure/id/179672/" title="Edit item parameters">Edit</a>
                                    </li>
                                </ul>
                            </td>

                            <td class="product-cart-total" data-rwd-label="Subtotal">
                                <span class="cart-price">
                                    <span class="price">$19.74</span>
                                </span>
                            </td>
                            <td class="a-center product-cart-remove hide last">
                                <a href="http://rdxsports.com/checkout/cart/delete/id/179672/uenc/aHR0cDovL3JkeHNwb3J0cy5jb20vY2hlY2tvdXQvY2FydC8,/" title="Remove Item" class="btn-remove btn-remove2">Remove Item</a>
                            </td>
                        </tr>
                         <tr class="first last odd">
                            <td class="product-cart-image">
                                <a href="http://rdxsports.com/rdx-power-lifting-knee-wraps-bandages-support-training" title="CupeCakes!!!!" class="product-image">
                                    <img src="img/images.jpg"  alt=CupeCakes!!!!"/>
                                </a>
                                <ul class="cart-links hide">
                                    <li>
                                        <a href="http://rdxsports.com/checkout/cart/configure/id/179672/" title="Edit item parameters">Edit</a>
                                    </li>
                                </ul>
                            </td>
                            <td class="product-cart-info">
                                <a href="http://rdxsports.com/checkout/cart/delete/id/179672/uenc/aHR0cDovL3JkeHNwb3J0cy5jb20vY2hlY2tvdXQvY2FydC8,/" title="Remove Item" class="btn-remove hide btn-remove2">Remove Item</a>
                                <h2 class="product-name">
                                    <a href="">CupeCakes!!!!</a>
                                </h2>
                                <div class="product-cart-sku">
                                    <span class="label">SKU:</span> WAH-K2B
                                </div>
                                <div class="product-edit"><a href="" title="Edit item parameters">Edit Item <i class="fa fa-pencil-square"></i></a></div>
                                <div class="product-delete">
                                    <a href="" title="Remove Item" class="btn-remove btn-remove2">Remove <i class="fa fa-times-circle"></i></a>
                                </div>
                            </td>
                            <td class="product-cart-price" data-rwd-label="Price" data-rwd-tax-label="Excl. Tax">
                                <span class="cart-price">
                                    <span class="price">$19.74</span>
                                </span>
                            </td>

                            <td class="product-cart-actions" data-rwd-label="Qty">
                                <input type="number" pattern="\d*" name="cart[179672][qty]" value="1" size="4" data-cart-item-id="WAH-K2B" title="Qty" class="input-text qty" maxlength="12">
                                <button type="submit" name="update_cart_action" data-cart-item-update="" value="update_qty" title="Update" class="button btn-update hide">
                                    <span><span>Update</span></span>
                                </button>
                                <ul class="cart-links hide">
                                    <li>
                                        <a href="http://rdxsports.com/checkout/cart/configure/id/179672/" title="Edit item parameters">Edit</a>
                                    </li>
                                </ul>
                            </td>

                            <td class="product-cart-total" data-rwd-label="Subtotal">
                                <span class="cart-price">
                                    <span class="price">$19.74</span>
                                </span>
                            </td>
                            <td class="a-center product-cart-remove hide last">
                                <a href="http://rdxsports.com/checkout/cart/delete/id/179672/uenc/aHR0cDovL3JkeHNwb3J0cy5jb20vY2hlY2tvdXQvY2FydC8,/" title="Remove Item" class="btn-remove btn-remove2">Remove Item</a>
                            </td>
                        </tr>
                    </tbody>

                </table>
                <div class="cart-action-btn-all">

                    <button type="submit" style="visibility: hidden;" data-cart-item-update="" name="update_cart_action" value="update_qty" title="Update Shopping Cart" class="button2 btn-update hide"><span><span>Update Shopping Cart</span></span></button>
                    <button type="submit" name="update_cart_action" data-cart-empty="" value="empty_cart" title="Empty Cart" class="button2 btn-empty hide-on-med-and-down waves-effect waves-red btn btn-flat" id="empty_cart_button"><span><span>Empty Cart</span></span></button>
                    <button type="submit" name="update_cart_action" data-cart-item-update="" value="update_qty" title="Update Shopping Cart" class="button2 btn-update waves-effect waves-light btn grey darken-1 right btn-update-shopping-cart"><span><span>Update Shopping Cart</span></span></button>
                    <a href="javascript:;" class="btn-empty modal-trigger calc-shipping-model waves-effect white-text waves-light btn black mr10 darken-1 right">Estimate Shipping</a>
                    <span class="or hide">-or-</span>
                    <!--[if lt IE 8]>
                        <input type="hidden" id="update_cart_action_container" data-cart-item-update />
                        <script type="text/javascript">
                        //<![CDATA[
                            Event.observe(window, 'load', function()
                            {
                                // Internet Explorer (lt 8) does not support value attribute in button elements
                                $emptyCartButton = $('empty_cart_button');
                                $cartActionContainer = $('update_cart_action_container');
                                if ($emptyCartButton && $cartActionContainer) {
                                    Event.observe($emptyCartButton, 'click', function()
                                    {
                                        $emptyCartButton.setAttribute('name', 'update_cart_action_temp');
                                        $cartActionContainer.setAttribute('name', 'update_cart_action');
                                        $cartActionContainer.setValue('empty_cart');
                                    });
                                }

                            });
                        //]]>
                        </script>
                        <![endif]-->
                    <div class="clear"></div>
                </div>
                <script type="text/javascript">decorateTable('shopping-cart-table')</script>
            </form>

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
