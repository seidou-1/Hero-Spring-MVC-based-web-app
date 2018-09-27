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
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
                </head>

                <body>
                    <div class="container">
                        <img style="width: 120px; margin: 5px 0;" src="${pageContext.request.contextPath}/img/hero_logo.svg">

                        <div class="row">
                            <!-- <div class="col-md-8" id="maindisplay">  -->
                            <div class="col-md-12">
                                <ul id="navigation">
                                    <li role="presentation">
                                        <a class="active" href="${pageContext.request.contextPath}/index.jsp">Home</a>
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
                                        <a href="${pageContext.request.contextPath}/viewLocations?page=locations&viewType=create&locationsID=all">Locations</a>
                                    </li>
                                </ul>
                                <hr/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7" id="general-info">
                                <h4 class="section-header">General Information</h4>
                                <p class="info-text">In a world where people with superpowers become the norm, the Hero Education and Relationship
                                    Organization (HERO) realized that it was increasing important to know and track the whereabouts
                                    of all the super-heroes and super-villains in the metropolitan city. This application
                                    is designed to serve as the go to destination for all things super!
                                </p>


                                <div id="heroVSvillains" class="carousel slide" data-ride="carousel"> 
                                    <ol class="carousel-indicators">
                                        <li data-target="#heroVSvillains" data-slide-to="1"  class="active"></li>
                                        <li data-target="#heroVSvillains" data-slide-to="2"></li>
                                        <li data-target="#heroVSvillains" data-slide-to="3"></li>
                                    </ol> 
                                    <div class="carousel-inner" role="listbox">

                                        <div class="item active">
                                            <img src="${pageContext.request.contextPath}/img/goodevil.jpg" alt="Heroes Vs Villains" id="vs">
                                            <div class="carousel-caption">
                                                To Infinity, and Beyond!
                                            </div>
                                        </div>
                                        <div class="item ">
                                            <img src="${pageContext.request.contextPath}/img/thor.jpg" alt="Heroes Vs Villains" id="vs">
                                            <div class="carousel-caption">
                                                I am a god, you must bow!
                                            </div>
                                        </div>
                                        <div class="item ">
                                            <img src="${pageContext.request.contextPath}/img/thanos.png" alt="Heroes Vs Villains" id="vs">
                                            <div class="carousel-caption">
                                                Half of you, must die!
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Controls -->
                                    <a class="left carousel-control" href="#heroVSvillains" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#heroVSvillains" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>


                            <div class="col-md-5">
                                <h4 class="section-header">Latest Sightings</h4>
                                <table class="table" id="latest-sightings">
                                    <thead>
                                        <tr>
                                            <th> Name </th>
                                            <th> Date </th>
                                            <th> Location</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="i" begin="0" end="9">
                                            <tr class='clickable-row' data-href="${pageContext.request.contextPath}/viewSightings?page=sightings&viewType=map&sightingsID=${i+1}">
                                                <td>
                                                    <c:out value="${characters[i].name}"></c:out>
                                                </td>

                                                <td>
                                                    <c:out value="${sightings[i].sightingDate}"></c:out>
                                                </td>

                                                <td>
                                                    <c:out value="${locations[i].locationName}"></c:out>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td colspan="3" style="text-align: right">
                                                <a class="btn btn-warning" href="${pageContext.request.contextPath}/viewSightings"> View all Sightings <i class="fas fa-chevron-circle-right"></i> </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

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
                                    <h6>Credit is given where credit is due, with that said I would like to give thanks to the following people who helped on this project!</h6>
                                    <ul> 
                                        <!-- <li>Travon Campbell</li> -->
                                        <!-- Comment in my name (Travon) and comment out yours -->
                                        <li>Mohamed Barry</li>
                                        <li>Jose Sosa</li>
                                        <li>Rich Taveras</li>
                                    </ul>

                                    <h5>This project is intended to demonstrate the skill of developers listed above. It is not intended for profit. With that said. If you would like to donate. Hit me up on the DM and I'll give my paypal. Lol</h5>
                                  
                                    <ul>
                                        <li><a href="https://fontawesome.com/icons?d=gallery">Font Awesome (Icons) </a> </li>
                                        <li><a href="https://www.flaticon.com/">Flaticon (Logo)</a></li>
                                        <li><a href="https://www.superherodb.com/">Character Images</a></li>
                                    </ul>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> 
                                    <a href="https://github.com/seidou-1/Hero-Spring-MVC-based-web-app" target="_blank" class="btn btn-primary">See Code</a> 
                                    <a href="http://www.tenderlovingcode.org" class="btn btn-success" target="_blank"  >Read Story</a> 
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Placed at the end of the document so the pages load faster -->
                    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                  <script type="module" src="${pageContext.request.contextPath}/js/script.js"></script>

                </body>

                </html>