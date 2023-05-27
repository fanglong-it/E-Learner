<%-- 
    Document   : Home
    Created on : May 23, 2022, 10:15:28 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body id="page-top">
        <jsp:include page= "components/navBarComponent.jsp"></jsp:include>
            <div class="container">
                <div class="" style="margin-top: 10px"></div>

                <!-- Subjects-->

                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Subjects</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>

                <div class="row row-cols-1 row-cols-md-3 g-4"">
                <c:forEach items="${listSubjects}" var="S">
                    <!--                            <div class="col-lg-4 col-sm-6 mb-4">
                                                     Portfolio item 1
                                                    <div class="subjects-item">
                                                        <a class="subjects-link" data-bs-toggle="modal" href="#S${S.subjectId}">
                                                            <div class="subjects-hover">
                                                                <div class="subjects-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                                            </div>
                                                            <img class="img-fluid mx-auto d-block" src="${S.thumbnail}" alt="..." />
                                                        </a>
                                                        <div class="subjects-caption">
                                                            <div class="subjects-caption-heading">${S.subjectName}</div>
                                                        </div>
                                                    </div>
                                                </div>-->

                    <div class="col">
                        <div class="card">
                            <img src="${S.thumbnail}" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">${S.subjectName}</h5>
                                <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            </div>
                            <div class="card-footer">
                                <a class="subjects-link btn btn-primary" data-bs-toggle="modal" href="#S${S.subjectId}">View Detail</a>
                            </div>
                        </div>
                    </div>

                    <div class="subjects-modal modal fade" id="S${S.subjectId}" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="close-modal" data-bs-dismiss="modal"></div>
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-sm-12">
                                            <div class="modal-body">
                                                <!-- Project details-->
                                                <h2 class="text-uppercase">${S.subjectName}</h2>
                                                <img class="img-fluid d-block mx-auto" src="${S.thumbnail}" alt="..." />
                                                <p>${S.description}</p>
                                                <div class="row">




                                                    <div class="col-sm-6">
                                                        <button class="btn btn-danger btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                                            <i class="fas fa-xmark me-1"></i>
                                                            Close ${S.subjectName}
                                                        </button> 
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <a href="subject-detail?id=${S.getSubjectId()}" class="btn btn-success btn-xl text-uppercase">
                                                            Detail of ${S.subjectName}
                                                        </a> 
                                                    </div>

                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>


        </div>
    </body>


    <jsp:include page="components/footer.jsp"></jsp:include>
</html>
