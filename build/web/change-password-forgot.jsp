<%-- 
    Document   : change-password-forgot
    Created on : Jun 15, 2022, 5:31:38 PM
    Author     : thuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Forgot Pass</title>
    </head>

    <jsp:include page="components/header.jsp"></jsp:include>

        <body>

        <jsp:include page="components/navBarComponent.jsp"></jsp:include>

            <main class="login-form">
                <div class="cotainer">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">Forgot pas</div>
                                <div class="card-body">

                                <c:if test="${success != null}">
                                    <div class="forn-group row success">
                                        <div class="col-md-2"></div>
                                        <p class="col-md-10 margin-0">${success}</p>
                                    </div>
                                </c:if>
                                <c:if test="${requestScope.WARNING!= null}">
                                    <p style="color: red">${requestScope.WARNING}</p>
                                </c:if>

                                <form action="ChangePasswordForgot" method="POST">

                                    <input type="hidden" name="txtUserId" value="${requestScope.ACCOUNT.userid}" />
                                    <input type="hidden" name="txtToken" value="${requestScope.token}" />
                                    <div class="form-group row">
                                        <label for="new-password" class="col-md-4 col-form-label text-md-right">New password</label>
                                        <div class="col-md-6">
                                            <input type="password" id="password" class="form-control" name="new-password">
                                        </div>
                                    </div>

                                    <div class="form-group row margin-bottom-0"">
                                        <p class="col-md-6 offset-md-4 error" id="error-password" ></p>
                                    </div>

                                    <div class="form-group row">
                                        <label for="confirm-password" class="col-md-4 col-form-label text-md-right">Confirm password</label>
                                        <div class="col-md-6">
                                            <input type="password" id="re-password" class="form-control" name="confirm-password">
                                        </div>
                                    </div>

                                    <div class="form-group row margin-bottom-0">
                                        <p class="col-md-6 offset-md-4 error" id="error-re-password" ></p>
                                    </div>                                                            

                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                            Change
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </main>

</body>
</html>
