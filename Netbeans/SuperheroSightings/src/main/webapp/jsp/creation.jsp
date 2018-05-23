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
                <div class="col-md-12">
                    <span>Create a new Sighting</span>
                </div>
                <div class="col-md-4 step">

                    <h4>Step One</h4>
                    <p>Select the location of the sighting</p>

                                <!--Sort by location-->
                        <div id="locationSort">
                            <a href="#" data-toggle="modal" data-target=".locationSortSortModal" class="btn btn-primary">Add Location</a>
                        </div>

                        <div class="modal fade locationSortSortModal" tabindex="-1" role="dialog" aria-labelledby="myLocationSortModal" aria-hidden="true">
                            <div class="modal-dialog modal-md">

                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">All Locations</h4>
                                    </div>
                                    <div class="modal-body"> 
                                        <label>
                                            <input type="radio"> Lady Liberty
                                        </label>
                                        <label>
                                            <input type="radio"> Mini Max
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

                    <h5>Known locations in database</h5>

                    <div id="locationMap">

                    </div>

                </div>
                <div class="col-md-5 step">
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
                                        <h4>Heroes</h4>
                                        <label>
                                            <input type="checkbox"> All Might
                                        </label>
                                        <hr>
                                        <h4>Villains</h4>
                                        <label>
                                            <input type="checkbox"> Dr. Evil
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
        <script src="${pageContext.request.contextPath}/js/map.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYul2fBF6a03a9OqShrMK6SVzJdfAm-NY&callback=initMap" async defer></script>

    </body>

</html>