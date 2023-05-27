<%-- 
    Document   : test
    Created on : May 25, 2022, 8:15:23 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <jsp:include page="components/header.jsp"></jsp:include>

        <body class="sb-sidenav-toggled">
        <%@include file="components/navBarComponent.jsp" %>
        <div class="container">
            <div id="layoutSidenav" class="mb-4">
                <div id="layoutSidenav_content">
                    <div class="container-fluid px-4 px-lg-5 mb-5" style="margin-top: 91px">
                        <h1>Subject List</h1>
                        <div class ="row mt-5">
                            <c:forEach var="s" items="${sessionScope.listSubjectsByPagging}">
                                <div class="col-md-4 mb-3 mx-auto d-block shadow p-3 mb-5 bg-white rounded" style="padding: 10px 0px 10px 10px; border-radius: 8px; width: 32%; margin-left: 10px">
                                    <form action="subject-detail" method="POST">
                                        <img class="mx-auto d-block" src="${s.getThumbnail()}" />
                                        <h2 class="text-center"> ${s.getSubjectName()} </h2>
                                        <ul style="margin-left: 8%">
                                            <li><b>${s.getTagLine()}</b></li>
                                            <li><b>${s.getTitle()}</b></li>
                                            <li><b>3200-10000</b></li>
                                        </ul>
                                        <div class="text-center">
                                            <a href="subject-detail?id=${s.getSubjectId()}" class="btn btn-primary"/>Detail</a>
                                        </div>

                                    </form>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
            <c:choose>
                <c:when test="${listSubjectsByPagging==null || listSubjectsByPagging.size()==0}">
                    Not founds
                </c:when>
                <c:when test="${totalPage < 2}">
                    <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </nav>
                </c:when>
                <c:when test="${page < 2}">
                    <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                        <ul class="pagination">                               
                            <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                </c:forEach>
                            <li class="page-item"><a class="page-link" href="${pagination_url}page=${page+1}">Next</a></li>
                        </ul>
                    </nav>
                </c:when>
                <c:when test="${page+1 > totalPage}">
                    <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="${pagination_url}page=${page-1}">Previous</a></li>
                                <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </nav>
                </c:when>
                <c:otherwise>
                    <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="${pagination_url}page=${page-1}">Previous</a></li>
                                <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                </c:forEach>
                            <li class="page-item"><a class="page-link" href="${pagination_url}page=${page+1}">Next</a></li>
                        </ul>
                    </nav>
                </c:otherwise>
            </c:choose>
        </div>

    </body>
    <jsp:include page="components/footer.jsp"></jsp:include>
</html>
