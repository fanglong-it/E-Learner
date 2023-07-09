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

                        <div class="card">
                            <div class="card-body">
                                <h3>Detail of ${requestScope.course.courseName}</h3>
                            <img src="images/${requestScope.course.image}" width="80%" height="50%" alt="alt">
                            <div class="row mb-3 mt-3">
                                <p class="text-justify">${requestScope.course.description}</p>                                     
                            </div>
                        </div>
                    </div>
                    <div class="card mt-3">
                        <div class="card-body">
                            <h3 class="">Teacher of this Course</h3>
                            <div class="row">
                                <div class="col-sm-6"><h3>${requestScope.course.account.username}</h3></div>
                                <div class="col-sm-6">
                                    <img width="50px" height="50px" src="images/${requestScope.course.account.avatar}" alt="..."/>
                                    <a class="btn btn-link" href="detail-teacher?accountId=${requestScope.course.account.id}">View Detail Teacher</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <c:if test="${requestScope.isOwner == 'false'}">
                                        <c:choose>
                                            <c:when test="${requestScope.isRegisterCourse == 'true'}">
                                                <div class="row">
                                                    <!--<h4>You Already Join This Course, Have fun!</h4>-->
                                                </div>
                                            </c:when>
                                            <c:otherwise>

                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                    Click to Enroll
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>

                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form style="width: 100%"  action="send-request" method="get">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Select The Class</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <input type="hidden" value="${requestScope.course.id}" name="courseId">
                                                            <select id="class" class="form-select" name="selectedClassId">
                                                                <c:forEach var="c" items="${requestScope.classes}">
                                                                    <option value="${c.id}">${c.account.fullname}-${c.className}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>                                                  
<!--                                                        <a href="send-request?courseId=${requestScope.course.id}" class="btn btn-primary">Send Request</a>-->
                                                        <button type="submit" class="btn btn-primary">Send Request</button> 
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>                                               
                                </div>
                            </div>                                       
                        </div>


                    </div>

                </div>
                <div class="col-sm-2">
                    <c:choose>
                        <c:when test="${requestScope.isOwner == 'true'}">
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
                        </c:otherwise>
                    </c:choose>

                </div>  
            </div>
            <p id="message" class="text-danger" style="display: none">${requestScope.MSG}</p>
            <c:if test="${requestScope.MSG != null && !empty requestScope.MSG}">
                <script>
                    window.onload = function () {
                        var message = document.getElementById("message").textContent;
                        if (message.trim() !== '') {
                            alert(message);
                        }
                    };
                </script>
            </c:if>
        </div>

    </div>
</body>
<jsp:include page="components/footer.jsp"></jsp:include>
</html>