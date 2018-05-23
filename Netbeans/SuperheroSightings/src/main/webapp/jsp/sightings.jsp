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
                                        <a href="${pageContext.request.contextPath}/viewSightings?viewType=table">Sightings</a>
                                    </li>
                                    <li role="presentation">
                                        <a href="${pageContext.request.contextPath}/viewHeroes">Heroes</a>
                                    </li>
                                    <li role="presentation">
                                        <a href="${pageContext.request.contextPath}/viewVillains">Villains</a>
                                    </li>
                                    <li role="presentation">
                                        <a href="${pageContext.request.contextPath}/viewOrganizations">Organizations</a>
                                    </li>
                                    <li role="presentation">
                                        <a href="${pageContext.request.contextPath}/viewLocations">Locations</a>
                                    </li>
                                </ul>
                                <hr>
                            </div>

                        </div>
                        <div class="row">
                            <!-- <div class="col-md-8" id="maindisplay">  -->
                            <div class="col-md-8">
                                <div id="toggleMap">
                                    <span>Sightings Table</span>
                                    <a href="${pageContext.request.contextPath}/newSighting" class="btn btn-primary">+ Create New</a>

                                    <c:choose>
                                        <c:when test="${viewType =='map'}">
                                            <a href="${pageContext.request.contextPath}/viewSightings?viewType=table"> Toggle Map</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/viewSightings?viewType=map&sightingID=all"> Toggle Map</a>
                                        </c:otherwise>
                                    </c:choose>


                                </div>

                                <c:if test="${viewType == 'table'}">
                                    <div class="scrollable">
                                        <table id="sightingsTable" class="table">
                                            <thead>
                                                <tr>
                                                    <th> Name </th>
                                                    <th> Personality </th>
                                                    <th> Date </th>
                                                    <th> Organization </th>
                                                    <th> Location</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="i" begin="1" end="5">
                                                    <tr class='clickable-row' data-href="${pageContext.request.contextPath}/viewSightings?viewType=map&sightingID=${i}">
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
                                    <div id="map"> </div>
                                </c:if>

                            </div>


                            <div class="col-md-4">
                                <div id="sortingFilterMenu">
                                    <h3>Sighting Filter</h3>

                                    <!--Sort by character-->

                                    <div id="characterSort">
                                        <a href="#" data-toggle="modal" data-target=".characterSortModal" class="btn btn-primary">Sort by Character</a>
                                    </div>

                                    <div class="modal fade characterSortModal" tabindex="-1" role="dialog" aria-labelledby="myCharacterSortModal" aria-hidden="true">
                                        <div class="modal-dialog modal-md">

                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="myModalLabel">All Characters</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <h4>Heroes</h4>
                                                    <label>
                                                        <input type="checkbox"> All Might
                                                    </label>
                                                    <hr>
                                                    <h4>Villains</h4>
                                                    <label>
                                                        <input type="checkbox"> Dr. Evil
                                                    </label>
                                                    <hr>
                                                    <label>
                                                        <input type="checkbox"> All Characters
                                                    </label>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                    <button type="button" class="btn btn-primary">Submit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end-->
                                    <hr>
                                    <!--Sort by organization-->
                                    <div id="organizationSort">
                                        <a href="#" data-toggle="modal" data-target=".organizationSortModal" class="btn btn-primary">Sort by Organization</a>
                                    </div>

                                    <div class="modal fade organizationSortModal" tabindex="-1" role="dialog" aria-labelledby="myOrganizationSortModal" aria-hidden="true">
                                        <div class="modal-dialog modal-md">

                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="myModalLabel">All Organizations</h4>
                                                </div>
                                                <div class="modal-body" id="organizationChoice"></div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                    <button type="button" class="btn btn-primary">Submit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    
                                    
                                    
                                    <!--end-->


                                    <hr>
                                    <!--Sort by location-->
                                    <div id="locationSort">
                                        <a href="#" data-toggle="modal" data-target=".locationSortSortModal" class="btn btn-primary">Sort by Location</a>
                                    </div>

                                    <div class="modal fade locationSortSortModal" tabindex="-1" role="dialog" aria-labelledby="myLocationSortModal" aria-hidden="true">
                                        <div class="modal-dialog modal-md">

                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="myModalLabel">All Locations</h4>
                                                </div>
                                                <div class="modal-body" id="locationChoice"></div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                    <button type="button" class="btn btn-primary">Submit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end-->


                                    <hr>
                                    <!--Sort by date-->
                                    <div id="dateSort">
                                        <a href="#" data-toggle="modal" data-target=".dateSortSortModal" class="btn btn-primary">Sort by Date</a>
                                    </div>

                                    <div class="modal fade dateSortSortModal" tabindex="-1" role="dialog" aria-labelledby="myDateSortModal" aria-hidden="true">
                                        <div class="modal-dialog modal-md">

                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="myModalLabel">All Locations</h4>
                                                </div>
                                                <div class="modal-body" id="dateChoice"></div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                    <button type="button" class="btn btn-primary">Submit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end-->



                                    <a href="#/filterReset"> Reset Filter </a>

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
                    <script src="${pageContext.request.contextPath}/js/map.js"></script>
                    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYul2fBF6a03a9OqShrMK6SVzJdfAm-NY&callback=initMap" async
                        defer></script>

                </body>

                </html>