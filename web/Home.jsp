<%-- 
    Document   : Home
    Created on : May 23, 2022, 10:15:28 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body id="page-top">
        <jsp:include page= "components/navBarComponent.jsp"></jsp:include>
            <div class="">
                <!-- Spinner Start -->
                <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>
                <!-- Spinner End -->

                <!-- Carousel Start -->
                <div class="container-fluid p-0 mb-5">
                    <div class="owl-carousel header-carousel position-relative">
                        <div class="owl-carousel-item position-relative">
                            <img class="img-fluid" src="img/carousel-1.jpg" alt="">
                            <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
                                <div class="container">
                                    <div class="row justify-content-start">
                                        <div class="col-sm-10 col-lg-8">
                                            <h5 class="text-primary text-uppercase mb-3 animated slideInDown">Best Courses</h5>
                                            <h1 class="display-3 text-white animated slideInDown">The Best Learning Platform</h1>
                                            <p class="fs-5 text-white mb-4 pb-2">Vero elitr justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd rebum ipsum et diam justo clita et kasd rebum sea sanctus eirmod elitr.</p>
                                            <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read More</a>
                                            <a href="" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Join Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="owl-carousel-item position-relative">
                            <img class="img-fluid" src="img/carousel-2.jpg" alt="">
                            <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
                                <div class="container">
                                    <div class="row justify-content-start">
                                        <div class="col-sm-10 col-lg-8">
                                            <h5 class="text-primary text-uppercase mb-3 animated slideInDown">Best Learning Courses</h5>
                                            <h1 class="display-3 text-white animated slideInDown">Get Educated Course From Your Home</h1>
                                            <p class="fs-5 text-white mb-4 pb-2">Vero elitr justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd rebum ipsum et diam justo clita et kasd rebum sea sanctus eirmod elitr.</p>
                                            <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read More</a>
                                            <a href="" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Join Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Carousel End -->

                <!-- Service Start -->
                <div class="container-xxl py-5">
                    <div class="container">
                        <div class="row g-4">
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="service-item text-center pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-graduation-cap text-primary mb-4"></i>
                                        <h5 class="mb-3">Skilled Instructors</h5>
                                        <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                                <div class="service-item text-center pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-globe text-primary mb-4"></i>
                                        <h5 class="mb-3">Our Classes</h5>
                                        <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                                <div class="service-item text-center pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-home text-primary mb-4"></i>
                                        <h5 class="mb-3">Home Projects</h5>
                                        <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                                <div class="service-item text-center pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-book-open text-primary mb-4"></i>
                                        <h5 class="mb-3">Book Library</h5>
                                        <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Service End -->
                <!-- About Start -->
                <div class="container-xxl py-5">
                    <div class="container">
                        <div class="row g-5">
                            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s" style="min-height: 400px;">
                                <div class="position-relative h-100">
                                    <img class="img-fluid position-absolute w-100 h-100" src="img/about.jpg" alt="" style="object-fit: cover;">
                                </div>
                            </div>
                            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
                                <h6 class="section-title bg-white text-start text-primary pe-3">About Us</h6>
                                <h1 class="mb-4">Welcome to Happy Learning</h1>
                                <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                                <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
                                <div class="row gy-2 gx-4 mb-4">
                                    <div class="col-sm-6">
                                        <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Skilled Instructors</p>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>International Certificate</p>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Skilled Instructors</p>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>International Certificate</p>
                                    </div>
                                </div>
                                <a class="btn btn-primary py-3 px-5 mt-2" href="">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- About End -->

                <!-- Courses Start -->
                <div class="container-xxl py-5">
                    <div class="container">
                        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                            <h6 class="section-title bg-white text-center text-primary px-3">Courses</h6>
                            <h1 class="mb-5">Popular Courses</h1>
                        </div>
                        <div class="row g-4 justify-content-center">
                        <c:forEach items="${listCourses}" var="S" begin="0" end="2" step="1">
                            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="course-item bg-light">
                                    <div class="position-relative overflow-hidden">
                                        <img class="img-fluid" src="images/${S.image}" alt="">
                                        <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                            <a href="about.jsp" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                            <a href="course-detail?courseId=${S.id}" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                        </div>
                                    </div>
                                    <div class="text-center p-4 pb-0">
                                        <h5 class="mb-4">${S.courseName}</h5>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i>${S.account.fullname}</small>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
            <!-- Courses End -->
            <!-- Team Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                        <h6 class="section-title bg-white text-center text-primary px-3">Instructors</h6>
                        <h1 class="mb-5">Expert Instructors</h1>
                    </div>
                    <div class="row g-4">
                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="team-item bg-light">
                                <div class="overflow-hidden">
                                    <img class="img-fluid" src="img/team-1.jpg" alt="">
                                </div>
                                <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                                    <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                        <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                        <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                        <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                                <div class="text-center p-4">
                                    <h5 class="mb-0">Instructor Name</h5>
                                    <small>Designation</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                            <div class="team-item bg-light">
                                <div class="overflow-hidden">
                                    <img class="img-fluid" src="img/team-2.jpg" alt="">
                                </div>
                                <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                                    <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                        <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                        <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                        <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                                <div class="text-center p-4">
                                    <h5 class="mb-0">Instructor Name</h5>
                                    <small>Designation</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                            <div class="team-item bg-light">
                                <div class="overflow-hidden">
                                    <img class="img-fluid" src="img/team-3.jpg" alt="">
                                </div>
                                <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                                    <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                        <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                        <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                        <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                                <div class="text-center p-4">
                                    <h5 class="mb-0">Instructor Name</h5>
                                    <small>Designation</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                            <div class="team-item bg-light">
                                <div class="overflow-hidden">
                                    <img class="img-fluid" src="img/team-4.jpg" alt="">
                                </div>
                                <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                                    <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                        <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                        <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                        <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                                <div class="text-center p-4">
                                    <h5 class="mb-0">Instructor Name</h5>
                                    <small>Designation</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Team End -->
            <!-- Testimonial Start -->
            <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
                <div class="container">
                    <div class="text-center">
                        <h6 class="section-title bg-white text-center text-primary px-3">Testimonial</h6>
                        <h1 class="mb-5">Our Students Say!</h1>
                    </div>
                    <div class="owl-carousel testimonial-carousel position-relative">
                        <div class="testimonial-item text-center">
                            <img class="border rounded-circle p-2 mx-auto mb-3" src="img/testimonial-1.jpg" style="width: 80px; height: 80px;">
                            <h5 class="mb-0">Client Name</h5>
                            <p>Profession</p>
                            <div class="testimonial-text bg-light text-center p-4">
                                <p class="mb-0">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                            </div>
                        </div>
                        <div class="testimonial-item text-center">
                            <img class="border rounded-circle p-2 mx-auto mb-3" src="img/testimonial-2.jpg" style="width: 80px; height: 80px;">
                            <h5 class="mb-0">Client Name</h5>
                            <p>Profession</p>
                            <div class="testimonial-text bg-light text-center p-4">
                                <p class="mb-0">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                            </div>
                        </div>
                        <div class="testimonial-item text-center">
                            <img class="border rounded-circle p-2 mx-auto mb-3" src="img/testimonial-3.jpg" style="width: 80px; height: 80px;">
                            <h5 class="mb-0">Client Name</h5>
                            <p>Profession</p>
                            <div class="testimonial-text bg-light text-center p-4">
                                <p class="mb-0">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                            </div>
                        </div>
                        <div class="testimonial-item text-center">
                            <img class="border rounded-circle p-2 mx-auto mb-3" src="img/testimonial-4.jpg" style="width: 80px; height: 80px;">
                            <h5 class="mb-0">Client Name</h5>
                            <p>Profession</p>
                            <div class="testimonial-text bg-light text-center p-4">
                                <p class="mb-0">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Testimonial End -->
        </div>
    </body>
    <p id="message" class="text-danger" style="display: none">${requestScope.MSG}</p>
    <c:if test="${requestScope.MSG != null && !empty requestScope.MSG}">
        <script>
            window.onload = function () {
                var message = document.getElementById("message").textContent;
                if (message.trim() !== '') {
                    alert(message);
                }
            };
        </script>
    </c:if>
    <jsp:include page="components/footer.jsp"></jsp:include>
</html>
