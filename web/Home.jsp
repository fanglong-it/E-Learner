<%-- 
    Document   : Home
    Created on : May 23, 2022, 10:15:28 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        .our-team{
            overflow: hidden;
            border-radius: 50%;
            position: relative;
            box-shadow: 0 10px 40px -10px rgba(0,64,128,.2);
        }
        .our-team img{
            width: 100%;
            height: auto;
            position: relative;
            right: 0;
            -webkit-transition: all 0.4s ease-in-out 0s;
            transition: all 0.4s ease-in-out 0s;
        }
        .our-team:hover img{
            right: 60%;
        }
        .our-team .team-content{
            width: 80%;
            height: 100%;
            background: #fcfcfc;
            padding: 20% 30px 0;
            position: absolute;
            top: 0;
            right: -80%;
            -webkit-transition: all 0.4s ease-in-out 0s;
            transition: all 0.4s ease-in-out 0s;
        }
        .our-team:hover .team-content{
            right: 0;
        }
        .our-team .title {
            font-size: 22px;
            color: #554c86;
            margin: 0 0 5px 0;
            font-weight: 500;
        }
        .our-team .post {
            display: block;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            margin-bottom: 20px;
        }
        .our-team .description{
            font-size: 14px;
            color: #191b26;
        }
        .our-team .social{
            padding: 0;
            margin: 0;
            list-style: none;
        }
        .our-team .social li{
            display: inline-block;
            margin-right: 10px;
        }
        .our-team .social li:last-child{
            margin-right: 0;
        }
        .our-team .social li a {
            display: block;
            width: 36px;
            height: 36px;
            line-height: 36px;
            font-size: 14px;
            color: #fff;
            border-radius: 4px;
            text-align: center;
            -webkit-transition: all 0.3s ease-in-out 0s;
            transition: all 0.3s ease-in-out 0s;
            border: 1px solid #eee;
        }
        .our-team .social li a:hover{
            color: #fff;
        }
        .our-team .social li a.fa-facebook{
            background: #3b5a9b;
            border: 1px solid #3b5a9b;
        }
        .our-team .social li a.fa-twitter{
            background: #2baae1;
            border: 1px solid #2baae1;
        }
        .our-team .social li a.fa-youtube{
            background: #c3181e;
            border: 1px solid #c3181e;
        }
        @media only screen and (max-width: 990px){
            .our-team{
                margin-bottom: 50px;
            }
        }
        @media only screen and (max-width: 360px){
            .team-content{
                padding: 15% 15px 0;
            }
            .our-team .social li{
                margin-right: 0;
            }
        }
        a{
            text-decoration:none;
        }

        .section-title {
            margin-bottom: 60px;
        }
        .text-center {
            text-align: center!important;
        }

        .section-title h2 {
            font-size: 45px;
            font-weight: 600;
            margin-top: 0;
            position: relative;
            text-transform: capitalize;
        }
    </style>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body id="page-top">
        <jsp:include page= "components/navBarComponent.jsp"></jsp:include>
            <div class="container">
 
                <div class="row" style="margin-top: 10px">
                    <div class="col-sm-12">
                        <h1>We school</h1>
                        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            </div>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="	https://images2.thanhnien.vn/Uploaded/trinm/2023_01_04/fpthanoi01-130.jpg
                                         " class="d-block w-100" height="350px" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>First slide label</h5>
                                        <p>Some representative placeholder content for the first slide.</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="	https://covid19.qltns.mediacdn.vn/2021/1/31/dh-1612100077948503798298.jpg" class="d-block w-100" height="350px" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>Second slide label</h5>
                                        <p>Some representative placeholder content for the second slide.</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="	https://tostemvietnam.com/wp-content/uploads/2021/10/FPT-University-1.jpg" class="d-block w-100" height="350px" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>Third slide label</h5>
                                        <p>Some representative placeholder content for the third slide.</p>
                                    </div>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- Subjects-->
                <div class="text-center" style="margin-top: 10px">
                    <h2 class="section-heading text-uppercase">Most View Subject</h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>

                <div class="row row-cols-1 row-cols-md-3 g-4"">
                <c:forEach items="${listSubjects}" var="S" begin="0" end="2" step="1">
                    <div class="col">
                        <div class="card">
                            <img src="${S.thumbnail}" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">${S.subjectName}</h5>
                                <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            </div>
                            <div class="card-footer">
                                <a class="subjects-link btn btn-primary" data-bs-toggle="modal" href="#S${S.subjectId}">View Detail</a>
                            </div>
                        </div>
                    </div>
                    <div class="subjects-modal modal fade" id="S${S.subjectId}" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="close-modal" data-bs-dismiss="modal"></div>
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-sm-12">
                                            <div class="modal-body">
                                                <!-- Project details-->
                                                <h2 class="text-uppercase">${S.subjectName}</h2>
                                                <img class="img-fluid d-block mx-auto" src="${S.thumbnail}" alt="..." />
                                                <p>${S.description}</p>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <button class="btn btn-danger btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                                            <i class="fas fa-xmark me-1"></i>
                                                            Close ${S.subjectName}
                                                        </button> 
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <a href="subject-detail?id=${S.getSubjectId()}" class="btn btn-success btn-xl text-uppercase">
                                                            Detail of ${S.subjectName}
                                                        </a> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <div class="col-12">
                    <section id="team" class="team-area section-padding">    
                        <div class="container">
                            <div class="section-title text-center">
                                <h2>Our Created Team</h2>
                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
                            </div>				
                            <div class="row">
                                <div class="col-lg-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.2s" data-wow-offset="0" style="visibility: visible; animation-duration: 1s; animation-delay: 0.2s; animation-name: fadeInUp;">
                                    <div class="our-team">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                        <div class="team-content">
                                            <h3 class="title">Marina Mojo</h3>
                                            <span class="post">Developer</span>							
                                            <ul class="social">
                                                <li><a class="fa fa-facebook" href="#"></a></li>
                                                <li><a class="fa fa-twitter" href="#"></a></li>
                                                <li><a class="fa fa-youtube" href="#"></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div><!--- END COL -->
                                <div class="col-lg-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.3s" data-wow-offset="0" style="visibility: visible; animation-duration: 1s; animation-delay: 0.3s; animation-name: fadeInUp;">
                                    <div class="our-team">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="">
                                        <div class="team-content">
                                            <h3 class="title">Ayoub Fennouni</h3>
                                            <span class="post">Logo Expert</span>							
                                            <ul class="social">
                                                <li><a class="fa fa-facebook" href="#"></a></li>
                                                <li><a class="fa fa-twitter" href="#"></a></li>
                                                <li><a class="fa fa-youtube" href="#"></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div><!--- END COL -->
                                <div class="col-lg-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.4s" data-wow-offset="0" style="visibility: visible; animation-duration: 1s; animation-delay: 0.4s; animation-name: fadeInUp;">
                                    <div class="our-team">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="">
                                        <div class="team-content">
                                            <h3 class="title">Mark Linomi</h3>
                                            <span class="post">Marketer</span>							
                                            <ul class="social">
                                                <li><a class="fa fa-facebook" href="#"></a></li>
                                                <li><a class="fa fa-twitter" href="#"></a></li>
                                                <li><a class="fa fa-youtube" href="#"></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div><!--- END COL -->
                                <div class="col-lg-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.5s" data-wow-offset="0" style="visibility: visible; animation-duration: 1s; animation-delay: 0.5s; animation-name: fadeInUp;">
                                    <div class="our-team">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="">
                                        <div class="team-content">
                                            <h3 class="title">Amira Yerden</h3>
                                            <span class="post">UI/UX Designer</span>							
                                            <ul class="social">
                                                <li><a class="fa fa-facebook" href="#"></a></li>
                                                <li><a class="fa fa-twitter" href="#"></a></li>
                                                <li><a class="fa fa-youtube" href="#"></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div><!--- END COL -->
                            </div><!--- END ROW -->
                        </div><!--- END CONTAINER -->
                    </section>

                </div>

            </div>
        </div>
    </body>


    <jsp:include page="components/footer.jsp"></jsp:include>
</html>
