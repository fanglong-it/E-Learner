<%-- 
    Document   : CilentPage
    Created on : May 11, 2023, 1:01:06 AM
    Author     : toden
--%>


<%-- 
    Document   : CilentPage
    Created on : May 11, 2023, 1:01:06 AM
    Author     : toden
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Admin</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <jsp:include page="components/admin/head.jsp"></jsp:include>
        </head>
    <%@include file="components/admin/header.jsp" %>
    <body>
        <jsp:include page="components/admin/navbar.jsp"></jsp:include>
            <div class="position-relative bg-white d-flex">
            <jsp:include page="components/admin/slidebar.jsp"></jsp:include>
                <!-- Content Start -->
                <div class="content" style="width: 90%;">
                    <!-- Sale & Revenue Start -->
                    <div class="container px-3" style="">
                        <div class="row">
                            <h3>Manager Course</h3>
                        </div>
                        <div class="row">
                            <div class="card" style="">
                                <div class="card-body">
                                    <div class="row">
                                        <a class="btn btn-primary">Create Course</a>
                                    </div>
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
                                                            <a class="btn btn-success" href="manager-class?courseId=${c.id}">Manager Class</a>
                                                        </td>
                                                    </tr>                             
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sales Chart End -->

            </div>
        </div>
        <jsp:include page="components/admin/footer.jsp"></jsp:include>
    </body>

</html>