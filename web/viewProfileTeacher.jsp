<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="fu.swp.model.Account" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="css/profile.css" rel="stylesheet" type="text/css"/>
        <title>Profile Teacher</title>
        <style>

            .ratings{
                margin-right:10px;
            }

            .ratings i{

                color:#cecece;
                font-size:32px;
            }

            .rating-color{
                color:#fbc634 !important;
            }

            .review-count{
                font-weight:400;
                margin-bottom:2px;
                font-size:24px !important;
            }

            .small-ratings i{
                color:#cecece;
            }

            .review-stat{
                font-weight:300;
                font-size:18px;
                margin-bottom:2px;
            }

            .dots{

                height: 4px;
                width: 4px;
                margin-bottom: 2px;
                background-color: #bbb;
                border-radius: 50%;
                display: inline-block;
            }

            .badge{

                padding: 7px;
                padding-right: 9px;
                padding-left: 16px;
                box-shadow: 5px 6px 6px 2px #e9ecef;
            }

            .user-img{

                margin-top: 4px;
            }

            .check-icon{

                font-size: 17px;
                color: #c3bfbf;
                top: 1px;
                position: relative;
                margin-left: 3px;
            }

            .form-check-input{
                margin-top: 6px;
                margin-left: -24px !important;
                cursor: pointer;
            }


            .form-check-input:focus{
                box-shadow: none;
            }


            .icons i{

                margin-left: 8px;
            }
            .reply{

                margin-left: 12px;
            }

            .reply small{

                color: #b7b4b4;

            }


            .reply small:hover{

                color: green;
                cursor: pointer;

            }
        </style>
    </head>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body>
        <jsp:include page="components/navBarComponent.jsp"></jsp:include>

            <div id="container">
                <div class="col-sm-8 justify-content-center">
                    <div class="row">
                        <div class="col-sm-8">
                            <h3>View Teacher Profile</h3>
                            <form action="profile" class="form-control m-1" method="POST" onsubmit="" enctype="multipart/form-data">

                            <c:if test="${isNoti != null}">
                                <span>Profile has been changed successfully!</span>
                            </c:if>
                            <div class="col-sm-12">
                                <label for="fullname" class="font-weight-bold">Full name</label>
                                <input class="form-control" id="fullname" type="text"  name="fullname" value="${acc.fullname}" required/>
                            </div>

                            <div class="col-sm-12">
                                <label for="fullname" class="font-weight-bold">Email</label>
                                <input class="form-control" type="text" name="email" value="${acc.email}" disabled="disabled"/>
                            </div>

                            <div class="col-sm-12">
                                <label for="fullname" class="font-weight-bold">Address</label>
                                <input class="form-control" type="text" name="address" value="${acc.address}" />
                            </div>


                        </form> 
                    </div>
                    <div class="col-sm-4">
                        <div id="avatar" class="">
                            <img id="img" src="img/${acc.avatar}" alt="Avatar" width="250" height="250">
                        </div>  
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="height-100 container d-flex justify-content-center align-items-center">

                            <div class="card p-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="ratings">
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <h5 class="review-count">12 Reviews</h5>
                                </div>


                                <div class="mt-5 d-flex justify-content-between align-items-center">
                                    <h5 class="review-stat">Cleanliness</h5>
                                    <div class="small-ratings">
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>

                                </div>

                                <div class="mt-1 d-flex justify-content-between align-items-center">
                                    <h5 class="review-stat">Approachability of SLT</h5>
                                    <div class="small-ratings">
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>


                                <div class="mt-1 d-flex justify-content-between align-items-center">
                                    <h5 class="review-stat">Front Office</h5>
                                    <div class="small-ratings">
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>


                                <div class="mt-1 d-flex justify-content-between align-items-center">
                                    <h5 class="review-stat">CPD</h5>
                                    <div class="small-ratings">
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                    </div>
                                </div>


                                <div class="mt-1 d-flex justify-content-between align-items-center">
                                    <h5 class="review-stat">Pastrol</h5>
                                    <div class="small-ratings">
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>

                                <div class="mt-1 d-flex justify-content-between align-items-center">
                                    <h5 class="review-stat">Office Space</h5>
                                    <div class="small-ratings">
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star rating-color"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="row  d-flex justify-content-center">
                        <div class="col-md-8">
                            <div class="headings d-flex justify-content-between align-items-center mb-3">
                                <h5>Unread comments(6)</h5>

                                <div class="buttons">

                                    <span class="badge bg-white d-flex flex-row align-items-center">
                                        <span class="text-primary">Comments "ON"</span>
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked>

                                        </div>
                                    </span>

                                </div>
                            </div>
                            <div class="card p-3">

                                <div class="d-flex justify-content-between align-items-center">

                                    <div class="user d-flex flex-row align-items-center">

                                        <img src="https://i.imgur.com/hczKIze.jpg" width="30" class="user-img rounded-circle mr-2">
                                        <span><small class="font-weight-bold text-primary">james_olesenn</small> <small class="font-weight-bold">Hmm, This poster looks cool</small></span>
                                    </div>
                                    <small>2 days ago</small>
                                </div>
                                <div class="action d-flex justify-content-between mt-2 align-items-center">
                                    <div class="reply px-4">
                                        <small>Remove</small>
                                        <span class="dots"></span>
                                        <small>Reply</small>
                                        <span class="dots"></span>
                                        <small>Translate</small>
                                    </div>
                                    <div class="icons align-items-center">
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-check-circle-o check-icon"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="card p-3 mt-2">

                                <div class="d-flex justify-content-between align-items-center">

                                    <div class="user d-flex flex-row align-items-center">

                                        <img src="https://i.imgur.com/C4egmYM.jpg" width="30" class="user-img rounded-circle mr-2">
                                        <span><small class="font-weight-bold text-primary">olan_sams</small> <small class="font-weight-bold">Loving your work and profile! </small></span>

                                    </div>


                                    <small>3 days ago</small>

                                </div>
                                <div class="action d-flex justify-content-between mt-2 align-items-center">

                                    <div class="reply px-4">
                                        <small>Remove</small>
                                        <span class="dots"></span>
                                        <small>Reply</small>
                                        <span class="dots"></span>
                                        <small>Translate</small>

                                    </div>

                                    <div class="icons align-items-center">
                                        <i class="fa fa-check-circle-o check-icon text-primary"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="card p-3 mt-2">

                                <div class="d-flex justify-content-between align-items-center">

                                    <div class="user d-flex flex-row align-items-center">

                                        <img src="https://i.imgur.com/0LKZQYM.jpg" width="30" class="user-img rounded-circle mr-2">
                                        <span><small class="font-weight-bold text-primary">rashida_jones</small> <small class="font-weight-bold">Really cool Which filter are you using? </small></span>

                                    </div>


                                    <small>3 days ago</small>

                                </div>


                                <div class="action d-flex justify-content-between mt-2 align-items-center">

                                    <div class="reply px-4">
                                        <small>Remove</small>
                                        <span class="dots"></span>
                                        <small>Reply</small>
                                        <span class="dots"></span>
                                        <small>Translate</small>

                                    </div>

                                    <div class="icons align-items-center">
                                        <i class="fa fa-user-plus text-muted"></i>
                                        <i class="fa fa-star-o text-muted"></i>
                                        <i class="fa fa-check-circle-o check-icon text-primary"></i>

                                    </div>

                                </div>



                            </div>






                            <div class="card p-3 mt-2">

                                <div class="d-flex justify-content-between align-items-center">

                                    <div class="user d-flex flex-row align-items-center">

                                        <img src="https://i.imgur.com/ZSkeqnd.jpg" width="30" class="user-img rounded-circle mr-2">
                                        <span><small class="font-weight-bold text-primary">simona_rnasi</small> <small class="font-weight-bold text-primary">@macky_lones</small> <small class="font-weight-bold text-primary">@rashida_jones</small> <small class="font-weight-bold">Thanks </small></span>

                                    </div>


                                    <small>3 days ago</small>

                                </div>


                                <div class="action d-flex justify-content-between mt-2 align-items-center">

                                    <div class="reply px-4">
                                        <small>Remove</small>
                                        <span class="dots"></span>
                                        <small>Reply</small>
                                        <span class="dots"></span>
                                        <small>Translate</small>

                                    </div>

                                    <div class="icons align-items-center">

                                        <i class="fa fa-check-circle-o check-icon text-primary"></i>

                                    </div>

                                </div>



                            </div>



                        </div>



                    </div>

                </div>
            </div>     
        </div>

    </body>
    <jsp:include page="components/footer.jsp"></jsp:include>
</html>