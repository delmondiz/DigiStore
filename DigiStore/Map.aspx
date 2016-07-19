<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="DigiStore.Map" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Also known as Search!</title>
    <script type="text/javascript">
        /*
        * It'll ask for your location.  If you give it, it'll move the map close to you.
        * Otherwise, it'll show up over toronto.
        */
        var map;
        var service;
        var infowindow;
        var markers = [];
        
        startUpFunctions();

        function startUpFunctions()
        {
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
                center: { lat: 43.6532, lng: -79.3832 },
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
            if (markers.length > 0)
                deleteMarkers();

            for (var i = 0, result; result = results[i]; i++) {
                addMarker(result);
            }
            setMapOnAll(map);
        }

        function addMarker(place) {
            var marker = new google.maps.Marker({
                map: map,
                position: place.geometry.location
            });
            
            google.maps.event.addListener(marker, 'click', function () {
                service.getDetails(place, function (result, status) {
                    if (status !== google.maps.places.PlacesServiceStatus.OK) {
                        console.error(status);
                        return;
                    }
                    infoWindow.setContent(result.name);
                    infoWindow.open(map, marker);
                });
            });
            markers.push(marker);
        }

        function setMapOnAll(map)
        {
            for (var i = 0 ; i < markers.length; i++)
            {
                markers[i].setMap(map);
            }
        }
        
        function clearMarkers()
        {
            setMapOnAll(null);
        }

        function deleteMarkers()
        {
            clearMarkers();
            markers = [];
        }
    </script>
</head>
<body>
    <form id="form1" runat="server"></form>
        <div>
            <div style="float: right">
                Home | Search | Login | Register 
            </div>
            <div style="text-align: center">
                DigiStore
            </div>
        </div>
        <form id="form2" onsubmit="return performUserSearch()">
            <div style="width:75%; margin:0 auto;">
                <asp:Label ID="lblSearch" runat="server" Text="Search:" Width="20.49%"></asp:Label>
                <input type="text" id="inputSearch" runat="server" style="width:79.49%"/>
            </div>
        </form>
        <br />
        <div style="width:100%; height:100%">
            <div id="goggleResults" style="background-color:slategrey; color:darkorange; width:40%; height:500px; float: left;"></div>
            <div id="goggleMap" style="width:60%; height:500px; float: left;"></div>
            <asp:Image ID="Image1" runat="server" style="clear:both;" ImageUrl="~/img/powered_by_google_on_white_hdpi.png" />
        </div>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3d4spAr0FMskq0UBEVofzNutc9Q9lrig&callback=initMap&libraries=places,visualization" async defer></script>
</body>
</html>
