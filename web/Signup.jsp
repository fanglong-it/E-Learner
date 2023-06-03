<%-- 
    Document   : Singin
    Created on : Jun 1, 2022, 9:29:14 AM
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
            <div class="limiter">
                <div class="text-center" style="background-image: url('images/bg-01.jpg');">
                    <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                        <form class="" action="Signup" method="post">

                            <span class="login100-form-title p-b-49" >
                                Sign Up
                            </span>
                            <div class="" data-validate = "Email is re-Quired">
                                <span class="label-input100">Email</span>
                                <input class="input100" type="email" name="email" placeholder="Type your email">
                                <span class="focus-input100" data-symbol="&#xf206;"></span>
                            </div>

                            <div class="wrap-input100 validate-input" data-validate="Password is required">
                                <span class="label-input100">Password</span>
                                <input class="input100" type="password" name="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="Type your password">
                                <span class="focus-input100" data-symbol="&#xf190;"></span>
                            </div>
                            <div class="wrap-input100 validate-input" data-validate="RePassword is required">
                                <span class="label-input100">Re - Password</span>
                                <input class="input100" type="rePassword" name="repass" placeholder="Type your Re-Rassword">
                                <span class="focus-input100" data-symbol="&#xf190;"></span>
                            </div>



                            <br> 
                            <div class="container-login100-form-btn">
                                <div class="wrap-login100-form-btn">
                                    <div class="login100-form-bgbtn"></div>
                                    <button class="login100-form-btn">
                                        Sign Up
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>





        <script>
            var myInput = document.getElementById("psw");
            var letter = document.getElementById("letter");
            var capital = document.getElementById("capital");
            var number = document.getElementById("number");
            var length = document.getElementById("length");

            // When the user clicks on the password field, show the message box
            myInput.onfocus = function () {
                document.getElementById("message").style.display = "block";
            }

            // When the user clicks outside of the password field, hide the message box
            myInput.onblur = function () {
                document.getElementById("message").style.display = "none";
            }

            // When the user starts to type something inside the password field
            myInput.onkeyup = function () {
                // Validate lowercase letters
                var lowerCaseLetters = /[a-z]/g;
                if (myInput.value.match(lowerCaseLetters)) {
                    letter.classList.remove("invalid");
                    letter.classList.add("valid");
                } else {
                    letter.classList.remove("valid");
                    letter.classList.add("invalid");
                }

                // Validate capital letters
                var upperCaseLetters = /[A-Z]/g;
                if (myInput.value.match(upperCaseLetters)) {
                    capital.classList.remove("invalid");
                    capital.classList.add("valid");
                } else {
                    capital.classList.remove("valid");
                    capital.classList.add("invalid");
                }

                // Validate numbers
                var numbers = /[0-9]/g;
                if (myInput.value.match(numbers)) {
                    number.classList.remove("invalid");
                    number.classList.add("valid");
                } else {
                    number.classList.remove("valid");
                    number.classList.add("invalid");
                }

                // Validate length
                if (myInput.value.length >= 6) {
                    length.classList.remove("invalid");
                    length.classList.add("valid");
                } else {
                    length.classList.remove("valid");
                    length.classList.add("invalid");
                }
            }

        </script>

    </body>


</html>