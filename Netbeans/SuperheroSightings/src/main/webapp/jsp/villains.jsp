<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
            <%@page contentType="text/html" pageEncoding="UTF-8"%>
                <!DOCTYPE html>
                <html>

                <head>
                    <title>Villains</title>
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
                                    <li role="presentation">
                                        <a href="${pageContext.request.contextPath}/viewSightings?viewType=table">Sightings</a>
                                    </li>
                                    <li role="presentation">
                                        <a href="${pageContext.request.contextPath}/viewHeroes">Heroes</a>
                                    </li>
                                    <li role="presentation" class="active">
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
                            <div class="col-md-5">
                                <!-- <div id="heroesDisplay"> -->
                                <span class="font-size: 14px; padding: 10px 0; font-weight: bold;">Villains Archive</span>
                                <!-- </div>     -->

                                
                                
                                <div class="scrollable">

                                        <table class="table displayTable text-center">
                                            <thead>
                                                <tr>
                                                    <th> Name </th>
                                                    <th> Organization</th>
                                                    <th> Last Sighting </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="i" begin="1" end="${heroes.size() - 1}">
                                                    <tr class='clickable-row' data-href="${pageContext.request.contextPath}/viewSightings?viewType=map&sightingID=${i}">
                                                        <td>
                                                            <c:out value="${heroes[i].name}"></c:out>
                                                        </td>

                                                        <td>
                                                            <c:out value="X-Men"></c:out>
                                                        </td>

                                                        <td>
                                                            <c:out value="${heroes[i].name}"></c:out>
                                                        </td>
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/viewHeroes?id=${i}">edit |</a>
                                                            <a href="${pageContext.request.contextPath}/deleteHero?id=${i}">delete</a>
                                                        </td>

                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                                
                                
                                
                                


                            <div class="col-md-7">
                                <div id="heroForm">

                                    <div class="col-md-5" id="characterImg">
                                        <img src="${pageContext.request.contextPath}/img/villains.jpg" alt="">
                                        <button class="btn btn-danger">
                                            Add Custom Image
                                        </button>

                                        <div>
                                            <h3>Instructions</h3>
                                            <p>Please enter valid data in the form.</p>
                                            <p>If the heroes organization is not available in the dropdown,
                                                <a> click here </a> to add a new one.</p>
                                        </div>

                                    </div>

                                    <div class="col-md-6" id="characterForm">
                                        <h4 class="formHead">Create a new villain</h4>
                                        <form action="" class="displayForm">
                                            <label for="name">Name: </label>
                                            <br>
                                            <input class="formInput" type="text" id="name" placeholder="Enter villain name" />

                                            <label for="superp">Super Power: </label>
                                            <br>
                                            <input class="formInput" type="text" id="superp" placeholder="Enter villain super power" />

                                            <label for="description">Description: </label>
                                            <br>
                                            <input class="formInput" type="text" id="description" placeholder="Enter description" />

                                            <label for="description">Organizations: </label>
                                            <div id="organizationsDisplay">
                                                <a href="#" data-toggle="modal" data-target=".bd-example-modal-lg">+ Add Organizations </a>
                                            </div>

                                            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-md">

                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            <h4 class="modal-title" id="myModalLabel">All Organization</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <label>
                                                                <input type="checkbox"> UA School
                                                            </label>
                                                            <br>
                                                            <label>
                                                                <input type="checkbox"> Akatsuki
                                                            </label>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            <button type="button" class="btn btn-primary">Save changes</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <button class="btn btn-primary"> Submit Villain </button>

                                        </form>
                                    </div>

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