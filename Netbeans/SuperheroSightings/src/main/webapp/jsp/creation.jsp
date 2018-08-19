<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
            <%@page contentType="text/html" pageEncoding="UTF-8"%>
                <!DOCTYPE html>
                <html>

                <head>
                    <title>Index Page</title>
                    <!-- Bootstrap core CSS -->
                    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
                    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
                    <link href="${pageContext.request.contextPath}/css/jquery.datetimepicker.min.css" rel="stylesheet">
                </head>

                <body>
                    <div class="container">
                        <h1 id="logo">HERO</h1>

                        <div class="row">
                            <!-- <div class="col-md-8" id="maindisplay">  -->
                            <div class="col-md-12">
                                <ul id="navigation">
                                    <li role="presentation">
                                        <a href="${pageContext.request.contextPath}/index">Home</a>
                                    </li>
                                    <li role="presentation" class="active">
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
                                        <a href="${pageContext.request.contextPath}/viewLocations?page=locations&viewType=create&locationsID=all">Locations</a>
                                    </li>
                                </ul>
                                <hr>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <span>Create a new Sighting</span>
                            </div>
                            <div class="col-md-4 step">

                                <h4>Step One</h4>
                                <p>Select the location of the sighting</p>

                                <!--Sort by location-->
                                <div id="locationSort">
                                    <a href="#" data-toggle="modal" data-target=".locationSortModal" class="btn btn-primary">Add Location</a>
                                </div>

                                <div class="modal fade locationSortModal" tabindex="-1" role="dialog" aria-labelledby="myLocationSortModal" aria-hidden="true">
                                    <div class="modal-dialog modal-md">

                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel">All Locations</h4>
                                            </div>
                                            <div class="modal-body row">


                                                <c:forEach var="i" begin="1" end="9">
                                                    <label class="col-md-4 col-lg-4 col-sm-2">
                                                        <input class="locationIn" value="${locations[i].locationID}" name="location" type="radio">
                                                        <span class="locationModal">
                                                            <c:out value="${locations[i].locationName}"></c:out>
                                                        </span>
                                                    </label>
                                                </c:forEach>




                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                <button type="button" class="btn btn-primary" data-dismiss="modal" id="locationSubmit"> + Location</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end-->


                                <hr>

                                <h5>Known locations in database</h5>

                                <div id="locationsMap">

                                </div>

                            </div>
                            <div class="col-md-4 step">
                                <h4>Step Two</h4>
                                <p>Select the characters involved (3 Max) </p>

                                <!--Sort by character-->

                                <div id="characterSort">
                                    <a href="#" data-toggle="modal" data-target=".characterSortModal" class="btn btn-primary">Add Character</a>
                                </div>

                                <div class="modal fade characterSortModal" tabindex="-1" role="dialog" aria-labelledby="myCharacterSortModal" aria-hidden="true">
                                    <div class="modal-dialog modal-md">

                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel">All Characters</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="character-type">
                                                    <h4>${heroes.size()-1} Heroes</h4>
                                                    <c:forEach var="i" begin="1" end="${heroes.size()-1}">
                                                        <label class="col-md-4 col-lg-4 col-sm-2">
                                                            <input class="charactersSelect"  value="${heroes[i].characterId}" name="charactersSelect" type="checkbox">
                                                            <span class="locationModal">
                                                                <c:out value="${heroes[i].name}"></c:out>
                                                            </span>
                                                        </label>
                                                    </c:forEach>
                                                </div>
                                                <hr>
                                                <div class="character-type">
                                                    <h4>${villians.size()-1} Villains</h4>
                                                    <c:forEach var="i" begin="1" end="${villians.size()-1}">
                                                        <label class="col-md-4 col-lg-4 col-sm-2">
                                                            <input class="charactersSelect" value="${villians[i].characterId}" name="charactersSelect" type="checkbox">
                                                            <span class="locationModal">
                                                                <c:out value="${villians[i].name}"></c:out>
                                                            </span>
                                                        </label>
                                                    </c:forEach>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                <button type="button" id="characterSubmit" class="btn btn-primary" data-dismiss="modal" >+ Characters</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end-->
                                <hr>

                                <h5>All of the characters spotted </h5>
                                <table class="table">
                                    <tr>
                                        <th></th>
                                        <th>Mugshot</th>
                                        <th>Name</th>
                                        <th>Personality</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td>1.</td>
                                        <td>
                                            <img src="${pageContext.request.contextPath}/img/hero.jpg" alt="Char Pic" class="mugshot">
                                        </td>
                                        <td> Midoriya </td>
                                        <td> Hero </td>
                                        <td>
                                            <a href=""> delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2.</td>
                                        <td>
                                            <img src="${pageContext.request.contextPath}/img/hero.jpg" alt="Char Pic" class="mugshot">
                                        </td>
                                        <td> Midoriya </td>
                                        <td> Hero </td>
                                        <td>
                                            <a href=""> delete</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-md-4 step">
                                <h4>Step Three</h4>
                                <p>Select the date and time of the sighting</p>
                                <form action="newSighting" method="POST">
                                <table class=" table-condensed">
                                    <tr> 
                                    <input type="text" name="sightingDate" id="datetimepicker">

                                    </tr>
              
                                </table>
                                <hr>
                                <h4>Step Four</h4>
                                <div class="col-md-12">
                                    <h5>Validate Data and Submit</h5> 
                                  
                                    <input id="hiddenLocation" type="text" name="locationid" hidden value="1">
                                    <input id="hiddenCharacters" type="text" name="charID" hidden value="1"> 
                                    <input id="sightingDate" type="text" name="sightingDate"  value="" hidden> 

                                    <button class="btn btn-primary"> Confirm and Submit Now</button>
                                    </form>
                                </div>
                            </div>

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
                    <script src="${pageContext.request.contextPath}/js/moment.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/jquery.datetimepicker.full.js"></script>
                    <!-- <script src="${pageContext.request.contextPath}/js/map.js"></script> -->
                    <!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYul2fBF6a03a9OqShrMK6SVzJdfAm-NY&callback=initMap" async -->
                        defer></script>
                    <script>
                        $('#datetimepicker').datetimepicker();
                    </script>

                </body>

                </html>