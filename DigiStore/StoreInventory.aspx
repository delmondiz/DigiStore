<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreInventory.aspx.cs" Inherits="DigiStore.StoreInventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>_Store_ Inventory</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="css/StoreInventory.css" />
</head>
<body>
    <ul id="accountDropdown" class="dropdown-content">
        <li>Manage Store</li>
        <li>Order History</li>
        <li>Settings</li>
        <li>Log In/Out</li>
    </ul>
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
    <form id="form2" onsubmit="return performItemSearch()">
        <div class="row">
            <div class="input-field col s4">
                <select>
                    <option value="" disabled="disabled" selected="selected">How many items to show?</option>
                    <option value="1">5
                    </option>
                    <option value="2">25
                    </option>
                    <option value="3">50
                    </option>
                    <option value="4">100
                    </option>
                    <option value="5">200
                    </option>
                </select>
                <label>Number of Items Shown</label>
            </div>
            <div class="input-field col s6">
                <input type="text" id="itemSearch" class="validate" />
                <label for="itemSearch">Item Name or Serial #:</label>
            </div>
            <div class="col s2">
                <button class="btn-large waves-effect waves-light" type="submit" name="submitSearch" style="width: 100%">
                    <i class="material-icons left">search</i>Search  
                </button>
            </div>
        </div>
    </form>
    <div class="divider"></div>
    <div>
        <h2 class="center-align">Your Items</h2>
        <ul id="storeInventoryList" class="collapsible" data-collapsible="accordion">
            <li>
                <div class="collapsible-header">
                    <img src="img\jinx.png" height="50" width="50" />
                    Jinx's Mini Chibi Figure ~-~ Remaining: 15
                </div>
                <div class="collapsible-body">
                    <p>Serial No#: RIOTLOL0000000101<br />
                        Item Name: ____________<br />
                        Quantity:____________<br />
                        Price per Item: $0.00<br />
                        Price by Weight: $0.00<br />
                        Weight: 0.00kg<br />
                        Supplier: ________</p>
                    <div class="row">
                        <div class="col s6">
                            <a class="waves-effect waves-light btn">Update Details</a>

                        </div>
                        <div class="col s6">
                            <a class="waves-effect waves-light btn red">Delete Item</a>

                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="collapsible-header">
                    <img src="img\kha.png" height="50" width="50" />
                    Kha'zix's Mini Chibi Figure ~-~ Remaining: 11
                </div>
                <div class="collapsible-body">
                    <p>Serial No#: RIOTLOL0000000102<br />
                        Item Name: ____________<br />
                        Quantity:____________<br />
                        Price per Item: $0.00<br />
                        Price by Weight: $0.00<br />
                        Weight: 0.00kg<br />
                        Supplier: ________</p>
                    <div class="row">
                        <div class="col s6">
                            <a class="waves-effect waves-light btn">Update Details</a>

                        </div>
                        <div class="col s6">
                            <a class="waves-effect waves-light btn red">Delete Item</a>

                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="collapsible-header">
                    <img src="img\mf.png" height="50" width="50" />
                    Miss Fortune's Mini Chibi Figure ~-~ Remaining: 16
                </div>
                <div class="collapsible-body">
                    <p>Serial No#: RIOTLOL0000000103<br />
                        Item Name: ____________<br />
                        Quantity:____________<br />
                        Price per Item: $0.00<br />
                        Price by Weight: $0.00<br />
                        Weight: 0.00kg<br />
                        Supplier: ________
                    </p>
                    <div class="row">
                        <div class="col s6">
                            <a class="waves-effect waves-light btn">Update Details</a>

                        </div>
                        <div class="col s6">
                            <a class="waves-effect waves-light btn red">Delete Item</a>

                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="collapsible-header">
                    <img src="img\tryn.png" height="50" width="50" />
                    Tryndamere's Mini Chibi Figure ~-~ Remaining: 17
                </div>
                <div class="collapsible-body">
                    <p>Serial No#: RIOTLOL0000000104<br />
                        Item Name: ____________<br />
                        Quantity:____________<br />
                        Price per Item: $0.00<br />
                        Price by Weight: $0.00<br />
                        Weight: 0.00kg<br />

                        Supplier: ________</p>
                    <div class="row">
                        <div class="col s6">
                            <a class="waves-effect waves-light btn">Update Details</a>

                        </div>
                        <div class="col s6">
                            <a class="waves-effect waves-light btn red">Delete Item</a>

                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="collapsible-header">
                    <img src="img\vi.png" height="50" width="50" />
                    Vi's Mini Chibi Figure ~-~ Remaining: 14
                </div>
                <div class="collapsible-body">
                    <p>Serial No#: RIOTLOL0000000105<br />
                        Item Name: ____________<br />
                        Quantity:____________<br />
                        Price per Item: $0.00<br />
                        Price by Weight: $0.00<br />
                        Weight: 0.00kg<br />
                        Supplier: ________</p>
                    <div class="row">
                        <div class="col s6">
                            <a class="waves-effect waves-light btn">Update Details</a>
                        </div>
                        <div class="col s6">
                            <a class="waves-effect waves-light btn red">Delete Item</a>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3d4spAr0FMskq0UBEVofzNutc9Q9lrig&callback=initMap&libraries=places,visualization" async defer></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            Materialize.updateTextFields();
            $('select').material_select();
            $(".dropdown-button").dropdown();
            $(".button-collapse").sideNav();
            //$('.carousel').carousel();
            ////$('.carousel.carousel-slider').carousel();
            //$('.carousel.carousel-slider').carousel({ full_width: true });
        });

        function performItemSearch() {
            var itemQuery = document.getElementById('itemSearch').value;

            // Search Database for the item

            // Clear the current list of items.

            // Insert the items that were found.

            // Stop from refreshing the page.
            return false;
        }
    </script>
</body>
</html>
