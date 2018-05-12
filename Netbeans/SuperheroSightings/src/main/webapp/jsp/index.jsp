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
    </head>
    <body>
        <div class="container">
            <h1>HERO</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/index.jsp">Sightings</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/load">Heroes</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/load">Villains</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/load">Organizations</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/load">Locations</a></li>
                </ul>    
            </div>
            <div class="row">
                <div class="col-md-8"> 
                    <h4> Toggle Map</h4>
                    <div class="row">
                        <table class="table">
                            <tr> 
                                <th> Name </th>
                                <th> Personality </th>
                                <th> Date </th>
                                <th> Organization</th>
                                <th> Location</th>        
                            </tr>
                            <tr>
                                <td>All Might</td>
                                <td>Hero</td>
                                <td>12/12/2018</td>
                                <td>UA School</td>
                                <td>NYC</td>
                            </tr>
                            <tr>
                                <td>All Might</td>
                                <td>Hero</td>
                                <td>12/12/2018</td>
                                <td>UA School</td>
                                <td>NYC</td>
                            </tr>
                            <tr>
                                <td>All Might</td>
                                <td>Hero</td>
                                <td>12/12/2018</td>
                                <td>UA School</td>
                                <td>NYC</td>
                            </tr>
                            <tr>
                                <td>All Might</td>
                                <td>Hero</td>
                                <td>12/12/2018</td>
                                <td>UA School</td>
                                <td>NYC</td>
                            </tr>
                            <tr>
                                <td>All Might</td>
                                <td>Hero</td>
                                <td>12/12/2018</td>
                                <td>UA School</td>
                                <td>NYC</td>
                            </tr>
                            <tr>
                                <td>All Might</td>
                                <td>Hero</td>
                                <td>12/12/2018</td>
                                <td>UA School</td>
                                <td>NYC</td>
                            </tr>
                            <tr>
                                <td>All Might</td>
                                <td>Hero</td>
                                <td>12/12/2018</td>
                                <td>UA School</td>
                                <td>NYC</td>
                            </tr>
                            <tr>
                                <td>All Might</td>
                                <td>Hero</td>
                                <td>12/12/2018</td>
                                <td>UA School</td>
                                <td>NYC</td>
                            </tr>
                            <tr>
                                <td>All Might</td>
                                <td>Hero</td>
                                <td>12/12/2018</td>
                                <td>UA School</td>
                                <td>NYC</td>
                            </tr>
                            <tr>
                                <td>All Might</td>
                                <td>Hero</td>
                                <td>12/12/2018</td>
                                <td>UA School</td>
                                <td>NYC</td>
                            </tr>
                              <tr>
                                  <td colspan="5">
                                        <div class="btn-group" role="group" aria-label="...">
                                                <button type="button" class="btn btn-default">Previous</button>
                                                <button type="button" class="btn btn-default">1 to 10</button>
                                                <button type="button" class="btn btn-default">Next</button>
                                        </div>
                                  </td>
                            </tr>

                        </table>
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

            </div>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/script.js"></script>

    </body>
</html>

