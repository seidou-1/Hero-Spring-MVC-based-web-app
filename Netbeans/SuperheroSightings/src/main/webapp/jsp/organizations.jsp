`
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
                                        <li role="presentation">
                                            <a href="${pageContext.request.contextPath}/viewHeroes?viewType=create">Heroes</a>
                                        </li>
                                        <li role="presentation">
                                            <a href="${pageContext.request.contextPath}/viewVillains?viewType=create">Villains</a>
                                        </li>
                                        <li role="presentation" class="active">
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
                                    <span class="font-size: 14px; padding: 10px 0; font-weight: bold;">Organizations Archive</span>
                                    <!-- </div>     -->


                                    <div class="scrollable">

                                        <table class="table displayTable text-center">
                                            <thead>
                                                <tr>
                                                    <th> Name </th>
                                                    <th> Disbanded</th>
                                                    <th> Description </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="i" begin="1" end="${organizations.size() - 1}">
                                                    <tr class='clickable-row' data-href="${pageContext.request.contextPath}/viewOrganizations?viewType=view&organizationId=${organizations[i].organizationId}">
                                                        <td> 
                                                            <c:out value="${organizations[i].organizationName}"></c:out>
                                                        </td>

                                                        <td>
                                                            <c:out value="No"></c:out>
                                                        </td>

                                                        <td>
                                                            <c:out value="${organizations[i].description}"></c:out>
                                                        </td>
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/viewOrganizations?viewType=edit&organizationId=${organizations[i].organizationId}">edit</a>
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
                                                    <img src="${pageContext.request.contextPath}/img/headquarters.jpg" alt="small" class="viewImage">
                                                    <hr>
                                                    <div>
                                                        <h4>Instructions</h4>
                                                        <ul>
                                                            <li>Enter new data then click Update now to commit.</li>
                                                            <li>If the organization's location is not available in the dropdown,
                                                                <a href="${pageContext.request.contextPath}/viewOrganizations?viewType=create"> click here </a> to add a new one.</li>
                                                        </ul>
                                                    </div>
                                                </c:when> 
                                                <c:when test="${display == 'view'}">
                                                    <img src="${pageContext.request.contextPath}/img/headquarters.jpg" alt="small" class="viewImage">
                                                    <hr>
                                                    <div>
                                                        <table class="table-condensed table">
                                                            <tr>
                                                                <td>
                                                                    <a href="${pageContext.request.contextPath}/createSighting" class="btn btn-danger viewButtons"> Create Sighting</a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <a href="${pageContext.request.contextPath}/viewOrganizations?viewType=edit&organizationId=${organization.organizationId}" class="btn btn-danger viewButtons">Edit Organization</a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <a href="" data-toggle="modal" data-target="#confirmDelete" class="btn btn-danger viewButtons"> Delete Organization</a>
                                                 
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
                                                                                   <h4>Are you sure you want to delete that organization?</h4>
                                                                                </div>
                                                                                <div class="modal-footer"> 
                                                                                    <a href="" class="btn btn-primary"  data-dismiss="modal">Cancel</a>
                                                                                    <a href="${pageContext.request.contextPath}/deleteOrganization?organizationId=${organization.organizationId}" class="btn btn-danger">Delete</a>
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

                                                    <img src="${pageContext.request.contextPath}/img/headquarters.jpg" alt="small" class="creatingImage">
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



                                        <div class="col-md-6" id="createOrganizationForm">
                                            <c:choose>
                                                <c:when test="${display == 'view'}">
                                                    <h4 class="formHead">View an organization</h4>
                                                </c:when>
                                                <c:when test="${display == 'edit'}">
                                                    <h4 class="formHead">Edit an organization</h4>
                                                </c:when>
                                                <c:otherwise>
                                                    <h4 class="formHead">Create an organization</h4>
                                                </c:otherwise>
                                            </c:choose>


                                            <c:choose>
                                                <c:when test="${display == 'view'}">
                                                    <ul class="displayDetails">
                                                        <li>
                                                            <span class="heading">Organization Name</span>
                                                            <br>
                                                            <span class="information">
                                                                <c:out value="${organization.organizationName}"></c:out>
                                                            </span>
                                                        </li>
                                                        <li>
                                                            <span class="heading">Description</span>
                                                            <br>
                                                            <span class="information">
                                                                <c:out value="${organization.description}"></c:out>
                                                            </span>
                                                        </li>
                                                        <li>
                                                            <span class="heading">Good or Evil</span>
                                                            <br>
                                                            <span class="information">
                                                                <c:out value="${organization.isGood}"></c:out>
                                                            </span>
                                                        </li>
                                                        <li>
                                                            <span class="heading">Contact Email</span>
                                                            <br>
                                                            <span class="information">
                                                                <c:out value="${organization.email}"></c:out>
                                                            </span>
                                                        </li>
                                                        <li>
                                                            <span class="heading">Contact Phone</span>
                                                            <br>
                                                            <span class="information">
                                                                <c:out value="${organization.phone}"></c:out>
                                                            </span>
                                                        </li>

                                                    </ul>


                                                </c:when>

                                                <c:otherwise> 
                                                    <form action="createOrganization" class="displayForm" method="POST">

                                                        <label for="organizationName">Name: </label>
                                                        <br>
                                                        <input class="formInput" type="text" value="${organization.organizationName}" id="organizationName" name="organizationName" placeholder="Enter Villain name" />

                                                        <label for="type">Good or Evil: </label>
                                                        <br>
                                                        <input class="formInput" type="text" value="Evil" id="type" name="type" placeholder="Are they good or evil"
                                                        />
                                                        
                                                        <label for="description">Description: </label>
                                                        <br>
                                                        <input class="formInput" type="text" value="${organization.description}" id="description" name="description" placeholder="Enter description"
                                                        />

                                                        <label for="organizationEmail">Contact Email: </label>
                                                        <br>
                                                        <input class="formInput" type="text" value="${organization.email}" id="organizationEmail" name="organizationEmail" placeholder="Enter a contact Email"
                                                        />

                                                        <label for="organizationPhone">Contact Phone: </label>
                                                        <br>
                                                        <input class="formInput" type="text" value="${organization.phone}" id="organizationPhone" name="organizationPhone" placeholder="Enter a contact phone number"
                                                        />

                                                        <label for="description">Location: </label>
                                                        <div id="organizationsDisplay">
                                                            <div class="row">
                                                                <div class="col-md-12" id="myOrganizations">
                                                                </div>
                                                                <div class="col-md-12 text-center">
                                                                    <a href="#" data-toggle="modal" data-target=".bd-example-modal-lg">
                                                                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add a Location</a>
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
                                                                    <div class="modal-body" id="organizationChoice"></div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="saveOrganizations">Save</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
 
                                                        <button class="btn btn-primary" id="newVillain"> Submit Organization </button>
                                                    </form>
                                                </c:otherwise>
                                            </c:choose>
                                        </div> </div>

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