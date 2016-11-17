startUpFunctions();

/*
* The application asks for your location.  If the user accepts, it'll move the map close to the user's location.
* Otherwise, it'll show up over toronto.
*/
// Holds the Google map.
var map;
// Used to make queries to Google's Map API.
var service; // google.maps.Places();
var geocoder;
// Holds the markers placed onto the Google Map.
var markers = [];
// Contains the contents of the marker's popup.
var infowindow;

//var autocomplete = null;

function startUpFunctions() {
    //hideBeforeSearch();
    detectBrowser();
}

// Hides the google results div before the user has searched at least once.
// Also makes the google map full size within it's containing div.
function hideBeforeSearch() {
    $("#goggleResults").hide();
    $("#goggleMap").css("height", "100%");
}

//function createAutocompleteSearch() {
//    var input = document.getElementById("inputSearch");
//    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

//    autocomplete = new google.maps.places.Autocomplete(input);

//    google.maps.event.addListener(autocomplete, 'place_changed', function () {
//        performUserSearch(autocomplete.getPlace());
//    });
//}

// Shows the google results div before the user has searched at least once.
// Also makes the google map return to 60% size within it's containing div
// so it shares the space with the google results.
function unHideBeforeSearch() {
    $("#goggleResults").show();
    $("#goggleMap").css("height", "60%");
}

function detectBrowser() {
    //var useragent = navigator.userAgent;
    //var mapdiv = document.getElementById("map");

    //if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1) {
    //    mapdiv.style.width = '100%';
    //    mapdiv.style.height = '100%';
    //}
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
    //if (autocomplete != null)
    //{
    //    createAutocompleteSearch();
    //}
    infoWindow = new google.maps.InfoWindow();

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            map.setCenter(pos);

        }, function () {
            Materialize.toast("An error occurred attempting to get your location.", 4500, "rounded");
        })
    } else {
        // Browser doesn't support Geolocation
        Materialize.toast("Your Browser doesn't support Geolocation.", 4500, "rounded");
    }
    service = new google.maps.places.PlacesService(map);

    // The idle event is a debounced event, so we can query & listen without
    // throwing too many requests at the server.
    //map.addListener('idle', performSearch);
}

//function performSearch() {
//    var request = {
//        location: map.getCenter(),
//        radius: '100',
//        query: 'wendy'
//    };
//    service.textSearch(request, callback);
//}

//function performUserSearch() {
//    unHideBeforeSearch();
//    var userQuery = document.getElementById('inputSearch').value;
//    if (userQuery.length > 0) {
//        var request = {
//            location: map.getCenter(),
//            radius: '1000',
//            query: userQuery
//        };

//        service.textSearch(request, callback);
//    }
//    else
//    {
//        Materialize.toast("Please enter something to search for!", 3250, "rounded");
//    }
//    return false;
//}

function searchForAddress(address, storeName) {
    if (address.length > 0) {
        geocoder = new google.maps.Geocoder();
        geocoder.geocode({ 'address': address, 'region': "ca", 'bounds': map.getBounds() }, function (results, status) {
            if (status === 'OK') {
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location,
                    storeName: storeName
                });
                //console.log("success!");
                //console.log(marker);
                //console.log(results);
                google.maps.event.addListener(marker, 'click', function () {
                    infoWindow.setContent(
                        document.getElementById("goggleResultsList").children[marker.get("storeName")].children[0].innerHTML
                        //storeName + "<br />" + results[0].formatted_address
                    );
                    infoWindow.open(map, marker);
                });
                markers.push(marker);
            }
            else {
                console.log("f-failure! Reason: " + status);
            }
        });
    }
    return false;
}

function performUserSearchWithCSharp() {
    unHideBeforeSearch();
    var userQuery = document.getElementById('inputSearch').value;
    if (userQuery.length > 0) {
        $.ajax({
            type: "POST",
            url: '@Url.Action("Home", "GoogleSearch")',
            contentType: "",
            data: { searchQuery: userQuery },
            dataType: "json",
            success: function (result) {

            }
        });
    }
    else {
        Materialize.toast("Please enter something to search for!", 3250, "rounded");
    }
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

    for (var i = 0; i < 1; i++) {
        addMarker(results[0]);
    }
    setMapOnAll(map);
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

        console.log(document.getElementById("goggleResultsList").childElementCount);
        console.log(marker.get("position"));
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