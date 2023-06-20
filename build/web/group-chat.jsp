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

                <div class="row">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-2 mb-3 mt-3">
                                    <div class="row">
                                    <c:forEach var="c" items="${requestScope.groupChats}" varStatus="counter">     
                                        <div class="form-group mt-3 mb-3 border bg-light">
                                            <div class="row">
                                                <div class="col-sm-8">
                                                    <a href="chat-content?groupChatId=${c.id}&rows=${requestScope.rows}" class="">
                                                        <b>${c.groupChatName}</b><br><span class="text-muted">Member : ${c.member}</span>
                                                    </a>
                                                </div>
                                                <div class="col-sm-4">
                                                    <button type="button" class="btn btn-primary rounded-1" data-bs-toggle="modal" data-bs-target="#exampleModal-${c.id}">
                                                        <i class="fas fa-user-friends"></i>
                                                    </button>
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="exampleModal-${c.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">List Member(s)</h5>
                                                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="row">
                                                                        <c:forEach var="mem" items="${c.accounts}">
                                                                            <div class="form-group mt-3 mb-3">
                                                                                <div class="row">
                                                                                    <div class="col-sm-6 text-end">
                                                                                        <label class="form-label font-weight-bold">${mem.fullname}</label>
                                                                                    </div>
                                                                                    <div class="col-sm-6">
                                                                                        <img src="images/${mem.avatar}" width="40px" height="40px" alt="alt"/>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </c:forEach>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-sm-10 border">
                                <div class="">
                                    <div class="row justify-content-center">
                                        <c:choose>
                                            <c:when test="${requestScope.messages.size() > 0}">
                                                <div class="row col-sm-12" style="max-height: 500px; overflow-y: scroll;">
                                                    <div class="row">
                                                        <a id="showMoreButton" href="chat-content?groupChatId=${requestScope.groupChatId}&rows=${requestScope.rows + 5}" class="text-center"><p class="font-monospace">Click to show more</p></a>
                                                    </div>
                                                    <div id="messagesContainer">
                                                        <c:forEach var="message" items="${messages}">
                                                            <div class="message ${message.account.id eq sessionScope.account.id ? 'text-end' : 'text-start'} mb-3">
                                                                <c:if test="${message.account.id eq sessionScope.account.id}">
                                                                    <img class="avatar me-2" width="50px" height="50px" src="images/${message.account.avatar}" alt="Avatar">
                                                                </c:if>
                                                                <div class="message-content rounded p-2 d-inline-block">
                                                                    <b class="font-weight-bold">${message.account.fullname}</b>
                                                                    <div class="form-group bg-light rounded-1">
                                                                        <p class="mb-0">${message.content}</p>
                                                                        <small class="text-muted">${message.dateSended}</small>
                                                                    </div>
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
                            </div>
                        </div>

                    </div>
                </div>


            </div>

        </div>

    </body>


    <jsp:include page="components/footer.jsp"></jsp:include>
</html>
