

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <img src="https://daihoc.fpt.edu.vn/wp-content/uploads/2023/04/cropped-cropped-2021-FPTU-Long.png" width="100px" height="50px" alt="alt"/>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li></li>
                <li class="nav-item me-5">
                    <a class="nav-link active mt-2 font-weight-bold" style="padding-left: 30px" aria-current="page" href="HomeController">HOME</a>
                </li>
                <li class="nav-item me-5">
                    <a class="nav-link text-dark mt-2" href="list-course?courseName="><span class="font-weight-bold">Course</span></a>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.account != null}">
                        <c:if test="${sessionScope.account.role.role_name == 'TEACHER'}">
                            <a class="nav-link text-dark mt-2" href="#">Manage Lesson</a>
                        </c:if>
                    </c:when>
                </c:choose>
                <li class="nav-item me-5">
                    <a class="nav-link text-dark mt-2" href="#"></a>
                </li>
            </ul>

        </div>
        <!--        <form class="d-flex" action="SearchUrl" method="POST" >
                    <div class="input-group">
                        <input type="search" name="keyword" id="form1" class="form-control" placeholder="Search"/>
                        <label class="form-label" for="form1">Search</label>
                        <button type="submit" class="btn btn-primary">Search
        
                        </button>
                    </div>
                </form>-->
        <!-- Avatar -->
        <div class="d-flex" style="margin-left: 10px">
            <c:choose>
                <c:when test="${sessionScope.account != null}">

                    <div class="dropdown">
                        <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            ${sessionScope.account.username}
                            <img width="50px" height="50px" src="images/${sessionScope.account.avatar}" alt="alt"/>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="profile">Information</a></li>
                            <li><a class="dropdown-item" href="#">History</a></li>
                            <li><a class="dropdown-item bg-danger" href="Logout">Logout</a></li>
                        </ul>
                    </div>

                </c:when>
                <c:otherwise>
                    <a class="btn btn-warning" href="Login">Login</a>
                </c:otherwise>       
            </c:choose>  
        </div>
        <div class="d-flex">
            <c:choose>
                <c:when test="${sessionScope.account != null}">

                </c:when>     
            </c:choose>  

        </div>
    </div>


</nav>



