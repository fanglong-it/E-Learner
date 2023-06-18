<%-- 
    Document   : changePassword
    Created on : Jun 12, 2023, 9:42:51 PM
    Author     : DW
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <h3>Change password for ${sessionScope.account.fullname}</h3>
            <form class="form-group" action="change-password" method="post">
                <div class="form-group">
                    <label class="form-label">Current Password</label>
                    <input class="form-control" type="password" name="currentPassword" value="${param.currentPassword}">
                    <c:if test="${requestScope.PasswordValidator.password != null}">
                        <span class="text-danger">${requestScope.PasswordValidator.password}</span>
                    </c:if>
                </div>
                <div class="form-group">
                    <label class="form-label">New-Password</label>
                    <input class="form-control" type="password" name="newPassword" value="${param.newPassword}">
                    <c:if test="${requestScope.PasswordValidator.newPassword != null}">
                        <span class="text-danger">${requestScope.PasswordValidator.newPassword}</span>
                    </c:if>
                    <br>
                    <c:if test="${requestScope.PasswordValidator.rePassword != null}">
                        <span class="text-danger">${requestScope.PasswordValidator.rePassword}</span>
                    </c:if>
                </div>
                <div class="form-group">
                    <label class="form-label">Re Type: New-Password</label>
                    <input class="form-control" type="password" name="reNewPassword" value="${param.reNewPassword}">
                    <c:if test="${requestScope.PasswordValidator.rePassword != null}">
                        <span class="text-danger">${requestScope.PasswordValidator.rePassword}</span>
                    </c:if>
                </div>
                <div class="row">
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
            </form>
        </div>


    </body>
</html>
