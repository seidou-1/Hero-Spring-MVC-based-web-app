$(document).ready(function () {


    // initMap();
    // console.log(true)

});



var currentMap;

export function searchUrl(keyword) {
    var url_string = window.location.href;
    var url = new URL(url_string);
    return url.searchParams.get(keyword);
}


export function initMap() {
    var currentPage = searchUrl('page');
    var myMap = new GoogleMap(currentPage + 'Map', { lat: 40.658927, lng: -73.947732 }, { start: 10, min: 5, max: 15 });
    currentMap = myMap;
    return myMap;
}

export class GoogleMap {
    constructor(mapType, center, zoom) {
        this.mapType = document.getElementById(mapType);
        this.center = center;
        this.zoom = zoom;
        this.map = null;
        this.initMap();
    }


    initMap(data) {
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
            console.log(geocodeLocation(geocoder, map, infowindow, e));
        });

        this.map = map;
        this.initMarkers(data);

    }


    initMarkers(location) {



        var page = searchUrl("page");
        var filter;
        var selected = false;

        if (typeof location === "undefined") {
            filter = searchUrl(page + 'ID');
        } else {
            filter = location;
            selected = true;
        }


        if (isNaN(filter)) {
            filter = '';
        }
        var data = performAjaxCall(page, filter);


        if (!Array.isArray(data)) {
            data = [data];
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
                openInformationWindow(e, this.map, marker, selected);
            }

            marker.addListener('click', function () {

                openInformationWindow(e, this.map, this, selected);
            });
        });
    }


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

function fillInLocationForm(data) {

    var latitude = $("#latitude")[0];
    var longitude = $("#longitude")[0];
    var streetNumber = $("#streetNumber")[0];
    var streetName = $("#streetName")[0];
    var city = $("#city")[0];
    var state = $("#state")[0];
    var zip = $("#zip")[0];
    streetNumber.value = data.address_components[0].long_name;
    streetName.value = data.address_components[1].long_name;
    city.value = data.address_components[3].long_name;
    state.value = data.address_components[5].long_name;
    zip.value = data.address_components[7].long_name;
    latitude.value = data.geometry.location.lat();
    longitude.value = data.geometry.location.lng();
}


function resetMap() {
    currentMap.initMap();
    $("#hiddenLocation").val("");
    $("#locationsHead i").removeClass("passed");

    $(".locationIn").each((i, el) => {
        $(el).prop('checked', false);
    });
}


function openInformationWindow(content, map, marker, selected) {

    const self = this;

    const infowindow = new google.maps.InfoWindow;
    if (searchUrl('viewType') == 'map' && searchUrl('page') == 'locations') {
        infowindow.setContent(openSelectLocation(content, selected));

    } else {
        if (searchUrl('page') == 'locations') {
            content = performAjaxCall('locations', content.locationID);
            infowindow.setContent(loadInfo(content));
        }
        else if (searchUrl('page') == 'sightings') {
            content.character = performAjaxCall('character', content.CharacterID);
            infowindow.setContent(loadInfo(content, true));
        }

    }
    infowindow.open(map, marker);

    $("#changeLocation").click(() => {
        resetMap();
    })

    $("#changeLocation").click(() => {
        resetMap();
    })


    const button = $("#selectionLocation");
    button.click(() => {
        selectLocation($(button)[0].dataset.id);
    });
    var windowStyles = $(".displaySighting");
    // windowStyles.parent().parent().parent().css({ width: '100px !important' });
}



export function loadInfo(data, isSighting) {
    console.log(data)
    let returnMe;

    if (!isSighting) {
        returnMe = `<div class="displaySighting" style="text-align: center">
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
        <a href="#"> See related organizations </a>
        <h4> Sightings </h4>
        <h5> There has been ${data.associatedSightings.length} sighting(s) at this location</h5>
        <a href="#"> See related sightings </a>
      </div>
    </div>`;
    } else {
        returnMe = `<div class="displaySighting" style="text-align: center">
        <div class="caption preDisplay">
        <img src="${data.character.photo}">
          <h4>Character Name: ${data.CharacterName}</h4>
          <h4>Description: ${data.character.description}</h4>
          <h4>Location: ${data.LocationName} </h4> 
          <h4>Time & Date: ${data.SightingDate} </h4> 
      </div>`
    }


    return returnMe;
}



function openSelectLocation(data, selected) {

    var myLocation = `<div class="displaySighting" style="text-align: center">
  <div class="caption">
    <h5>Name: ${data.locationName}</h5>
    <h5>Description: ${data.description}</h5> 
    <ul class="displayList2">`;

    if (selected) {
        myLocation += `
      <li>  <i class="fas fa-check-double passed" style="font-size: 30px;"></i> Location Selected </li> <br>
      <li>  <a href="#" class="btn btn-danger" id="changeLocation">Change Location</a>  </li>
    </ul>
    </div>;
      `;
    } else {
        myLocation += `
      <hr>
      <li>  <a href="#" data-id="${data.locationID}" class="btn btn-success" id="selectionLocation">Select Location</a>  </li>
    </ul>
    </div>;
      `;
    }



    return myLocation;
}

function resetLocations() {
    console.log("We pray")
}



function selectLocation(data) {
    console.log(data)

    $(".locationIn").each((index, element) => {
        if ($(element).val() == data) {
            $(element).prop('checked', true);
            $("#hiddenLocation").val($(element).val());
            $("#locationsHead i").addClass("passed");
            currentMap.initMap($(element).val());
        } else {
            $(element).prop('checked', false);
        }
    })

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
