<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Locations</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">

        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favi.png" type="image/x-icon" />
    </head>


    <body>
        <div class="container">
            <img style="width: 120px; margin: 5px 0;" src="${pageContext.request.contextPath}/img/hero_logo.svg">

            <div class="row">

                <div class="row">
                    <div class="col-md-12">
                        <ul id="navigation">
                            <li role="presentation">
                                <a href="${pageContext.request.contextPath}/index">Home</a>
                            </li>
                            <li role="presentation">
                                <a href="${pageContext.request.contextPath}/viewSightings?page=sightings&viewType=table">Sightings</a>
                            </li>
                            <li role="presentation">
                                <a href="${pageContext.request.contextPath}/viewHeroes?viewType=create">Heroes</a>
                            </li>
                            <li role="presentation">
                                <a href="${pageContext.request.contextPath}/viewVillains?viewType=create">Villains</a>
                            </li>
                            <li role="presentation">
                                <a href="${pageContext.request.contextPath}/viewOrganizations?viewType=create">Organizations</a>
                            </li>
                            <li role="presentation">
                                <a class="active" href="${pageContext.request.contextPath}/viewLocations?page=locations&viewType=create&locationsID=all">Locations</a>
                            </li>
                        </ul>
                        <hr>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-5 ">

                        <div class="scrollable">

                            <table class="table text-center displayTable mytable">
                                <thead>
                                    <tr>
                                        <th> Name </th>
                                        <th> Description </th>
                                        <th> City </th>
                                        <th class="table-name">All Locations</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach var="i" begin="1" end="${locations.size() -1 }">
                                        <tr class='clickable-row' data-href="${pageContext.request.contextPath}/viewLocations?page=locations&viewType=view&locationsID=${locations[i].locationID}">
                                            <td>
                                                <c:out value="${locations[i].locationName}"></c:out>
                                                </td>

                                                <td>
                                                <c:out value="${locations[i].description}"></c:out>
                                                </td>

                                                <td>
                                                <c:out value="${locations[i].city }"></c:out>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/viewLocations?page=locations&viewType=edit&locationsID=${locations[i].locationID}">edit</a>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>


                    <div class="col-md-7" id="locationTab">
                        <c:choose>
                            <c:when test="${display == 'view'}">
                                <h4 class="formHead">View a Location</h4>
                            </c:when>
                            <c:when test="${display == 'edit'}">
                                <h4 class="formHead">Edit a Location</h4>
                            </c:when>
                            <c:otherwise>
                                <h4 class="formHead">Create a new Location</h4>
                            </c:otherwise>
                        </c:choose>


                        <c:choose>
                            <c:when test="${display == 'view'}">
                                <div class="col-md-12" id="locationsMap" style="height: 500px">
                                </c:when>
                                <c:otherwise>

                                    <div class="col-md-12" id="locationsMap" style="height: 400px">
                                        <div></div>
                                    </div>
                                    <div class="col-md-12">
                                        <h3></h3>
                                        <p style="font-style: italic; color: whitesmoke">Pro Tip: It's better to enter the name and the description, and then just click on the map above to populate the rest of the fields!</p>
                                    </div>


                                    <div class="col-md-12">
                                        <form action="newLocation" class="displayForm" method="POST">

                                            <div class="col-md-6">

                                                <label for="name">Name: </label>
                                                <input class="formInput" type="text" id="name" name="locationNameJSP" value="${location.locationName}" placeholder="Example (Garden of Eden)"
                                                       />

                                                <label for="description">Description: </label>
                                                <input class="formInput" type="text" id="description" value="${location.description}" name="descriptionNameJSP" placeholder="Example (East New York)"
                                                       />

                                                <label for="latititude">Latitude: </label>
                                                <br>
                                                <input class="formInput" type="double" id="latitude" value="${location.latitude}" name="latitudeJSP" placeholder="Example (40.34564)"
                                                       />

                                                <label for="longitude">Longitude: </label>
                                                <br>
                                                <input class="formInput" type="double" id="longitude" value="${location.longitude}" name="longitudeJSP" placeholder="Example (-74.34564)"
                                                       />

                                                <label for="zip">Zip </label>
                                                <br>
                                                <input class="formInput" type="text" id="zip" value="${location.zip}" name="zipJSP" placeholder="Example (11101)" />

                                            </div>

                                            <div class="col-md-6">

                                                <label for="streetNumber">Street Number: </label>
                                                <br>
                                                <input class="formInput" type="text" id="streetNumber" value="${location.streetNumber}" name="streetNumberJSP" placeholder="Example (2719)"
                                                       />

                                                <label for="streetName">Street Name </label>
                                                <br>
                                                <input class="formInput" type="text" id="streetName" value="${location.streetName}" name="streetNameJSP" placeholder="Example (Columbus Circle)"
                                                       />

                                                <label for="city">City </label>
                                                <br>
                                                <input class="formInput" type="text" id="city" value="${location.city}" name="cityJSP" placeholder="Example (New York)" />

                                                <label for="state">State </label>
                                                <br>
                                                <input class="formInput" type="text" id="state" value="${location.state}" name="stateJSP" placeholder="Example (NY)" />
                                            </div>


                                            <button class="btn btn-primary"> Submit Location </button>
                                        </form>
                                    </div>
                                </c:otherwise>
                            </c:choose>



                        </div>
                        <br>
                        <br>

                    </div>
                </div>
            </div>

            <footer>
                <a href="#" data-toggle="modal" data-target="#moreInfo">Developers</a>
                Copyright 2018 &copy;
            </footer>

            <div class="modal fade" id="moreInfo" tabindex="-1" role="dialog" aria-labelledby="moreInfoTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="moreInfoTitle">Developer Credits</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h5 style="font-weight: bold">Below is the list of contributers in alphabetical order, who completed this project</h5>

                            <ul>
                                <li>Mohamed Barry</li>
                                <li>Travon Campbell</li>  
                                <li>Jose Sosa</li>
                                <li>Rich Taveras</li>
                            </ul>

                            <h5>This project is intended to demonstrate the skill of developers listed above. It
                                is not intended for profit. With that said. If you would like to donate. Hit
                                me us on the DM and we'll give you the paypal account. Lol</h5>

                            <ul>
                                <li>
                                    <a href="https://fontawesome.com/icons?d=gallery">Font Awesome (Icons) </a>
                                </li>
                                <li>
                                    <a href="https://www.flaticon.com/">Flaticon (Logo)</a>
                                </li>
                                <li>
                                    <a href="https://www.superherodb.com/">Character Images</a>
                                </li>
                            </ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <a href="https://github.com/seidou-1/Hero-Spring-MVC-based-web-app" target="_blank" class="btn btn-primary">See Code</a>
                            <a href="http://www.tenderlovingcode.org/hero" class="btn btn-success" target="_blank">Read Story</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Placed at the end of the document so the pages load faster -->
            <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
            <script type="module" src="${pageContext.request.contextPath}/js/script.js"></script>
            <script type="module" src="${pageContext.request.contextPath}/js/locations/map.js"></script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYul2fBF6a03a9OqShrMK6SVzJdfAm-NY" async
            defer></script>

    </body>

</html>