<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="DigiStore.Map" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Also known as Search!</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0" />

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="css/map.css" rel="stylesheet" />
    <link href="css/theme.css" rel="stylesheet" />
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
        <form id="form2" onsubmit="return performUserSearch()">
            <div class="row">
                <div class="col input-field s9">
                    <input type="text" id="inputSearch" class="validate" />
                    <label for="inputSearch">Store Name</label>
                </div>
                <div class="col s3 valign-wrapper">
                    <button class="btn-large valign waves-effect waves-light blue darken-3 yellow-text accent-3" type="submit" name="submitSearch" style="padding:0; width:100%">
                        <i class="material-icons left">search</i>Search
                    </button>
                </div>
            </div>
        </form>
    </div>

    <div class="center container">
        <div class="center" style="height: 500px">
            <div id="goggleResults" style="width: 40%; height: 100%; float: left; overflow-y: scroll">
                <ul class="collection yellow-text accent-3" id="goggleResultsList"></ul>
            </div>
            <div id="goggleMap" style="width: 60%; height: 100%; float: right;"></div>
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
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3d4spAr0FMskq0UBEVofzNutc9Q9lrig&callback=initMap&libraries=places,visualization" async defer></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            Materialize.updateTextFields();
            $(".dropdown-button").dropdown();
            $(".button-collapse").sideNav();
        });

        /*
        * The application asks for your location.  If the user accepts, it'll move the map close to the user's location.
        * Otherwise, it'll show up over toronto.
        */
        var map;
        var service;
        var infowindow;
        var markers = [];

        startUpFunctions();

        // Hides the google results div before the user has searched at least once.
        // Also makes the google map full size within it's containing div.
        function hideBeforeSearch() {
            $("#goggleResults").hide();
            $("#goggleMap").css("width", "100%");
        }

        // Shows the google results div before the user has searched at least once.
        // Also makes the google map return to 60% size within it's containing div
        // so it shares the space with the google results.
        function unHideBeforeSearch() {
            $("#goggleResults").show();
            $("#goggleMap").css("width", "60%");
        }

        function startUpFunctions() {
            hideBeforeSearch();
            detectCurrentPosition();
            detectBrowser();
        }

        // Prompt the user for their physical location.  If they give it, this will set
        // the map to their location.
        function detectCurrentPosition() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(createMapWithPosition);
            }
        }

        function detectBrowser() {
            var useragent = navigator.userAgent;
            var mapdiv = document.getElementById("map");

            if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1) {
                mapdiv.style.width = '100%';
                mapdiv.style.height = '100%';
            }
        }

        function createMapWithPosition(userInfo) {
            initMapOnUser(userInfo.coords.latitude, userInfo.coords.longitude);
        }

        function initMap() {
            map = new google.maps.Map(document.getElementById('goggleMap'), {
                center: { lat: 43.6532, lng: -79.3832 }, // Toronto by Default
                zoom: 15,
                mapTypeControl: false,
                styles: [{
                    stylers: [{ visibility: 'simplified' }]
                }, {
                    elementType: 'labels',
                    stylers: [{ visibility: 'on' }]
                }]
            });

            infoWindow = new google.maps.InfoWindow();
            service = new google.maps.places.PlacesService(map);

            // The idle event is a debounced event, so we can query & listen without
            // throwing too many requests at the server.
            //map.addListener('idle', performSearch);
        }

        function initMapOnUser(lati, longi) {
            map = new google.maps.Map(document.getElementById('goggleMap'), {
                center: { lat: lati, lng: longi },
                zoom: 15,
                mapTypeControl: false,
                styles: [{
                    stylers: [{ visibility: 'simplified' }]
                }, {
                    elementType: 'labels',
                    stylers: [{ visibility: 'on' }]
                }]
            });
            service = new google.maps.places.PlacesService(map);
            //map.addListener('idle', performUserSearch);
        }

        //function performSearch() {
        //    var request = {
        //        location: map.getCenter(),
        //        radius: '100',
        //        query: 'wendy'
        //    };
        //    service.textSearch(request, callback);
        //}

        function performUserSearch() {
            unHideBeforeSearch();
            var userQuery = document.getElementById('inputSearch').value;
            if (userQuery.length > 0)
                var request = {
                    location: map.getCenter(),
                    radius: '1000',
                    query: userQuery
                };
            service.textSearch(request, callback);
            return false;
        }

        function callback(results, status) {
            if (status !== google.maps.places.PlacesServiceStatus.OK) {
                console.error(status);
                return;
            }
            if (markers.length > 0) {
                deleteMarkers();
                clearResultsList();
            }

            for (var i = 0, result; result = results[i]; i++) {
                addMarker(result);
            }
            setMapOnAll(map);
        }

        function getResultsDiv(result) {
            var open = "";
            if (result.opening_hours.open_now)
                open = "Open!";
            else if (result.permanently_closed)
                open = "PERMANENTLY CLOSED!";
            else
                open = "Closed!";
            var resultsHTML = "<img class='circle' src='" + result.icon + "' alt='Store Icon' width='25' height='25' />";
            resultsHTML += "<span class='title'><b>Store Name: </b></span>" + result.name;
            resultsHTML += "<div><b>Address: </b>" + result.formatted_address + "</div><br/>";
            if (result.opening_hours.open_now != null)
                resultsHTML += "<div><b>Open Now: </b>" + open + "</div><br/>";
            if (result.rating != null)
                resultsHTML += "<div><b>Rating: </b>" + result.rating + "/5</div><br/>";
            return resultsHTML;
        }

        function addMarker(place) {
            var marker = new google.maps.Marker({
                map: map,
                position: place.geometry.location,
                nid: document.getElementById("goggleResultsList").childElementCount
            });
            service.getDetails(place, function (result, status) {
                if (status !== google.maps.places.PlacesServiceStatus.OK) {
                    console.error(status);
                    return;
                }
                //console.log(document.getElementById("goggleResultsList").childElementCount);
                //console.log(marker.get("position"));
                document.getElementById("goggleResultsList").innerHTML +=
                    "<li class='collection-item blue darken-3' id='" + document.getElementById("goggleResultsList").childElementCount + "'>" +
                    getResultsDiv(result)
                "</li>";
            });

            google.maps.event.addListener(marker, 'click', function () {
                infoWindow.setContent(
                    document.getElementById("goggleResultsList").children[marker.get("nid")].innerHTML
                    );
                infoWindow.open(map, marker);
            });
            markers.push(marker);
        }

        function setMapOnAll(map) {
            for (var i = 0 ; i < markers.length; i++) {
                markers[i].setMap(map);
            }
        }

        function clearMarkers() {
            setMapOnAll(null);
        }

        function clearResultsList() {
            document.getElementById("goggleResultsList").innerHTML = "";
        }

        function deleteMarkers() {
            clearMarkers();
            markers = [];
        }

    </script>
</body>
</html>
