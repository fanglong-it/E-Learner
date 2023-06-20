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
                <h1>All Request sended</h1>
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
                                    <th scope="col">Reason</th>
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
                                        ${c.reason}
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
