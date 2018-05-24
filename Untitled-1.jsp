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
                                                <a href="${pageContext.request.contextPath}/" class="btn btn-info"> Create Sighting</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/" class="btn btn-info"> Edit Hero</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/" class="btn btn-info"> Delete Hero</a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </c:when>
                            <c:otherwise>