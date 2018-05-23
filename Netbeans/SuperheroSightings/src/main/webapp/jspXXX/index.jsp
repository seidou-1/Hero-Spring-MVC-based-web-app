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
                        <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/viewSightings">Sightings</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/viewHeroes">Heroes</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/viewVillains">Villains</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/viewOrganizations">Organizations</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/viewLocations">Locations</a></li>
                    </ul>
                    <hr/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <h4>General Information</h4>
                    <p>In a world where people with superpowers become the norm, the Hero Education and Relationship Organization (HERO) realised that it was increasing important
                        to know and track the where abouts of all the superheroes and supervillains in the metropolitan city. This application is designed to serve as the go to 
                        destination for all things super!
                    </p>
                    <img src="${pageContext.request.contextPath}/img/vs.jpg" alt="Heroes Vs Villains" id="vs">
                </div>


                <div class="col-md-4">
                    <h4>Latest Sightings</h4>
                    <table class="table">
                        <tr>
                            <th> Name </th>
                            <th> Date </th>
                            <th> Location</th>
                        </tr>
                        <c:forEach var="currentSighting" items="${sightings}">
                            <tr>
                                <td>
                                    <c:out value="${currentSighting.characterId}"></c:out>
                                </td>
                                
                                <td>
                                    <c:out value="${currentSighting.sightingDate}"></c:out>
                                </td>
                                
                                <td>
                                    <c:out value="${currentSighting.locationId}"></c:out>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="3" style="text-align: right">
                                <a href="${pageContext.request.contextPath}/viewSightings" > View all Sightings >> </a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
      
        <footer>
            <a>Developers</a>
            Copyright 2018 	&copy;
        </footer>

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/script.js"></script>

    </body>

</html>
