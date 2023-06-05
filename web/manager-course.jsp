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
                <h1>Manage Course</h1>
                <div class="row align-content-center">
                    <div class="">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">courseName</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="c" items="${requestScope.courses}" varStatus="counter">     
                                <tr>
                                    <th scope="row">${counter.count}</th>
                                    <td>${c.courseName}</td>
                                    <td>${c.status}</td>
                                    <td>${c.image}</td>
                                    <td>${c.description}</td>
                                    <td>
                                        <a class="btn btn-primary" href="manager-lesson?courseId=${c.id}">Edit Lesson</a>
                                        <a class="btn btn-success" href="manager-class?courseId=${c.id}">Edit Class</a>
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
