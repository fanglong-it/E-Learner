<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="fu.swp.model.Account" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="css/profile.css" rel="stylesheet" type="text/css"/>
        <title>Course Detail</title>
        <style>
            /* Additional CSS styles */
            .course-details {
                margin-top: 20px;
            }
            .lessons-list {
                margin-top: 20px;
            }
        </style>
    </head>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body>
        <jsp:include page="components/navBarComponent.jsp"></jsp:include>
            <div class="container">
                <div class="row mt-3 mb-3">
                    <div class="col-sm-10">
                        <div class="row">
                            <h3>${requestScope.course.courseName}</h3>
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <h3>Detail of This course</h3>
                                    <img src="images/${requestScope.course.image}" width="80%" height="50%" alt="alt">
                                    <div class="row">
                                        <p class="">${requestScope.course.description}</p>                                        
                                    </div>
                                </div>
                                <div class="card-body">
                                    <h3>Teacher of this Course</h3>
                                    <h3>${requestScope.course.account.username}</h3>
                                    <img src="images/${requestScope.course.account.avatar}" alt="..."/>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                Launch demo modal
                                            </button>

                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Select The Class</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <select id="class" name="selectedClass">
                                                                <option value="SE140071">SE140071</option>
                                                                <option value="SE140071">SE140071</option>
                                                                <option value="SE140071">SE140071</option>
                                                            </select>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="button" class="btn btn-primary">Send Request</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                               
                                        </div>
                                    </div>                                       
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-3">

                        </div>
                    </div>

                </div>
                <div class="col-sm-2">
                    <c:choose>
                        <c:when test="${requestScope.isRegisterCourse == 'true'}">



                            <h4>Lesson List</h4>
                            <ul class="list-group card-body">
                                <c:forEach var="l" items="${requestScope.lessons}">
                                    <li class="list-group-item">
                                        <a href="learn-lesson?lessonId=${l.id}">${l.lessonName}</a>
                                    </li>
                                </c:forEach>
                                <!-- Add more list items as needed -->
                            </ul>


                        </c:when>
                        <c:otherwise>
                            <div class="row">
                                <h4>Enroll to view Lesson !</h4>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>  
            </div>

        </div>

    </div>
</body>
<jsp:include page="components/footer.jsp"></jsp:include>
</html>