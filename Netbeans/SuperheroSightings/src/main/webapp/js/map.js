$(document).ready(function () {



});






function searchUrl(keyword) {
  var url_string = window.location.href;
  var url = new URL(url_string);
  return url.searchParams.get(keyword);
}


function initMap() {
  console.log(true)
  var currentPage = searchUrl('page');
  myMap = new GoogleMap(currentPage + 'Map', { lat: 40.658927, lng: -73.947732 }, { start: 10, min: 5, max: 15 });
  myMap.initMap();
}

class GoogleMap {

  constructor(mapType, center, zoom) {
    this.mapType = document.getElementById(mapType);
    this.center = center;
    this.zoom = zoom;
    this.map = null;
    this.initMap();
  }


  initMap() {


    const map = new google.maps.Map(this.mapType, {
      center: { lat: this.center.lat, lng: this.center.lng },
      zoom: this.zoom.start,
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
      minZoom: this.zoom.min,
      maxZoom: this.zoom.max
    });

    var geocoder = new google.maps.Geocoder;
    var infowindow = new google.maps.InfoWindow;

    map.addListener('click', function (e) {
      console.log(12345);
      // console.log(geocodeLocation(geocoder, map, infowindow, e));
    });


    this.map = map;
    this.initMarkers();

  }


  initMarkers() {

    var page = searchUrl("page");
    var filter = searchUrl(page + 'ID');



    if (isNaN(filter)) {
      filter = '';
    }



    var data = performAjaxCall(page, filter);

    console.log(page, filter)
    if (!Array.isArray(data)) {
      data = [data];
      console.log(data);
    }

    data.forEach(e => {


      var marker = new google.maps.Marker({
        position: { lat: parseFloat(e.latitude), lng: parseFloat(e.longitude) },
        map: this.map,
        title: e.description,
        icon: {
          url: `http://localhost:8080/SuperheroSightings/img/${page}.svg`,
          scaledSize: new google.maps.Size(15, 15)
        }
      });

      if (filter !== "") {
        openInformationWindow(e, this.map, marker);
      }

      marker.addListener('click', function () {
        openInformationWindow(e, this.map, this);
      });
    });
  }


}


function openInformationWindow(content, map, marker) {


  const infowindow = new google.maps.InfoWindow;
  infowindow.setContent(loadInfo(content));
  infowindow.open(map, marker);
  var windowStyles = $(".displaySighting");
  // windowStyles.parent().parent().parent().css({ width: '100px !important' });
}

function loadInfo(data) {
  return `<div class="displaySighting" style="text-align: center">
     
      <div class="caption preDisplay">
        <h4>Name: ${data.locationName}</h4>
        <h4>Description: ${data.description}</h4>
        <h4>Address: ${data.streetNumber} ${data.streetName} ${data.city} </h4>
        <ul class="displayList">
          <li>  <a href="#" class="btn btn-danger">Delete</a>  </li>
          <li onclick="toggleDetails()">  <a href="#" class="btn btn-primary">Toggle Details</a>  </li>
        </ul>
        <hr>

      </div>
    
      <div id="displayDetails">
       <span style="margin-top: 0" class="text-left"> Details: </span>
        <h4> Organizations </h4>
        <h5> There is currently ${data.associatedOrgs.length} organization(s) at this location</h5>
        <a href="#"> See ralated organizations </a>
        <h4> Sightings </h4>
        <h5> There have been ${data.associatedSightings.length} sighting(s) at this location</h5>
        <a href="#"> See related sightings </a>
      </div>
    </div>`;
}



function toggleDetails() {
  var myDisplay = $("#displayDetails");
  myDisplay.toggle(
    function() {
      myDisplay.addClass('hideDetails')
    },
    function() {
      myDisplay.addClass('showDetails')
    }
  )
  console.log();
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
