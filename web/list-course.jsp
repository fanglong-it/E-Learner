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
            <div class="">

                <div class="container">
                    <div class="row mb-3 mt-3 card rounded-3">
                        <div class="card-body">
                            <div class="text-center mt-3 mb-3">
                                <form class="form-group" method="get" action="list-course">
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
                                            <button class="btn btn-primary animated" type="submit">Search</button>
                                        </div>
                                        <div class="col-sm-12 mt-4">
                                            <button class="btn btn-secondary animated" type="reset">Reset</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                        <h6 class="section-title bg-white text-center text-primary px-3">Courses</h6>
                        <h1 class="mb-5">Popular Courses</h1>
                    </div>
                    <div class="row g-4 justify-content-center">
                        <c:forEach items="${courses}" var="S" begin="0">
                            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="course-item bg-light">
                                    <div class="position-relative overflow-hidden">
                                        <img class="img-fluid" src="images/${S.image}" alt="">
                                        <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                            <a data-bs-toggle="modal" href="#S${S.id}" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                            <a href="course-detail?courseId=${S.id}" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                        </div>
                                    </div>
                                    <div class="text-center p-4 pb-0">
                                        <h5 class="mb-4">${S.courseName}</h5>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i>${S.account.fullname}</small>
                                    </div>
                                </div>
                            </div>
                            <div class="subjects-modal modal fade" id="S${S.id}" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
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

                                                        <!--                                                        <div class="row mb-3 mt-3 form-group">
                                                                                                                    <label class="font-weight-bold">Teacher Of This Course</label>
                                                                                                                    <img class="img-fluid d-block mx-auto" src="images/${S.account.avatar}" alt="..." />
                                                                                                                    <p>${S.account.username}</p>
                                                                                                                </div>-->

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
            </div>
        </div>
    </body>
    <jsp:include page="components/footer.jsp"></jsp:include>
</html>
