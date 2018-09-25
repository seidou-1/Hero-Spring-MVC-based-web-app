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
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
                        crossorigin="anonymous">

                </head>

                <body>
                    <div class="container">
                        <img style="width: 120px; margin: 5px 0; color: green " src="${pageContext.request.contextPath}/img/hero_logo.svg">


                        <div class="row">
                            <!-- <div class="col-md-8" id="maindisplay">  -->
                            <div class="col-md-12">
                                <ul id="navigation">
                                    <li role="presentation">
                                        <a href="${pageContext.request.contextPath}/index">Home</a>
                                    </li>
                                    <li role="presentation">
                                        <a class="active" href="${pageContext.request.contextPath}/viewSightings?page=sightings&viewType=table">Sightings</a>
                                    </li>
                                    <li role="presentation">
                                        <a href="${pageContext.request.contextPath}/viewHeroes?page=heroes&viewType=create">Heroes</a>
                                    </li>
                                    <li role="presentation">
                                        <a href="${pageContext.request.contextPath}/viewVillains?page=villains&viewType=create">Villains</a>
                                    </li>
                                    <li role="presentation">
                                        <a href="${pageContext.request.contextPath}/viewOrganizations?page=organizations&viewType=create">Organizations</a>
                                    </li>
                                    <li role="presentation">
                                        <a href="${pageContext.request.contextPath}/viewLocations?page=locations&viewType=create&locationsID=all">Locations</a>
                                    </li>
                                </ul>
                                <hr>
                            </div>

                        </div>
                        <div class="row">
                            <!-- <div class="col-md-8" id="maindisplay">  -->
                            <div class="col-md-9">
                                <div id="toggleMap">
                                    <c:choose>
                                        <c:when test="${viewType =='map'}">
                                            <a href="${pageContext.request.contextPath}/viewSightings?page=sightings&viewType=table&sightingsID=all"> Toggle Map</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/viewSightings?page=sightings&viewType=map&sightingsID=all"> Toggle Map</a>
                                        </c:otherwise>
                                    </c:choose>

                                    <a href="${pageContext.request.contextPath}/newSighting?page=locations&viewType=map&locationsID=all" class="btn btn-primary">
                                        <i class="fas fa-plus-circle"></i> Create New</a>




                                </div>

                                <c:if test="${viewType == 'table'}">
                                    <div class="scrollable">
                                        <table id="sightingsTable" class="table">
                                            <thead>

                                                <th> Name </th>
                                                <th> Personality </th>
                                                <th> Date </th>
                                                <th> Organization </th>
                                                <th> Location</th>
                                                <th class="table-name"> All Sightings</th>

                                            </thead>
                                            <tbody>
                                                <c:forEach var="i" begin="1" end="${characters.size() - 1}">
                                                    <tr class='clickable-row' data-href="${pageContext.request.contextPath}/viewSightings?page=sightings&viewType=map&sightingsID=${i}">
                                                        <td>
                                                            <c:out value="${characters[i].name}"></c:out>
                                                        </td>

                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${characters[i].isSuperHero == true}">
                                                                    <c:out value="Hero"></c:out>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:out value="Villain"></c:out>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>

                                                        <td>
                                                            <c:out value="${sightings[i].sightingDate}"></c:out>
                                                        </td>

                                                        <td>
                                                            <c:out value="X-men"></c:out>
                                                        </td>

                                                        <td>
                                                            <c:out value="${locations[i].locationName}"></c:out>
                                                        </td>
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                                            <a href="${pageContext.request.contextPath}">delete</a>
                                                        </td>

                                                    </tr>
                                                </c:forEach>

                                            </tbody>


                                        </table>

                                    </div>
                                </c:if>

                                <c:if test="${viewType == 'map'}">
                                    <input type="text" id="sightingID" value="${sightingID}" hidden>
                                    <div id="sightingsMap" class="map"> </div>
                                </c:if>

                            </div>


                            <div class="col-md-3">
                                <div id="sortingFilterMenu">
                                    <h4 class="filter-head">Sighting Filter</h4>

                                    <hr>
                                    <!--Sort by character-->

                                    <div id="characterSort">
                                        <a href="#" data-toggle="modal" data-target=".characterSortModal" class="btn btn-primary filter">Filter by Character</a>
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
                                                        <h4>${heroes.size()} Heroes</h4>
                                                        <c:forEach var="i" begin="1" end="${heroes.size()-1}">
                                                            <label class="col-md-4 col-lg-4 col-sm-2" style="text-align: left">
                                                                <input class="charactersSelect" value="${heroes[i].characterId}" name="charactersSelect" type="radio">
                                                                <span class="locationModal">
                                                                    <c:out value="${heroes[i].name}"></c:out>
                                                                </span>
                                                            </label>
                                                        </c:forEach>
                                                    </div>
                                                    <hr>
                                                    <div class="character-type">
                                                        <h4>${villians.size()} Villains</h4>
                                                        <c:forEach var="i" begin="1" end="${villians.size()-1}">
                                                            <label class="col-md-4 col-lg-4 col-sm-2" style="text-align: left">
                                                                <input class="charactersSelect" value="${villians[i].characterId}" name="charactersSelect" type="radio">
                                                                <span class="locationModal">
                                                                    <c:out value="${villians[i].name}"></c:out>
                                                                </span>
                                                            </label>
                                                        </c:forEach>
                                                    </div>


                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                    <button type="button" class="btn btn-primary">Filter Sightings</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end-->
                                    <!-- <hr > -->
                                <p style="margin: 10px 0; color: white;">or</p>
                                    <!--Sort by organization-->
                                    <div id="organizationSort">
                                        <a href="#" data-toggle="modal" data-target=".organizationSortModal" class="btn btn-primary filter">Filters by Organization</a>
                                    </div>

                                    <div class="modal fade organizationSortModal" tabindex="-1" role="dialog" aria-labelledby="myOrganizationSortModal" aria-hidden="true">
                                        <div class="modal-dialog modal-md">

                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="myModalLabel">All Organizations</h4>
                                                </div>
                                                <div class="modal-body" id="organizationChoice">
                                                    <div style="position: relative;">
                                                        <c:forEach var="i" begin="0" end="${organizations.size()-1}">
                                                            <div class="col-md-6 col-lg-6 col-sm-12" style="text-align: left; display: block">
                                                                <input class="organizationIn" value="${organizations[i].organizationId}" name="organization" type="radio">
                                                                <span class="organizationModal">
                                                                    <c:out value="${organizations[i].organizationName}"></c:out>
                                                                </span>
                                                            </div>
                                                        </c:forEach>
                                                    </div>


                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                    <button type="button" class="btn btn-primary">Filter Sightings</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>




                                    <!--end-->


                                    <p style="margin: 10px 0; color: white;">or</p>
                                    <!--Sort by location-->
                                    <div id="locationSort">
                                        <a href="#" data-toggle="modal" data-target=".locationSortModal" class="btn btn-primary filter">Filter by Location</a>
                                    </div>

                                    <div class="modal fade locationSortModal" tabindex="-1" role="dialog" aria-labelledby="myLocationSortModal" aria-hidden="true">
                                        <div class="modal-dialog modal-md">

                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="myModalLabel">All Locations</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div style="position: relative;">
                                                        <c:forEach var="i" begin="0" end="${locate.size()-1}">
                                                            <div class="col-md-4 col-lg-4 col-sm-12" style="text-align: left; display: block">
                                                                <input class="locationIn" value="${locate[i].locationID}" name="location" type="radio">
                                                                <span class="locationModal">
                                                                    <c:out value="${locate[i].locationName}"></c:out>
                                                                </span>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                    <button type="button" class="btn btn-primary">Filter Sightings</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end-->
                                    
                                    <br>
                                    <a style="color:lightblue; font-weight: bold" href="#/filterReset"> Reset filter </a>

                                </div>
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
                                    <h5 style="font-weight: bold">Below is a list of all contributers to this project</h5>
                                    <h6>Credit is given where credit is due, with that said I would like to give thanks to the
                                        following people who helped on this project!</h6>
                                    <ul>
                                        <li>Mohamed Barry</li>
                                        <li>Jose Sosa</li>
                                        <li>Rich Taveras</li>
                                    </ul>

                                    <h5>This project is intended to demonstrate the skill of developers listed above. It is not
                                        intended for profit. With that said. If you would like to donate. Hit me up on the
                                        DM and I'll give my paypal. Lol</h5>

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
                                    <a href="http://www.tenderlovingcode.org" class="btn btn-success" target="_blank">Read Story</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Placed at the end of the document so the pages load faster -->
                    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/script.js"></script>
                    <script src="${pageContext.request.contextPath}/js/map.js"></script>
                    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYul2fBF6a03a9OqShrMK6SVzJdfAm-NY&callback=initMap" async
                        defer></script>

                </body>

                </html>