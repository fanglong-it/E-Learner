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
        <title>All Request</title>
    </head>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body id="page-top">
        <jsp:include page= "components/navBarComponent.jsp"></jsp:include>
            <div class="container">
                <h1>Manage Request</h1>
                <div class="row align-content-center">
                    <div class="">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">requestDate</th>
                                    <th scope="col">requestStatus</th>
                                    <th scope="col">class</th>
                                    <th scope="col">account</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="c" items="${requestScope.registrations}" varStatus="counter">     
                                <tr>
                                    <th scope="row">${counter.count}</th>
                                    <td>${c.requestDate}</td>
                                    <td>${c.requestStatus}</td>
                                    <td>${c.classId}</td>
                                    <td>${c.account.email}</td>
                                    <td>
                                        <img src="images/${c.account.avatar}" width="50px" height="50px" alt="alt"/>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${c.requestStatus == 'Approved'}">
                                                <a class="btn btn-danger" href="update-request?regisId=${c.id}&regisStatus=Pending">Remove</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="btn btn-success" href="update-request?regisId=${c.id}&regisStatus=Approved">Approve</a>
                                                <!-- Small modal -->
                                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${counter.count}">Reject</button>
                                                <div class="modal fade" id="exampleModal${counter.count}" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h3>Denied</h3>
                                                            </div>
                                                            <form action="update-request" method="get">
                                                                <div class="modal-body">
                                                                    <div class="form-group">
                                                                        <input type="text" readonly="" name="regisId" value="${c.id}" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <input type="text" readonly="" name="regisStatus" value="Denied" class="form-control">
                                                                    </div><!-- comment -->
                                                                    <div class="form-group">
                                                                        <label>Reason</label>
                                                                        <textarea id="id" class="form-control" name="reason" rows="5" cols="10"></textarea>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="submit" class="btn btn-danger">Reject</button>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
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
