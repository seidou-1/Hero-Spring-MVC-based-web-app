var allSightings = [
  {
    lat: 40.658927,
    lng: -73.947733,
    sightingID: 1
  },
  {
    lat: 40.785091,
    lng: -73.968285,
    sightingID: 2
  },
  {
    lat: 40.758896,
    lng: -73.985130,
    sightingID: 3
  },
  {
    lat: 40.618825,
    lng: -74.117483,
    sightingID: 4
  },
  {
    lat: 40.71722,
    lng: -74.029915,
    sightingID: 5
  },
  {
    lat: 40.628927,
    lng: -73.942733,
    sightingID: 6
  },
  {
    lat: 40.782341,
    lng: -73.962245,
    sightingID: 7
  },
  {
    lat: 40.752894,
    lng: -73.982134,
    sightingID: 8
  },
  {
    lat: 40.618221,
    lng: -74.127482,
    sightingID: 9
  },
  {
    lat: 40.7272541,
    lng: -74.139925,
    sightingID: 10
  }
];
var allLocations = [
  {
    lat: 40.758896,
    lng: -73.985130
  },
  {
    lat: 40.618825,
    lng: -74.117483
  },
  {
    lat: 40.717251,
    lng: -74.039915
  }
];
var map;
var mapToLoad = document.getElementById("locationMap");
function getCorrectMap() {
  if (document.getElementById("locationMap")) {
    currentMap = "locationMap";
    return document.getElementById("locationMap");
  }
  if (document.getElementById("map")) {
    currentMap = "sightingsMap";
    return document.getElementById("map");
  }
  if (document.getElementById("createSightingMap")) {
    return document.getElementById("createSightingMap");
  }
}
function initMap() {
  map = new google.maps.Map(getCorrectMap(), {
    center: { lat: 40.658927, lng: -73.947733 },
    zoom: 10,
    zoomControl: false,
    mapTypeControl: false,
    mapTypeControlOptions: {
      style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
      mapTypeIds: ['roadmap']
    },
    streetViewControl: false,
    styles: getMapStyles()
  });
  map.setOptions({
    minZoom: 5,
    maxZoom: 15
  });
  var geocoder = new google.maps.Geocoder;
  var infowindow = new google.maps.InfoWindow;
  if (currentMap === "locationMap") {
    allLocations.forEach(e => {
      var marker = new google.maps.Marker({
        position: e,
        map: map,
        title: 'View More Info',
        icon: {
          url: "http://localhost:8080/SuperheroSightings/img/location.svg",
          scaledSize: new google.maps.Size(15, 15)
        }
      });
      map.addListener('click', function (e) {
        console.log(geocodeLocation(geocoder, map, infowindow, e));
      });
      marker.addListener('click', function () {
        geocodeLatLng(geocoder, map, infowindow, this);
      });
    });
  }
  if (currentMap === "sightingsMap") {
    var sightingToShow = $("#sightingID")[0].value;
    allSightings.forEach(e => {
      if (e.sightingID == sightingToShow || sightingToShow == 'all') {
        var marker = new google.maps.Marker({
          position: e,
          map: map,
          title: 'View More Info',
          icon: {
            url: "http://localhost:8080/SuperheroSightings/img/hero.svg",
            scaledSize: new google.maps.Size(15, 15)
          }
        });
        map.addListener('click', function (e) {
          console.log(geocodeLocation(geocoder, map, infowindow, e));
        });
        marker.addListener('click', function () {
          geocodeLatLng(geocoder, map, infowindow, this);
        });
        if (e.sightingID == sightingToShow) {
          var sighting = performAjaxCall("sighting", sightingToShow);
          openInformationWindow(sighting, map, infowindow, marker);
          geocodeLatLng(geocoder, map, infowindow, this);
        }
      }
    });
  }
}
function performAjaxCall(endpoint, extraParameter) {
  var returnData;
  $.ajax({
    async: false,
    dataType: 'json',
    type: 'GET',
    url: `http://localhost:8080/SuperheroSightings/${endpoint}/${extraParameter}`,
    success: function (data) {
      returnData = data;
      
    },
    error: function () {
      returnData = null;
    }
  });
  return returnData;
}
function geocodeLatLng(geocoder, map, infowindow, marker) {
  var latlng = { lat: marker.position.lat(), lng: marker.position.lng() };
  geocoder.geocode({ 'location': latlng }, function (results, status) {
    if (status === 'OK') {
      if (results[0]) {
        openInformationWindow("Forever and another day", map, infowindow, marker);
      } else {
        window.alert('No results found');
      }
    } else {
      window.alert('Geocoder failed due to: ' + status);
    }
  });
}
function openInformationWindow(content, map, infowindow, marker) {
  infowindow.setContent(loadInfo(content));
  infowindow.open(map, marker);
  var windowStyles = $(".displaySighting");
  windowStyles.parent().parent().parent().css({ width: '100px !important' });
}
function geocodeLocation(geocoder, map, infowindow, location) {
  var latlng = { lat: location.latLng.lat(), lng: location.latLng.lng() };
  return geocoder.geocode({ 'location': latlng }, function (results, status) {
    if (status === 'OK') {
      if (results[0]) {
        fillInLocationForm(results[0]);
      } else {
        return 'The address entered is not valid';
      }
    } else {
      return 'Geocoder failed due to: ' + status;
    }
  });
}
function loadInfo(data) {
  console.log(data)
  return `<div class="displaySighting" style="text-align: center">
    <img src="http://localhost:8080/SuperheroSightings/img/hero.jpg" alt="Image">
    <div class="caption">
      <h4>Charater Name</h4>
      <h4>Sighting Date</h4>
      <h4>Location Name</h4>
      
      <p><a href="#" class="btn btn-primary" role="button">View Hero</a> </p>
    </div>
    </div>`;
}
function getMapStyles() {
  return [
    {
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#212121"
        }
      ]
    },
    {
      "elementType": "labels.icon",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#212121"
        }
      ]
    },
    {
      "featureType": "administrative",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#757575"
        },
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "administrative.country",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#9e9e9e"
        }
      ]
    },
    {
      "featureType": "administrative.land_parcel",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "administrative.locality",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#bdbdbd"
        }
      ]
    },
    {
      "featureType": "administrative.neighborhood",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "poi",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#181818"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#616161"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#1b1b1b"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry.fill",
      "stylers": [
        {
          "color": "#2c2c2c"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "labels",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "labels.icon",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#8a8a8a"
        }
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#373737"
        }
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "labels",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#3c3c3c"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "labels",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "road.highway.controlled_access",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#4e4e4e"
        }
      ]
    },
    {
      "featureType": "road.local",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "road.local",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#616161"
        }
      ]
    },
    {
      "featureType": "transit",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "transit",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#000000"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry.fill",
      "stylers": [
        {
          "visibility": "simplified"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#3d3d3d"
        }
      ]
    }
  ];
}
/* Location Form Variables for autocompletion */
var latitude = $("#latitude")[0];
var longitude = $("#longitude")[0];
var streetNumber = $("#streetNumber")[0];
var streetName = $("#streetName")[0];
var city = $("#city")[0];
var state = $("#state")[0];
function fillInLocationForm(data) {
  streetNumber.value = data.address_components[0].long_name;
  streetName.value = data.address_components[1].long_name;
  city.value = data.address_components[3].long_name;
  state.value = data.address_components[5].long_name;
  latitude.value = data.geometry.location.lat();
  longitude.value = data.geometry.location.lng();
}
