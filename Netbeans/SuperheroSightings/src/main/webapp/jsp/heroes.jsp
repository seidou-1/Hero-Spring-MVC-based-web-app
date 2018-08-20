
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
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
                        <li role="presentation">
                            <a href="${pageContext.request.contextPath}/viewSightings?page=sightings&viewType=table">Sightings</a>
                        </li>
                        <li role="presentation" class="active">
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
                    <hr>
                </div>

            </div>
            <div class="row">
                <!-- <div class="col-md-8" id="maindisplay">  -->
                <div class="col-md-5">
                    <!-- <div id="heroesDisplay"> -->
                    <span class="font-size: 14px; padding: 10px 0; font-weight: bold;">Heroes Archive</span>
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
                                    <tr class='clickable-row' data-href="${pageContext.request.contextPath}/viewHeroes?viewType=view&characterId=${heroes[i].characterId}">
                                        <td> 
                                            <c:out value="${heroes[i].name}"></c:out>
                                            </td>

                                            <td>
                                            <c:out value="${heroes[i].orgList[0].organizationName}"></c:out>
                                            </td>

                                            <td>
                                            <c:out value="${heroes[i].name}"></c:out>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/viewHeroes?viewType=edit&characterId=${heroes[i].characterId}">edit</a>
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


                            <c:choose>
                                <c:when test="${display == 'edit'}">
                                    <img src="${pageContext.request.contextPath}/img/hero.jpg" alt="small" class="viewImage">
                                    <hr>
                                    <div>
                                        <h4>Instructions</h4>
                                        <ul>
                                            <li>Enter new data then click Update now to commit.</li>
                                            <li>If the hero's organization is not available in the dropdown,
                                                <a href="${pageContext.request.contextPath}/viewOrganizations"> click here </a> to add a new one.</li>
                                        </ul>
                                    </div>
                                </c:when>

                                <c:when test="${display == 'view'}">
                                    <img src="${pageContext.request.contextPath}/img/hero.jpg" alt="small" class="viewImage">
                                    <hr>
                                    <div>
                                        <table class="table-condensed table">
                                            <tr>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/" class="btn btn-danger viewButtons"> Create Sighting</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/viewHeroes?viewType=edit&characterId=${hero.characterId}" class="btn btn-danger viewButtons">Edit Hero</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="" data-toggle="modal" data-target="#confirmDelete" class="btn btn-danger viewButtons"> Delete Hero</a>

                                                    <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                    <h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <h4>Are you sure you want to delete that hero?</h4>
                                                                </div>
                                                                <div class="modal-footer"> 
                                                                    <a href="" class="btn btn-primary"  data-dismiss="modal">Cancel</a>
                                                                    <a href="${pageContext.request.contextPath}/deleteHero?characterId=${hero.characterId}" class="btn btn-danger">Delete</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                </c:when>
                                <c:otherwise>

                                    <img src="${pageContext.request.contextPath}/img/hero.jpg" alt="small" class="creatingImage">
                                    <br>
                                    <br>

                                    <form>
                                        <input type="file" name="file" id="imagesToUpload" class="inputfile" data-multiple-caption="{count} files selected" multiple/>
                                        <label for="imagesToUpload">
                                            <div class="glyphicon glyphicon-cloud-upload" aria-hidden="true"></div>
                                            <span>Choose a file</span>
                                        </label>
                                        <br>
                                        <br>
                                        <p class="btn btn-danger" onclick="uploadImages()"> Upload </p>
                                    </form>
                                    <div>
                                        <h4>Instructions</h4>
                                        <ul>
                                            <li>Add image (Optional)</li>
                                            <li>Fill in the form with valid data then click submit hero.</li>
                                            <li>If the hero's organization is not available in the dropdown,
                                                <a href="${pageContext.request.contextPath}/viewOrganizations"> click here </a> to add a new one.</li>
                                        </ul>
                                    </div>
                                </c:otherwise>



                            </c:choose>





                        </div>



                        <div class="col-md-6" id="createHeroForm">
                            <c:choose>
                                <c:when test="${display == 'view'}">
                                    <h4 class="formHead">View a hero</h4>
                                </c:when>
                                <c:when test="${display == 'edit'}">
                                    <h4 class="formHead">Edit a hero</h4>
                                </c:when>
                                <c:otherwise>
                                    <h4 class="formHead">Create a hero</h4>
                                </c:otherwise>
                            </c:choose>


                            <c:choose>
                                <c:when test="${display == 'view'}">
                                    <ul class="displayDetails">
                                        <li>
                                            <span class="heading">Hero Name</span>
                                            <br>
                                            <span class="information">
                                                <c:out value="${hero.name}"></c:out>
                                                </span>
                                            </li>
                                            <li>
                                                <span class="heading">Description</span>
                                                <br>
                                                <span class="information">
                                                <c:out value="${hero.description}"></c:out>
                                                </span>
                                            </li>
                                            <li>
                                                <span class="heading">Super Powers</span>
                                                <br>
                                                <span class="information">
                                                <c:out value="Regeneration"></c:out>
                                                </span>
                                            </li>
                                            <li>
                                                <span class="heading">Organizations</span>
                                                <br>
                                                <span class="information">
                                                <c:out value="Akatsuki"></c:out>
                                                </span>
                                            </li>

                                        </ul>


                                </c:when>

                                <c:otherwise>
                                    <form action="createHero" class="displayForm" method="POST">

                                        <label for="heroName">Name: </label>
                                        <br>
                                        <input class="formInput" type="text" value="${hero.name}" id="name" name="heroName" placeholder="Enter hero name" />

                                        <label for="description">Description: </label>
                                        <br>
                                        <input class="formInput" type="text" value="${hero.description}" id="description" name="description" placeholder="Enter description"
                                               />

                                        <label for="organizations">Organizations: </label>
                                        <div id="organizationsDisplay">
                                            <div class="row">
                                                <div class="col-md-12" id="myOrganizations">
                                                </div>
                                                <div class="col-md-12 text-center">
                                                    <a href="#" data-toggle="modal" data-target=".bd-example-modal-lg">
                                                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add an Organization</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-md">

                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabel">All Organization</h4>    
                                                    </div>
                                                    <div class="modal-body" id="organizationChoice">

                                                        <!--Code here to display all organizations-->


                                                            <c:forEach var="i" begin="1" end="${organizations.size()-1}">

                                                                <label>
                                                                    <input type="checkbox" class="organizationSelection" name="organizations" data-pill="organizations" data-name="${organizations[i].organizationName} " value="${organizations[i].organizationId}">
                                                                    
                                                                    <c:out value="${organizations[i].organizationName}"></c:out>
                                                                    
                                                                </label><br>

                                                                

                                                            </c:forEach>


                                                        <!--Code here to display all organizations-->
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="saveOrganizations">Save</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <label for="superPowers">Super Powers: </label>
                                        <div id="superPowerDisplay">
                                            <div class="row">
                                                <div class="col-md-12" id="mySuperPowers">
                                                </div>
                                                <div class="col-md-12 text-center">
                                                    <a href="#" data-toggle="modal" data-target=".superPowerModal">
                                                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add a Super Power</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal fade superPowerModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-md">

                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabel2">All Super Powers</h4>
                                                    </div>
                                                    <div class="modal-body" id="superPowerChoice">
                                                        
                                                        <c:forEach var="i" begin="1" end="${powers.size()-1}">

                                                                <label>
                                                                    <input type="checkbox" class="superPowerSelection" name="powers" data-pillType = "superPowers" data-name="${powers[i].powerType} " value="${powers[i].powerId}">
                                                                    
                                                                    <c:out value="${powers[i].powerType}"></c:out>
                                                                    
                                                                </label><br>

                                                                

                                                            </c:forEach>
                                                        
                                                        
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="savePowers">Save</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <button class="btn btn-primary" id="newHero"> Submit Hero </button>
                                    </form>
                                </c:otherwise>
                            </c:choose>







                        </div>





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