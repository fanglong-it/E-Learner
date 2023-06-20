<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="fu.swp.model.Account" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="css/profile.css" rel="stylesheet" type="text/css"/>
        <title>Profile</title>
    </head>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body>
        <jsp:include page="components/navBarComponent.jsp"></jsp:include>

            <div id="container">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-4">
                                <div id="avatar" class="rounded">
                                    <img id="img" class="rounded-circle" src="images/${acc.avatar}" alt="Avatar" width="200" height="200">
                            </div>  
                        </div>

                        <div class="col-sm-8">
                            <form action="profile" class="form-control m-1 bg-white" method="POST" onsubmit="" enctype="multipart/form-data">
                                <h3>Your Profile</h3>
                                <c:if test="${isNoti != null}">
                                    <span>Profile has been changed successfully!</span>
                                </c:if>
                                <div class="col-sm-12">
                                    <label for="fullname" class="font-weight-bold">Full name</label>
                                    <input class="form-control" id="fullname" type="text"  name="fullname" value="${acc.fullname}" required/>
                                    <input class="form-control" id="fullname" type="hidden"  name="accountId" value="${acc.id}"/>

                                </div>
                                <div class="col-sm-12">
                                    <label for="fullname" class="font-weight-bold">Phone</label>
                                    <input class="form-control" type="tel" name="phone" value="${acc.phone}" required/>
                                </div>
                                <div class="col-sm-12">
                                    <label for="fullname" class="font-weight-bold">Email</label>
                                    <input class="form-control" type="text" name="email" value="${acc.email}" disabled="disabled"/>
                                </div>
                                <div class="col-sm-12">
                                    <a class="btn btn-danger animated mt-3" href="change-password">Change password</a>
                                </div>
                                <div class="col-sm-12 mt-3">
                                    <label for="fullname" class="font-weight-bold">Address</label>
                                    <input class="form-control" type="text" name="address" value="${acc.address}" />
                                </div>
                                <div class="col-sm-12 form-control mt-3">
                                    <label for="check" class="font-weight-bold">Is Update Photo</label>
                                    <input id="check" type="checkbox" class="form-check" name="isUpdatePhoto"/>

                                    <label for="photo" class="font-weight-bold">Select Photo</label>
                                    <input id="photo" class="form-control" type="file" name="photo" value=""/>
                                </div>    
                                <div class="row p-3"></div>
                                <div class="col-sm-12">
                                    <input class="btn btn-success text-start"  type="submit" value="Save" />
                                    <a class="btn btn-secondary text-end" href="HomeController">Cancle</a>
                                </div>
                            </form> 
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
    <jsp:include page="components/footer.jsp"></jsp:include>
</html>