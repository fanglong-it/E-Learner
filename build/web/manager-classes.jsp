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
        <title>All Class</title>
    </head>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body id="page-top">
        <jsp:include page= "components/navBarComponent.jsp"></jsp:include>
            <div class="container">
                <h1>Manage Class</h1>
                <div class="row align-content-center">
                    <div class="">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">className</th>
                                    <th scope="col">maxStudent</th>
                                    <th scope="col">User</th>
                                    <th scope="col">dateCreate</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Course</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="c" items="${requestScope.classes}" varStatus="counter">     
                                <tr>
                                    <th scope="row">${counter.count}</th>
                                    <td>${c.className}</td>
                                    <td>${c.maxStudent}</td>
                                    <td>${c.image}</td>
                                    <td>${c.account.fullname}</td>
                                    <td>${c.dateCreate}</td>
                                    <td>${c.image}</td>
                                    <td>${c.status}</td>
                                    <td>${c.course.courseName}</td>
                                    <td>
                                        <a class="btn btn-primary" href="#">Edit Class</a>
                                        <a class="btn btn-warning" href="view-request?classId=${c.id}">View Request</a>
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
