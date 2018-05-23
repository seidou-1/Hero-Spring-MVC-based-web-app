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
                            <div class="col-md-12">
                                <span>Create a new Sighting</span>
                            </div>
                            <div class="col-md-4 step">

                                <h4>Step One</h4>
                                <p>Select the location of the sighting</p>

                                <div class="dropdown">

                                    <button class="btn btn-default dropdown-toggle creationSightingBtn" type="button" id="creationLocation" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        Location
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
                                    </ul>
                                </div>

                                <hr>

                                <h5>Known locations in database</h5>

                                <div class="minimap">
                                    <img src="${pageContext.request.contextPath}/img/map.jpg" alt="Map of NY">
                                </div>

                            </div>
                            <div class="col-md-5 step">
                                <h4>Step Two</h4>
                                <p>Select the characters involved (3 Max) </p>

                                <div class="dropdown">

                                    <button class="btn btn-default dropdown-toggle creationSightingBtn" type="button" id="creationCharacters" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="true">
                                        Character
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
                                    </ul>
                                </div>

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
                                        <td> <img src="${pageContext.request.contextPath}/img/hero.jpg" alt="Char Pic" class="mugshot"></td>
                                        <td> Midoriya </td>
                                        <td> Hero </td>
                                        <td> <a href=""> delete</a> </td>
                                    </tr>
                                    <tr>
                                         <td>2.</td>
                                            <td> <img src="${pageContext.request.contextPath}/img/hero.jpg" alt="Char Pic" class="mugshot"></td>
                                            <td> Midoriya </td>
                                            <td> Hero </td>
                                            <td> <a href=""> delete</a> </td>
                                        </tr>
                                </table>
                            </div>
                            <div class="col-md-3 step">
                                <h4>Step Three</h4>
                                <p>Select the date of the sighting</p>

                                <table class=" table-condensed">
                                    <tr>
                                        <td>
                                            <label for="month">Month: </label>
                                        </td>
                                        <td>
                                            <input type="text" placeholder=" 2 digits (eg 02)">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="month">Day: </label>
                                        </td>
                                        <td>
                                            <input type="text" placeholder="2 digits (eg 14)">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="month">Year: </label>
                                        </td>
                                        <td>
                                            <input type="text" placeholder="4 digits (eg 2018)">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" >
                                            <span>
                                                <a href="#">Today</a>
                                            </span>
                                            <span> | </span>
                                            <span>
                                                <a href="#">Yesterday</a>
                                            </span>
                                            <span> | </span>
                                            <span>
                                                <a href="#">One week ago</a>
                                            </span>
                                        </td>
                                    </tr>
                                </table>
                                <hr>
                                <h4>Step Four</h4>
                                <div class="col-md-6">
                                    <h5>Validate</h5>
                                    <span>Ensure that your data is valid</span> <br>
                                    <button class="btn btn-info"> Check Now</button>
                                </div>
                                <div class="col-md-6 validation">
                                    <h5>Submit</h5>
                                    <span>Finally, submit your sighting</span> <br>
                                    <button class="btn btn-primary"> Submit Now</button>
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

                </body>

                </html>