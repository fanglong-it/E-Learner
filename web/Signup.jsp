<%-- 
    Document   : Singin
    Created on : Jun 1, 2022, 9:29:14 AM
    Author     : thuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Sign Up</title>
        <style>
            :root{
                --main-bg:#e91e63;
            }

            .main-bg {
                background: var(--main-bg) !important;
            }

            input:focus, button:focus {
                border: 1px solid var(--main-bg) !important;
                box-shadow: none !important;
            }

            .form-check-input:checked {
                background-color: var(--main-bg) !important;
                border-color: var(--main-bg) !important;
            }

            .card, .btn, input{
                border-radius:0 !important;
            }
        </style>
    </head>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body>
        <jsp:include page="components/navBarComponent.jsp"></jsp:include>
            <div class="container">
                <div class="row justify-content-center mt-5">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="card shadow">
                            <div class="card-title text-center border-bottom">
                                <h2 class="p-3">Sign Up</h2>
                            </div>
                            <div class="card-body">
                                <form action="Signup" method="post">
                                    <div class="mb-4">
                                        <label for="username" class="form-label">Username/Email</label>
                                        <input type="email" required="" name="email" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}|[a-z0-9._%+-]+@[a-z0-9.-]+" id="username" />
                                        <span class="text-danger">${requestScope.SignUpValidator.emailError}</span>
                                </div>
                                <div class="mb-4">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" required="" name="password" class="form-control" id="password" />
                                    <span class="text-danger">${requestScope.SignUpValidator.passwordError}</span>
                                </div>
                                <div class="mb-4">
                                    <label for="password" class="form-label">Re-Password</label>
                                    <input type="password" required="" name="rePassword" class="form-control" id="password" />
                                    <span class="text-danger">${requestScope.SignUpValidator.passwordError}</span>
                                </div>
                                <div class="mb-4">
                                    <label for="password" class="form-label">FullName</label>
                                    <input type="text" required="" name="fullname" class="form-control" id="password" />
                                </div>
                                <div class="mb-4">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input type="tel" required="" name="phone" class="form-control" id="phone" />
                                    <span class="text-danger">${requestScope.SignUpValidator.phoneError}</span>

                                </div>
                                <div class="d-grid">
                                    <button type="submit" class="btn text-light main-bg"> Sign Up</button>
                                </div>
                                <div class="row">
                                    <c:if test="${requestScope.ERROR != null}">
                                        <p class="text-danger">${requestScope.ERROR}</p>
                                    </c:if>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

            </div>

        </div>

    </body>


</html>