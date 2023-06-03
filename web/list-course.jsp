<%-- 
    Document   : Home
    Created on : May 23, 2022, 10:15:28 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>All Course</title>
    </head>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body id="page-top">
        <jsp:include page= "components/navBarComponent.jsp"></jsp:include>
            <div class="container">

                <div class="row mb-3 mt-3 card">
                    <div class="text-center mt-3 mb-3">
                        <form style="" class="card-body" method="get" action="list-course">


                            <div class="row">
                                <div class="col-8">
                                    <div class="col-sm-12">
                                        <label for="courseName" style="float: left" class="font-weight-bold">Input Course Name</label>
                                        <input id="courseName" class="form-control" type="text" name="courseName" value="${param.courseName}" />
                                </div>
                                <div class="col-sm-12">
                                    <label for="courseName" style="float: left" class="font-weight-bold">Input Teacher</label>
                                    <input id="courseName" class="form-control" type="text" name="teacherName" value="" />
                                </div>

                            </div>
                            <div class="col-4">
                                <div class="col-sm-12 mb-3 mt-4">
                                    <button class="btn btn-primary form-control" type="submit">Search</button>
                                </div>
                                <div class="col-sm-12 mt-4">
                                    <button class="btn btn-secondary form-control" type="reset">Reset</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <h3>Course Is Waiting for you!</h3>
            </div>
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <c:forEach items="${courses}" var="S">
                    <div class="col">
                        <div class="card">
                            <img src="images/${S.image}" width="200px" height="200px" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">${S.courseName}</h5>
                                <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            </div>
                            <div class="card-footer">
                                <a class="subjects-link btn btn-primary" data-bs-toggle="modal" href="#S${S.id}">View Detail</a>
                            </div>
                        </div>
                    </div>
                    <div class="subjects-modal modal fade" id="S${S.id}" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="close-modal" data-bs-dismiss="modal"></div>
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-sm-12">
                                            <div class="modal-body">
                                                <!-- Project details-->
                                                <h2 class="text-uppercase">${S.courseName}</h2>
                                                <img class="img-fluid d-block mx-auto" src="images/${S.image}" alt="..." />
                                                <p>${S.description}</p>

                                                <div class="row mb-3 mt-3 form-group">
                                                    <label class="font-weight-bold">Teacher Of This Course</label>
                                                    <img class="img-fluid d-block mx-auto" src="images/${S.account.avatar}" alt="..." />
                                                    <p>${S.account.username}</p>
                                                </div>

                                                <div class="row text-center">
                                                    <div class="col-sm-6">
                                                        <button class="btn btn-danger btn-xl text-uppercase form-control" data-bs-dismiss="modal" type="button">
                                                            <i class="fas fa-xmark me-1"></i>
                                                            Close
                                                        </button> 
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <a href="course-detail?courseId=${S.id}" class="form-control btn btn-success btn-xl text-uppercase">
                                                            Detail
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
