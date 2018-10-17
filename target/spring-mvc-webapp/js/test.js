
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
