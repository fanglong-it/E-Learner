<%-- 
    Document   : change-password
    Created on : Jun 15, 2022, 5:31:51 PM
    Author     : thuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link href="css/change-password.css" rel="stylesheet" type="text/css"/>
        <title>Change password</title>
    </head>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body>
        <jsp:include page="components/navBarComponent.jsp"></jsp:include>
            <div id="container">
                <div class="col-sm-8 justify-content-center">

                    <form action="ChangePassword" class="form-control" method="POST" onsubmit="">
                        <div id="table-header">
                            <span>Change password</span>
                        </div>
                        <div>
                            <table>   
                                <tr>
                                    <td>Current password</td>
                                    <td><input type="password" name="" value="" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  id="currentPassword"/></td>
                                </tr>
                                <tr><td colspan="2" id="error-current-password" class="error"></td></tr>

                                <tr>
                                    <td>New password</td>
                                    <td><input type="password" name="newPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  value="" id="password"/></td>
                                </tr>
                                <tr><td colspan="2" id="error-password" class="error"></td></tr>

                                <tr>
                                    <td>Confirm password</td>
                                    <td><input type="password" name="" value="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" id="re-password"/></td>
                                </tr>
                                <tr><td colspan="2" id="error-re-password" class="error"></td></tr>
                                <tr>
                                    <td colspan="2"><input id="submit-btn" type="submit" value="Save" /></td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
            </div>



        </body>
        <script>
            function submitForm() {
                var currentPassword = document.getElementById("currentPassword").value;
                var valuePassword = document.getElementById("password").value;
                var valueRePassword = document.getElementById("re-password").value;
                if (currentPassword != ${sessionScope.account.password}) {
                    document.getElementById("error-current-password").innerHTML = "Current password not same as old password";
                    return false;
                } else {
                    document.getElementById("error-current-password").innerHTML = "";
                }
                if (valuePassword.length < 6) {
                    document.getElementById("error-password").innerHTML = "Password must be greater than 6 characters";
                    return false;
                } else {
                    document.getElementById("error-password").innerHTML = "";
                }
                if (valueRePassword !== valuePassword) {
                    document.getElementById("error-re-password").innerHTML = "Confirm password not same as password";
                    return false;
                } else {
                    document.getElementById("error-password").innerHTML = "";
                }
                return true;
            }
    </script>
    <jsp:include page="components/footer.jsp"></jsp:include>
</html>
