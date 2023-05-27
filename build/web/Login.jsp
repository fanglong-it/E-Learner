<%-- 
    Document   : Login
    Created on : May 26, 2022, 9:02:11 PM
    Author     : thuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="components/header.jsp"></jsp:include>
        <body>
        <jsp:include page="components/navBarComponent.jsp"></jsp:include>
        <div class="container">
            <form class="form-signin" action="Login" method="post">
                <div class="text-center">
                    <div class="" style="background-image: url('images/bg-01.jpg');">
                        <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                            <form class="login100-form validate-form">
                                <span class="login100-form-title p-b-49">
                                    Login
                                </span>

                                <div class="form-group wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
                                    <span for="username" class="label-input100">Username</span>
                                    <input id="username" class="input100" type="text" name="user" placeholder="Type your username">
                                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                                </div>

                                <div class="wrap-input100 validate-input" data-validate="Password is required">
                                    <span class="label-input100">Password</span>
                                    <input class="input100" type="password" name="pass" placeholder="Type your password">
                                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                                </div>
                                <input type="checkbox" name="remember"> Remember me
                                <div class="text-right p-t-8 p-b-31">
                                    <a href="#">
                                        Forgot password?
                                    </a>
                                </div>

                                <div class="container-login100-form-btn">
                                    <div class="wrap-login100-form-btn">
                                        <div class="login100-form-bgbtn"></div>
                                        <button class="login100-form-btn">
                                            Login
                                        </button>
                                    </div>
                                </div>

                                <div class="txt1 text-center p-t-54 p-b-20">
                                    <span>
                                        Or Sign Up Using
                                        <a href="Signup.jsp" class="txt2">
                                            Sign Up
                                        </a>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </form>

        </div>

    </body>
</html>