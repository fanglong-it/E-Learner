<!-- Navbar Start -->
<nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
    <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
    </a>
    <form class="d-none d-md-flex ms-4" action="ManagementProduct" method="get">
        <input class="form-control border-0" type="search" name="searchValue" value="${param.searchValue}" placeholder="Search">
    </form>
    <div class="navbar-nav align-items-center ms-auto">
        <div class="nav-item dropdown  ml-3">
            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                <img class="rounded-circle me-lg-2" src="img/${sessionScope.account.avatar}" alt="" style="width: 40px; height: 40px;">
                <span class="d-none d-lg-inline-flex">${sessionScope.account.fullname}</span>
            </a>
            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                <a href="#" class="dropdown-item">My Profile</a>
                <a href="#" class="dropdown-item">Settings</a>
                <a href="Logout" class="dropdown-item">Log Out</a>
            </div>
        </div>
    </div>
</nav>
<c:if test="${sessionScope.acc == null}">
    <c:redirect url="cilentPage"></c:redirect>
</c:if>

<!-- Navbar End -->