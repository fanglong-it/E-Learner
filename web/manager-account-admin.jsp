<%-- 
    Document   : manager-account-admin
    Created on : Jun 22, 2023, 5:15:47 PM
    Author     : DW
--%>
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
            <div class="position-relative bg-white d-flex p-0">
            <jsp:include page="components/admin/slidebar.jsp"></jsp:include>
                <!-- Content Start -->
                <div class="content">

                    <!-- Sale & Revenue Start -->
                    <div class="container pt-4 ">
                        <div class="row">
                            <h3>Manager Class</h3>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <a class="btn btn-primary">Create Account</a>
                                </div>
                                <div class="row align-content-center">
                                    <div class="">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">username</th>
                                                    <th scope="col">password</th>
                                                    <th scope="col">status</th>
                                                    <th scope="col">email</th>
                                                    <th scope="col">phone</th>
                                                    <th scope="col">fullname</th>
                                                    <th scope="col">address</th>
                                                    <th scope="col">avatar</th>
                                                    <th scope="col">role</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="c" items="${requestScope.accounts}" varStatus="counter">     
                                                <tr>
                                                    <th scope="row">${counter.count}</th>
                                                    <td>${c.username}</td>
                                                    <td>*******</td>
                                                    <td>${c.status}</td>
                                                    <td>${c.email}</td>
                                                    <td>${c.phone}</td>
                                                    <td>${c.fullname}</td>
                                                    <td>${c.address}</td>
                                                    <td>${c.avatar}</td>
                                                    <td>${c.role.role_name}</td>
                                                    <td>
                                                        <a class="btn btn-primary" href="#">Edit Account</a>
                                                        <a class="btn btn-danger" href="#">Delete</a>
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
                <!-- Sales Chart End -->

            </div>
        </div>
        <jsp:include page="components/admin/footer.jsp"></jsp:include>
    </body>
</html>