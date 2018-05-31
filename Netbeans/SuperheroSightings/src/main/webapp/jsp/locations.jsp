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
        <link rel="shortcut icon"  href="${pageContext.request.contextPath}/img/hero.jpg" type="image/x-icon">
    </head>

    <body>
        <div class="container">
            <h1 id="logo">HERO</h1>

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
                        <li role="presentation" class="active">
                            <a href="${pageContext.request.contextPath}/viewLocations?page=locations&viewType=create&locationsID=all">Locations</a>
                        </li>
                    </ul>
                    <hr>
                </div>

            </div>
            <div class="row"> 
                <div class="col-md-5"  > 
                    <span class="font-size: 14px; padding: 10px 0; font-weight: bold;">Locations Archive</span>
                    <div class="scrollable">

                        <table class="table text-center displayTable" >
                            <thead>
                                <tr>
                                    <th> Name </th>
                                    <th> Description </th>
                                    <th> City </th>
                                    <th></th>
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
                                            <c:out value="${locations[i].city }" ></c:out>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/viewLocations?page=locations&viewType=edit&locationsID=${locations[i].locationID}">edit |</a>
                                            <a href="${pageContext.request.contextPath}/deleteLocation?locationsID=${locations[i].locationID}">delete</a>
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
                                        <div class="col-md-12"  id="locationsMap" style="height: 500px">
                                    </c:when> 
                                    <c:otherwise> 

                                            <div class="col-md-12"  id="locationsMap">
                                                <div></div>
                                            </div>
                                            <div class="col-md-12">
                                                <h3></h3>
                                                <p>Pro Tip: You could fill in the details manually, or you could use the interactive map
                                                    to select the address.</p>
                                            </div>
                        
                        
                                            <div class="col-md-12">
                                                <form action="newLocation" class="displayForm" method="POST">
                        
                                                    <div class="col-md-6">
                        
                                                        <label for="name">Name: </label> 
                                                        <input class="formInput" type="text" id="name" name ="locationNameJSP" value="${location.locationName}" placeholder="Example (Garden of Eden)" />
                        
                                                        <label for="description">Description: </label> 
                                                        <input class="formInput" type="text" id="description" value="${location.description}" name = "descriptionNameJSP" placeholder="Example (East New York)" />
                        
                                                        <label for="latititude">Latitude: </label>
                                                        <br>
                                                        <input class="formInput" type="double" id="latitude" value="${location.latitude}" name = "latitudeJSP" placeholder="Example (40.34564)" />
                        
                                                        <label for="longitude">Longitude: </label>
                                                        <br>
                                                        <input class="formInput" type="double" id="longitude" value="${location.longitude}" name = "longitudeJSP" placeholder="Example (-74.34564)" />
                        
                                                        <label for="zip">Zip </label>
                                                        <br>
                                                        <input class="formInput" type="text" id="zip" value="${location.zip}" name = "zipJSP" placeholder="Example (11101)" />
                        
                                                    </div>
                        
                                                    <div class="col-md-6">
                        
                                                        <label for="streetNumber">Street Number: </label>
                                                        <br>
                                                        <input class="formInput" type="text" id="streetNumber" value="${location.streetNumber}" name = "streetNumberJSP" placeholder="Example (2719)" />
                        
                                                        <label for="streetName">Street Name </label>
                                                        <br>
                                                        <input class="formInput" type="text" id="streetName" value="${location.streetName}" name = "streetNameJSP" placeholder="Example (Columbus Circle)" />
                        
                                                        <label for="city">City </label>
                                                        <br>
                                                        <input class="formInput" type="text" id="city" value="${location.city}" name = "cityJSP" placeholder="Example (New York)" />
                        
                                                        <label for="state">State </label>
                                                        <br>
                                                        <input class="formInput" type="text" id="state" value="${location.state}" name = "stateJSP" placeholder="Example (NY)" />
                         </div>
                        
                        
                                                    <button class="btn btn-primary"> Submit Location </button>
                                                </form>
                                            </div>
                                    </c:otherwise>
                                </c:choose>



                </div>
                <br><br>

            </div>
        </div>


        <footer>
            <a>Developers</a>
            Copyright 2018 &copy;
        </footer>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/script.js"></script>
        <script src="${pageContext.request.contextPath}/js/map.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYul2fBF6a03a9OqShrMK6SVzJdfAm-NY&callback=initMap" async
        defer></script>

    </body>

</html>