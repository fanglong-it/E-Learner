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
        <title>All Lesson</title>
    </head>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body id="page-top">
        <jsp:include page= "components/navBarComponent.jsp"></jsp:include>
            <div class="container">
                <h1>Manage Lesson</h1>
                <div class="row align-content-center">
                    <div class="">
                        <div class="col-sm-3">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Create Lesson
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="save-lesson" method="post">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="lessonName">Lesson Name</label>
                                                    <input type="text" class="form-control" value="" min="5" id="lessonName" name="lessonName">
                                                </div>
                                                <div class="form-group">
                                                    <label for="lessonName">Description</label>
                                                    <input type="text" class="form-control" value="" id="lessonName" name="description">
                                                </div>
                                                <div class="form-group">
                                                    <label for="lessonName">Video Url</label>
                                                    <input type="text" class="form-control" value="" id="lessonName" name="videoUrl">
                                                </div>
                                                <div class="form-group">
                                                    <label for="lessonName">CourseId</label>
                                                    <input readonly="" type="text" class="form-control" value="${param.courseId}" id="lessonName" name="courseId">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" name="action" value="create" class="btn btn-primary">Create</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Lesson Name</th>
                                <th scope="col">Status</th>
                                <th scope="col">Description</th>
                                <th scope="col">videoUrl</th>
                                <th scope="col">courseId</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="c" items="${requestScope.lessons}" varStatus="counter">     
                                <tr>
                                    <th scope="row">${counter.count}</th>
                                    <td>${c.lessonName}</td>
                                    <td>${c.status}</td>
                                    <td>${c.description}</td>
                                    <td>${c.videoUrl}</td>
                                    <td>${c.courseId}</td>
                                    <td>
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal${counter.count}">
                                            Create Lesson
                                        </button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModal${counter.count}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="save-lesson" method="post">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <label for="lessonName">Lesson Name</label>
                                                                <input type="text" class="form-control" value="${c.lessonName}" min="5" id="lessonName" name="lessonName">
                                                                <input type="hidden" class="form-control" value="${c.id}" min="5" id="lessonName" name="lessonId">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="lessonName">Description</label>
                                                                <input type="text" class="form-control" value="${c.description}" id="lessonName" name="description">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="lessonName">Video Url</label>
                                                                <input type="text" class="form-control" value="${c.videoUrl}" id="lessonName" name="videoUrl">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="lessonName">CourseId</label>
                                                                <input readonly="" type="text" class="form-control" value="${param.courseId}" id="lessonName" name="courseId">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" name="action" value="update" class="btn btn-success">Update</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>                             
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>

    </body>


    <jsp:include page="components/footer.jsp"></jsp:include>
</html>
