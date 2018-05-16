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
                                        <a href="${pageContext.request.contextPath}/viewSightings">Sightings</a>
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
                                    <a href="${pageContext.request.contextPath}/sightings?mapView"> Toggle Map</a>
                                </div>

                                <table class="table" style="display: none">
                                    <tr>
                                        <th> Name </th>
                                        <th> Personality </th>
                                        <th> Date </th>
                                        <th> Organization</th>
                                        <th> Location</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td>All Might</td>
                                        <td>Hero</td>
                                        <td>12/12/2018</td>
                                        <td>UA School</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>All Might</td>
                                        <td>Hero</td>
                                        <td>12/12/2018</td>
                                        <td>UA School</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>All Might</td>
                                        <td>Hero</td>
                                        <td>12/12/2018</td>
                                        <td>UA School</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>All Might</td>
                                        <td>Hero</td>
                                        <td>12/12/2018</td>
                                        <td>UA School</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>All Might</td>
                                        <td>Hero</td>
                                        <td>12/12/2018</td>
                                        <td>UA School</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>All Might</td>
                                        <td>Hero</td>
                                        <td>12/12/2018</td>
                                        <td>UA School</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>All Might</td>
                                        <td>Hero</td>
                                        <td>12/12/2018</td>
                                        <td>UA School</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>All Might</td>
                                        <td>Hero</td>
                                        <td>12/12/2018</td>
                                        <td>UA School</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>All Might</td>
                                        <td>Hero</td>
                                        <td>12/12/2018</td>
                                        <td>UA School</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr id="sightingButtons">
                                        <td colspan="6">
                                            <div class="btn-group" role="group" aria-label="...">
                                                <button type="button" class="btn btn-default">Previous</button>
                                                <button type="button" class="btn btn-default">1 to 10</button>
                                                <button type="button" class="btn btn-default">Next</button>
                                            </div>
                                        </td>
                                    </tr>

                                </table>

                                <div id="map">

                                </div>

                            </div>


                            <div class="col-md-4">
                                <div id="sortingFilterMenu">
                                    <h3>Sighting Filter</h3>

                                    <div class="dropdown">

                                        <button class="btn btn-default dropdown-toggle" type="button" id="characterSortBtn" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="true">
                                            Sort By Character
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                            <li>
                                                <a href="#">All Might</a>
                                            </li>
                                            <li>
                                                <a href="#">Kakashi</a>
                                            </li>
                                            <li>
                                                <a href="#">Itachi</a>
                                            </li>
                                            <li role="separator" class="divider"></li>
                                            <li>
                                                <a href="#">All Characters</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="dropdown">

                                        <button class="btn btn-default dropdown-toggle" type="button" id="organizationSortBtn" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="true">
                                            Sort By Organization
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                            <li>
                                                <a href="#">UAE</a>
                                            </li>
                                            <li>
                                                <a href="#">Akatsuki</a>
                                            </li>
                                            <li>
                                                <a href="#">Ninja*-</a>
                                            </li>
                                            <li role="separator" class="divider"></li>
                                            <li>
                                                <a href="#">All Organizations</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="dropdown">

                                        <button class="btn btn-default dropdown-toggle" type="button" id="locationSortBtn" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="true">
                                            Sort By Location
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu3">
                                            <li>
                                                <a href="#">Brooklyn</a>
                                            </li>
                                            <li>
                                                <a href="#">Manhattan</a>
                                            </li>
                                            <li>
                                                <a href="#">Bronx</a>
                                            </li>
                                            <li role="separator" class="divider"></li>
                                            <li>
                                                <a href="#">All Locations</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="dropdown">

                                        <button class="btn btn-default dropdown-toggle" type="button" id="locationSortBtn" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="true">
                                            Sort By Date
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu3">
                                            <li>
                                                <a href="#">10/20/1028</a>
                                            </li>
                                            <li>
                                                <a href="#">12/20/1028</a>
                                            </li>
                                            <li>
                                                <a href="#">10/20/1018</a>
                                            </li>
                                            <li role="separator" class="divider"></li>
                                            <li>
                                                <a href="#">All Dates</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <a href="#/filterReset"> reset form </a>
                                    <br>
                                    <button id="filterBtn" class="btn btn-primary" style="margin-top: 15px; border-radius: 0">
                                        Filter
                                    </button>
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
                    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYul2fBF6a03a9OqShrMK6SVzJdfAm-NY&callback=initMap" async defer></script>

                </body>

                </html>