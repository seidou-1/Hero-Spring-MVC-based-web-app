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
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
                        crossorigin="anonymous">
                </head>

                <body id="locationPage">
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
                                <h3 style="text-align: center">Create a new Sighting</h3>
                                <hr>
                            </div>
                            <div class="col-md-4 step">

                                <div class="step-head" id="locationsHead">
                                    <h4>Step One</h4>
                                    <i class="far fa-times-circle"></i>
                                    <i class="fas fa-check-double"></i>
                                </div>

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


                                                <c:forEach var="i" begin="0" end="${locations.size()-1}">
                                                    <label class="col-md-4 col-lg-4 col-sm-2" style="text-align: left">
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
                                <h5>Known locations in database</h5>

                                <div id="locationsMap">

                                </div>

                            </div>
                            <div class="col-md-4 step">
                                <div class="step-head" id="charactersHead">
                                    <h4>Step Two</h4>
                                    <i class="far fa-times-circle"></i>
                                    <i class="fas fa-check-double"></i>
                                </div>
                                <p>Select the characters involved in the sighting</p>

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
                                                    <h4>${heroes.size()} Heroes</h4>
                                                    <c:forEach var="i" begin="1" end="${heroes.size()-1}">
                                                        <label class="col-md-4 col-lg-4 col-sm-2" style="text-align: left">
                                                            <input class="charactersSelect" value="${heroes[i].characterId}" name="charactersSelect" type="checkbox">
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
                                                <button type="button" id="characterSubmit" class="btn btn-primary" data-dismiss="modal">+ Characters</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end-->
                                <hr>

                                <h5>All of the characters spotted </h5>
                                <table class="table" id="charactersSelected">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Mugshot</th>
                                            <th>Name</th>
                                            <th>Personality</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td colspan="5">
                                                <h4>No Heroes or Villians added yet..</h4>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-4 step">
                                <div class="step-head">
                                    <h4>Step Three</h4>
                                    <i class="far fa-times-circle"></i>
                                    <i class="fas fa-check-double"></i>
                                </div>
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
                                        <input id="sightingDate" type="text" name="sightingDate" value="" hidden>

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
                    <script src="${pageContext.request.contextPath}/js/creation.js"></script>
                    <script src="${pageContext.request.contextPath}/js/moment.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/jquery.datetimepicker.full.js"></script>
                    <script type="module" src="${pageContext.request.contextPath}/js/locations/map.js"></script>
                    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYul2fBF6a03a9OqShrMK6SVzJdfAm-NY" async
                        defer></script>
                    <script>
                        $('#datetimepicker').datetimepicker();
                    </script>

                </body>

                </html>