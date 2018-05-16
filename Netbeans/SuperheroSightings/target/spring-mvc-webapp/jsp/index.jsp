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
                    <ul class="nav nav-tabs" id="navigation">
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
                        <tr>
                            <td>All Might</td>
                            <td>12/12/2018</td>
                            <td>NYC</td>
                        </tr>
                        <tr>
                            <td>All Might</td>
                            <td>12/12/2018</td>
                            <td>NYC</td>
                        </tr>
                        <tr>
                            <td>All Might</td>
                            <td>12/12/2018</td>
                            <td>NYC</td>
                        </tr>
                        <tr>
                            <td>All Might</td>
                            <td>12/12/2018</td>
                            <td>NYC</td>
                        </tr>
                        <tr>
                            <td>All Might</td>
                            <td>12/12/2018</td>
                            <td>NYC</td>
                        </tr>
                        <tr>
                            <td>All Might</td>
                            <td>12/12/2018</td>
                            <td>NYC</td>
                        </tr>
                        <tr>
                            <td>All Might</td>
                            <td>12/12/2018</td>
                            <td>NYC</td>
                        </tr>
                        <tr>
                            <td>All Might</td>
                            <td>12/12/2018</td>
                            <td>NYC</td>
                        </tr>
                        <tr>
                            <td>All Might</td>
                            <td>12/12/2018</td>
                            <td>NYC</td>
                        </tr>
                        <tr>
                            <td>All Might</td>
                            <td>12/12/2018</td>
                            <td>NYC</td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: right">
			    <a href="${pageContext.request.contextPath}/viewSightings" > View all Sightings >> </a>
			    </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
                <div class="col-md-4"> 
                    <h3>Sighting Filter</h3>
                    
                    <div class="dropdown">   
                    <label for="characterSortBtn">1. </label>
                        <button class="btn btn-default dropdown-toggle" type="button" id="characterSortBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            Sort By Character
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <li><a href="#">All Might</a></li>
                            <li><a href="#">Kakashi</a></li>
                            <li><a href="#">Itachi</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">All</a></li>
                        </ul>
                    </div>
                    <div class="dropdown">   
                            <label for="characterSortBtn">2. </label>
                                <button class="btn btn-default dropdown-toggle" type="button" id="characterSortBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    Sort By Organization
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <li><a href="#">UAE</a></li>
                                    <li><a href="#">Akatsuki</a></li>
                                    <li><a href="#">Ninja</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">All</a></li>
                                </ul>
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
