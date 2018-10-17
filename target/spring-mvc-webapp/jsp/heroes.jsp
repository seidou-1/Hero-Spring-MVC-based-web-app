<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Heroes</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">

        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favi.png" type="image/x-icon" />

    </head>

    <body>
        <div class="container">
            <img style="width: 120px; margin: 5px 0;" src="${pageContext.request.contextPath}/img/hero_logo.svg">

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
                            <a class="active" href="${pageContext.request.contextPath}/viewHeroes?viewType=create">Heroes</a>
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
                <div class="col-md-6">

                    <div class="scrollable">

                        <table class="table displayTable text-center mytable">
                            <thead>
                                <tr>
                                    <th> Name </th>
                                    <th> Organization</th>
                                    <th> Last Sighting </th>
                                    <th class="table-name"> Heroes Archive</th>
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

                                            <c:choose>
                                                <c:when test="${empty heroes[i].mostRecentSightingDate}">
                                                    <c:out value="None"></c:out>
                                                </c:when>

                                                <c:otherwise>
                                                    <c:out value="${heroes[i].mostRecentSightingDate}"></c:out>
                                                </c:otherwise>

                                            </c:choose>

                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/viewHeroes?page=characters&viewType=edit&characterId=${heroes[i].characterId}">edit</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="col-md-6">
                    <div id="heroForm">

                        <div class="col-md-5" id="characterImg">


                            <c:choose>
                                <c:when test="${display == 'edit'}">
                                    <img src="${hero.photo}" alt="small" class="viewImage">
                                    <div class="myInstructions">
                                        <h4>
                                            <i class="fas fa-info-circle"></i> Instructions</h4>
                                        <ul>

                                            <li>
                                                <i class="fas fa-caret-right"></i>&nbsp;Enter new data then click update now to commit.</li>

                                            <li>
                                                <i class="fas fa-caret-right"></i>&nbsp;If the hero's organization is not available in
                                                the popup window, you can
                                                <a href="${pageContext.request.contextPath}/viewOrganizations">
                                                    click here </a> to add a new one.</li>
                                        </ul>
                                    </div>
                                </c:when>

                                <c:when test="${display == 'view'}">
                                    <img src="${hero.photo}" alt="small" class="viewImage">
                                    <br>
                                    <br>
                                    <br>
                                    <div>
                                        <table class=" table" id="viewTable">
                                            <tr>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/" class="btn btn-primary viewButtons"> Create Sighting</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/viewHeroes?page=characters&viewType=edit&characterId=${hero.characterId}" class="btn btn-success viewButtons">Edit Hero</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="" data-toggle="modal" data-target="#confirmDelete" class="btn btn-warning viewButtons"> Delete Hero</a>

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
                                                                    <h4>Are you sure you want to delete that
                                                                        hero?
                                                                    </h4>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <a href="" class="btn btn-primary" data-dismiss="modal">Cancel</a>
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


                                    <ul class="list">
                                        <li class="list__item">
                                            <input type="radio" class="radio-btn" name="choice" id="a-opt" checked="checked" />
                                            <label for="a-opt" class="label">Use default
                                                <picture></picture>
                                            </label>
                                        </li>
                                        <li class="list__item">
                                            <input type="radio" class="radio-btn" name="choice" id="b-opt" />
                                            <label for="b-opt" class="label">Upload picture </label>
                                        </li>
                                    </ul>

                                    <section id="mySection">

                                        <div id="myButton" hidden>
                                            <button class="btn selected" id="upload_widget_opener">Choose Image</button>
                                        </div>

                                        <div id="successfulAdd" hidden>
                                            <br>
                                            <i class="fas fa-check-double"></i>
                                            <span></span>
                                        </div>
                                    </section>





                                    <div class="myInstructions">
                                        <h4>
                                            <i class="fas fa-info-circle"></i> Instructions</h4>
                                        <ul>
                                            <li>
                                                <i class="fas fa-caret-right"></i>&nbsp;Add image (Optional)</li>
                                            <li>
                                                <i class="fas fa-caret-right"></i>&nbsp;Fill in the form with valid data then click submit
                                                hero.
                                            </li>
                                            <li>
                                                <i class="fas fa-caret-right"></i>&nbsp;If the hero's organization is not available in
                                                the popup window, you can
                                                <a href="${pageContext.request.contextPath}/viewOrganizations">
                                                    click here </a> to add a new one.</li>
                                        </ul>
                                    </div>
                                </c:otherwise>



                            </c:choose>





                        </div>



                        <script src="//widget.cloudinary.com/global/all.js" type="text/javascript"></script>



                        <div class="col-md-7" id="createHeroForm">
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
                                    <section id="viewDetails">
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
                                                    <c:out value="${hero.supPowerStr}"></c:out>
                                                    </span>
                                                </li>
                                                <li>
                                                    <span class="heading">Organizations</span>
                                                    <br>
                                                    <span class="information">
                                                    <c:out value="${hero.orgListStr}"></c:out>
                                                    </span>
                                                </li>

                                            </ul>
                                        </section>

                                        <section id="fans">
                                            <div>
                                                <i class="far fa-thumbs-up"></i>
                                                <br>
                                                <p>0 likes</p>
                                            </div>
                                            <div>
                                                <i class="far fa-thumbs-down"></i>
                                                <br>
                                                <p>0 dislikes</p>
                                            </div>
                                        </section>


                                </c:when>

                                <c:otherwise>


                                    <c:choose>
                                        <c:when test="${display == 'edit'}">
                                            <form action="editHero" class="displayForm" method="POST">
                                            </c:when>
                                            <c:otherwise>
                                                <form action="createHero" class="displayForm" method="POST">
                                                </c:otherwise>
                                            </c:choose>


                                            <label for="heroName">Name: </label>
                                            <br>
                                            <input class="formInput" type="text" value="${hero.name}" id="name" name="heroName" placeholder="Enter the hero's name" />

                                            <input type="text" name="userImage" id="uploadImage" value="https://res.cloudinary.com/jollystudios/image/upload/q_78/v1537823403/hero.jpg"
                                                   hidden>

                                            <label for="description">Description: </label>
                                            <br>
                                            <input class="formInput" type="text" value="${hero.description}" id="description" name="description" placeholder="Enter a description for the hero"
                                                   />

                                            <label for="organizations">Organizations: </label>
                                            <div id="organizationsDisplay">
                                                <div class="row">
                                                    <div class="col-md-12" id="myOrganizations">

                                                    </div>
                                                    <div class="col-md-12 text-center modalSelect">
                                                        <a href="#" data-toggle="modal" data-target=".organizationModal">
                                                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add an Organization</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal fade organizationModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-md">

                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            <h4 class="modal-title" id="myModalLabel">All Organization</h4>
                                                        </div>
                                                        <div class="modal-body" id="organizationChoice">

                                                            <!--Code here to display all organizations-->



                                                            <c:forEach var="i" begin="1" end="${organizations.size()-1}">

                                                                <label class="myLabel col-md-6 col-lg-6 col-sm-12">
                                                                    <input type="checkbox" class="organizationSelection" name="organizations" data-pill="organizations" data-name="${organizations[i].organizationName} "
                                                                           value="${organizations[i].organizationId}">

                                                                    <c:out value="${organizations[i].organizationName}"></c:out>
                                                                    </label>
                                                                    <br>
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
                                                    <div class="col-md-12 text-center modalSelect">
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

                                                                <label class="myLabel col-md-4 col-lg-4 col-sm-12">
                                                                    <input type="checkbox" class="superPowerSelection" name="superPowers" data-pillType="superPowers" data-name="${powers[i].powerType} "
                                                                           value="${powers[i].powerId}">
                                                                    <c:out value="${powers[i].powerType}"></c:out>
                                                                    </label>
                                                                    <br>



                                                            </c:forEach>


                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                            <button type="button" class="btn btn-primary" data-dismiss="modal" id="savePowers">Save</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="text-align: center">


                                                <c:choose>
                                                    <c:when test="${display == 'edit'}">
                                                        <button class="btn btn-warning" id="newHero">
                                                            <i class="fas fa-plus-circle"></i> Edit Hero </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <button class="btn btn-success" id="newHero">
                                                            <i class="fas fa-plus-circle"></i> Submit Hero </button>
                                                        </c:otherwise>
                                                    </c:choose>

                                            </div>
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
    <script src="${pageContext.request.contextPath}/js/script.js"></script>

    <script type="text/javascript">
        document.getElementById("upload_widget_opener").addEventListener("click", function () {
            cloudinary.openUploadWidget({cloud_name: 'jollystudios', upload_preset: 'riznjxyv'},
                    function (error, result) {
                        //  console.log(error, result)
                        setResults(result);
                    });
        }, false);
    </script>


</body>

</html>