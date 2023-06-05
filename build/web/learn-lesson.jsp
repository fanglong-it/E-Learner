<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="fu.swp.model.Account" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="css/profile.css" rel="stylesheet" type="text/css"/>
        <title>Lesson Detail</title>

    </head>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body>
        <jsp:include page="components/navBarComponent.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="card-body">
                        <h1>Learn Lesson</h1>
                        <h3>${requestScope.lesson.lessonName}</h3>
                    <iframe width="1280px" height="720px" src="https://www.youtube.com/embed/${requestScope.lesson.videoUrl}" frameborder="0" allowfullscreen></iframe>
                    <p>Description: ${requestScope.lesson.description}</p>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-12">
                    <h3>Other Lesson</h3>
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <c:forEach var="l" items="${requestScope.lessons}">
                            <div class="col">
                                <div class="card">
                                    <div class="card-body">
                                        <a href=""><h5 class="card-title">${l.lessonName}</h5></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>

            </div>
        </div>
    </body>
    <jsp:include page="components/footer.jsp"></jsp:include>
</html>