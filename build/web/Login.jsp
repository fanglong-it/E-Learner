<%-- 
    Document   : Login
    Created on : May 26, 2022, 9:02:11 PM
    Author     : thuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
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
    <jsp:include page="components/header.jsp"></jsp:include>
        <body>
        <jsp:include page="components/navBarComponent.jsp"></jsp:include>
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="card shadow">
                        <div class="card-title text-center border-bottom">
                            <h2 class="p-3">Login</h2>
                        </div>
                        <div class="card-body">
                            <form action="Login" method="post">
                                <div class="mb-4">
                                    <label for="username" class="form-label">Username/Email</label>
                                    <input type="email" name="user" required="" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" id="username" />
                                </div>
                                <div class="mb-4">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" name="pass" class="form-control" id="password" />
                                </div>
                                <div class="mb-4">
                                    <input type="checkbox" name="remember" class="form-check-input" id="remember" />
                                    <label for="remember" class="form-label">Remember Me</label>
                                </div>
                                <div class="d-grid">
                                    <button type="submit" class="btn text-light main-bg">Login</button>
                                </div>
                                
                                <div class="text-center">
                                    <span>
                                        Or Sign Up Using
                                        <a href="Signup.jsp" class="">
                                            Sign Up
                                        </a>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:if test="${requestScope.ERROR}">
                        <p class="text-danger">${requestScope.ERROR}</p>
                    </c:if>
                </div>
            </div>
           
        </div>

    </body>
</html>