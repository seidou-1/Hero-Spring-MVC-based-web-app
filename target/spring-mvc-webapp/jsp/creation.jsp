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
                        
                    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favi.png" type="image/x-icon" />
                </head>

                <body id="locationPage">
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
                            <div class="col-md-12">
                                <h4 style="text-align: center; font-weight: bold; color: gold">Create a new Sighting</h4>
                                <hr>
                            </div> 
                            <div class="col-md-4 step">

                                <div class="step-head" id="locationsHead">
                                    <h5 style="font-weight: bold; color: rgb(226, 197, 29); margin-top: 5px">Step One</h5> 
                                    <i class="fas fa-check-double"></i>
                                </div>

                                <p style="font-style: italic; color: rgb(253, 253, 252); margin-top: 5px">Select the location of the sighting</p>

                                <!--Sort by location-->
                                <div id="locationSort">
                                    <a href="#" data-toggle="modal" data-target=".locationSortModal" class="btn btn-primary"><i class="fas fa-map-pin"></i> Add Location</a>
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
                                <h6 style="font-style: italic; color: rgb(27, 162, 220); margin-top: 5px"> Known locations in database</h6>

                                <div id="locationsMap">

                                </div>

                            </div>
                            <div class="col-md-4 step">
                                <div class="step-head" id="charactersHead">
                                    <h5 style="font-weight: bold; color: rgb(226, 197, 29); margin-top: 5px">Step Two</h5> 
                                    <i class="fas fa-check-double"></i>
                                </div>
                                <p style="font-style: italic; color: rgb(253, 253, 252); margin-top: 5px">Select the characters involved in the sighting</p>

                                <!--Sort by character-->

                                <div id="characterSort">
                                    <a href="#" data-toggle="modal" data-target=".characterSortModal" class="btn btn-primary"><i class="fas fa-user"></i> Add Character</a>
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

                                <h6 style="font-style: italic; color: rgb(27, 162, 220); margin-top: 5px">All of the characters spotted </h5>
                                <table class="table mytable" id="charactersSelected">
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
                                    <h5 style="font-weight: bold; color: #e2c51d; margin-top: 5px">Step Three</h5>
                                    <i class="fas fa-check-double"></i>
                                </div>
                                <p style="font-style: italic; color: rgb(253, 253, 252); margin-top: 5px">Select the date and time of the sighting</p>
                                <form action="newSighting" method="POST">
                                    <table class=" table-condensed">
                                        <tr>
                                            <input type="text" name="sightingDate" id="datetimepicker">

                                        </tr>

                                    </table>
                                    <hr>
                                    <h5 style="font-weight: bold; color: rgb(226, 197, 29); margin-top: 5px">Step Four</h5>
                                    <div class="col-md-12">
                                        <h5 style="font-style: italic; color: rgb(253, 253, 252); margin-top: 5px">Validate Data and Submit</h5>

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