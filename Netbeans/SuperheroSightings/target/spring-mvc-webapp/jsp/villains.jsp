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
                                        <a href="${pageContext.request.contextPath}/viewSightings">Sightings</a>
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


                                <table class="table">
                                    <tr>
                                        <th> Name </th>
                                        <th> Organization</th>
                                        <th> Last Sighting </th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td>Itachi</td>
                                        <td>Akatsuki</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Itachi</td>
                                        <td>Akatsuki</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Itachi</td>
                                        <td>Akatsuki</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Itachi</td>
                                        <td>Akatsuki</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Itachi</td>
                                        <td>Akatsuki</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Itachi</td>
                                        <td>Akatsuki</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Itachi</td>
                                        <td>Akatsuki</td>
                                        <td>NYC</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/edit">edit |</a>
                                            <a href="${pageContext.request.contextPath}">delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Itachi</td>
                                        <td>Akatsuki</td>
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

                                            <label for="organizationsDisplay">Organizations: </label>
                                            <div id="organizationsDisplay">
                                                <span> Akatsuki </span>
                                            </div>

                                            <div class="dropdown formDropDown">

                                                <button class="btn btn-default dropdown-toggle" type="button" id="organizationSortBtn" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="true">
                                                    Organization
                                                    <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                                    <li>
                                                        <a href="#">Akatsuki</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">Ninja</a>
                                                    </li>
                                                </ul>
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