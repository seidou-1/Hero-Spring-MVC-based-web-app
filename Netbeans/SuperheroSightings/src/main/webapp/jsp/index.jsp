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
                                    <li role="presentation" class="active">
                                        <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
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
                            <div class="col-md-7">
                                <h4>General Information</h4>
                                <p>In a world where people with superpowers become the norm, the Hero Education and Relationship
                                    Organization (HERO) realized that it was increasing important to know and track the whereabouts
                                    of all the super-heroes and super-villains in the metropolitan city. This application
                                    is designed to serve as the go to destination for all things super!
                                </p>

                                <img src="${pageContext.request.contextPath}/img/vs.jpg" alt="Heroes Vs Villains" id="vs">
                            </div>


                            <div class="col-md-5">
                                <h4>Latest Sightings</h4>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th> Name </th>
                                            <th> Date </th>
                                            <th> Location</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="i" begin="0" end="9">
                                            <tr class='clickable-row' data-href="${pageContext.request.contextPath}/viewSightings?viewType=map&sightingID=${i}">
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
                                                <a href="${pageContext.request.contextPath}/viewSightings"> View all Sightings >> </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

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
                                    <h5 class="modal-title" id="moreInfoTitle">Curious? Find out more here</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <h6>If you enter your phone number that you used to register you can do the following things.</h6>
                                    <ul>
                                        <li>See your current location's five day forecast</li>
                                        <li>See the time and current weather conditions in Dominica and 2 other places of your
                                            choice in the world.</li>
                                        <li>Like and share our favorite quotes with your friends. They might just be having a
                                            tough day</li>
                                    </ul>
                                    <hr>
                                    <h6>Option 1: Alright. All of that sounds great! Get started by clicking sign up below</h6>
                                    <h6>Option 2: I already signed up, but I can't remember my phone number. To get it back sent
                                        to you, click reset below</h6>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <a class="btn btn-danger" href="#" data-dismiss="modal" data-toggle="modal" data-target="#resetMe"> Reset</a>
                                    <a class="btn btn-primary" href="#" data-dismiss="modal" data-toggle="modal" data-target="#registerMe"> Sign Up</a>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Placed at the end of the document so the pages load faster -->
                    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/script.js"></script>

                </body>

                </html>