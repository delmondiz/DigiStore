<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="DigiStore.Map" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Also known as Search!</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server"></form>
    <ul id="accountDropdown" class="dropdown-content">
        <li>Manage Store</li>
        <li>Order History</li>
        <li>Settings</li>
        <li>Log In/Out</li>
    </ul>
    <nav>
        <div class="nav-wrapper">
            <a class="brand-logo center" href="/home.aspx">DigiStore</a>
            <a href="#" data-activates="slideOut" class="hamburger"><i class="material-icons">menu</i></a>
            <ul class="right hide-on-med-and-down">
                <li><a href="#">Browse</a></li>
                <li><a href="#">Cart</a></li>
                <li><a class="dropdown-button" href="#" data-activates="accountDropdown"><img class="circle" src="/img/icon.png" height="30" width="30"/></a></li>
            </ul>
            <ul id="slideOut" class="side-nav" style="padding:0 3px 0 3px;">
                <li><h3 style="color: #e57373" class="center">Digistore</h3></li>
                <li><div class="divider"></div></li>
                <li><a href="#">Home</a></li>
                <li><a href="#">Browse</a></li>
                <li><a href="#">Cart</a></li>
                <li><div class="divider"></div></li>
                <li><a href="#">Manage Store</a></li>
                <li><a href="#">Order History</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Log In/Out</a></li>
            </ul>
        </div>
    </nav>    
        <form id="form2" onsubmit="return performUserSearch()">
            <div class="row">
                <div class="input-field col s10">
                    <input type="text" id="inputSearch" class="validate" />
                    <label for="inputSearch">Store Name</label>
                </div>
                <div class="col s2">
                    <button class="btn-large waves-effect waves-light" type="submit" name="submitSearch" style="width:100%">
                        <i class="material-icons left">search</i>Search  
                    </button>
                </div>
            </div>
        </form>
        <div style="width:100%; height:100%">
            <div id="goggleResults" style="background-color: slategrey; color: #FFFFFF; width: 40%; height: 500px; float: left; overflow-y: scroll">
                <ol id="goggleResultsList"></ol>
            </div>
            <div id="goggleMap" style="width:60%; height:500px; float: left;"></div>
            <%--<asp:Image ID="Image1" runat="server" style="clear:both;" ImageUrl="~/img/powered_by_google_on_white_hdpi.png" />--%>
        </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3d4spAr0FMskq0UBEVofzNutc9Q9lrig&callback=initMap&libraries=places,visualization" async defer></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            Materialize.updateTextFields();
            $(".dropdown-button").dropdown();
            $(".hamburger").sideNav();

            /*
        * The application asks for your location.  If the user accepts, it'll move the map close to the user's location.
        * Otherwise, it'll show up over toronto.
        */
            var map;
            var service;
            var infowindow;
            var markers = [];

            startUpFunctions();

            function startUpFunctions() {
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

            function performSearch() {
                var request = {
                    location: map.getCenter(),
                    radius: '100',
                    query: 'wendy'
                };
                service.textSearch(request, callback);
            }

            function performUserSearch() {
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
                var resultsHTML = "<div><img src='" + result.icon + "' alt='Store Icon' width='25' height='25'><b>Store Name: </b>" + result.name + "</div><br/>";
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
                        "<li id='" + document.getElementById("goggleResultsList").childElementCount + "'>" +
                        getResultsDiv(result)
                    "</li>";
                });

                google.maps.event.addListener(marker, 'click', function () {
                    infoWindow.setContent(
                        document.getElementById("goggleResultsList").children[marker.get("id")].innerHTML
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
        });
    </script>
</body>
</html>
