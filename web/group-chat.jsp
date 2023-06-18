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
        <title>Group Chat</title>
    </head>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body id="page-top">
        <jsp:include page= "components/navBarComponent.jsp"></jsp:include>
            <div class="container">
                <h1>Your Group Chat</h1>
                <div class="row">
                    <div class="col-sm-2">
                        
                        
                    </div>
                    <div class="col-sm-10"></div>
                </div>
                
                <div class="row align-content-center">
                    <div class="">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">groupChatName</th>
                                    <th scope="col">isPrivate</th>
                                    <th scope="col">Class</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="c" items="${requestScope.groupChats}" varStatus="counter">     
                                <tr>
                                    <th scope="row">${counter.count}</th>
                                    <td>${c.groupChatName}</td>
                                    <td>${c.isPrivate}</td>
                                    <td>${c.clas.className}</td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${sessionScope.account.role.role_name != 'STUDENT'}">
                                                <a class="btn btn-danger" href="#">Edit User</a>
                                                <a class="btn btn-primary" href="chat-content?groupChatId=${c.id}&rows=${requestScope.rows}">Join</a>
                                        
                                            </c:when>
                                            <c:otherwise>
                                                <a class="btn btn-primary" href="chat-content?groupChatId=${c.id}&rows=${requestScope.rows}">Join</a>
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                </tr>                             
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row justify-content-center">
                <c:choose>
                    <c:when test="${requestScope.messages.size() > 0}">
                        <div class="row border border-dark col-sm-8" style="max-height: 500px; overflow-y: scroll;">
                            <div class="row">
                                <a id="showMoreButton" href="chat-content?groupChatId=${requestScope.groupChatId}&rows=${requestScope.rows + 5}" class="text-center"><p class="font-monospace">Click to show more</p></a>
                            </div>
                            <div id="messagesContainer">
                                <c:forEach var="message" items="${messages}">
                                    <div class="message ${message.account.id eq sessionScope.account.id ? 'text-end' : 'text-start'} mb-3">
                                        <c:if test="${message.account.id eq sessionScope.account.id}">
                                            <img class="avatar me-2" width="50px" height="50px" src="images/${message.account.avatar}" alt="Avatar">
                                        </c:if>
                                        <div class="message-content bg-light rounded p-2 d-inline-block">
                                            <p class="mb-0">${message.content}</p>
                                            <small class="text-muted">${message.dateSended}</small>
                                        </div>
                                        <c:if test="${message.account.id ne sessionScope.account.id}">
                                            <img class="avatar ms-2" width="50px" height="50px" src="images/${message.account.avatar}" alt="Avatar">
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <form method="post" action="chat-content">
                                <div class="input-group">
                                    <input type="hidden" name="rows" value="${requestScope.rows}">
                                    <input type="hidden" name="groupChatId" value="${requestScope.groupChatId}">
                                    <input type="text" name="messageContent" class="form-control" placeholder="Type your message" required>
                                    <button type="submit" class="btn btn-primary">Send</button>
                                </div>
                            </form>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h3>View 1 Group!</h3>
                    </c:otherwise>
                </c:choose>
            </div>


        </div>

    </body>


    <jsp:include page="components/footer.jsp"></jsp:include>
</html>
