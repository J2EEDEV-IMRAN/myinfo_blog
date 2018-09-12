<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ata" uri="http://ataur.me/jstl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>

<!-- start banner Area -->
<section class="about-banner">
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
                <h1 class="text-white">
                    Services
                </h1>
                <p class="text-white link-nav"><a href="index.html">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a href="services.html"> Services</a></p>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->

<!-- Start services Area -->
<section class="services-area section-gap">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content  col-lg-12">
                <div class="title text-center">
                    <h1 class="mb-10">My Offered Services</h1>
                    <p>I have worked in every stages of Software Develpment Life Cycle(SDLC). But i am specialized in these following field.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4">
                <div class="single-services">
                    <span class="lnr lnr-rocket"></span>
                    <a href="#"><h4>Architecture Planning</h4></a>
                    <p>
                        “Java is an Object oriented Programming(OOP) language and one of its popular framework is Hibernate. Knowledge of hibernate provide good understanding of relationship between classes and is enough to design small application But to design complex & large application one must have the knowledge of REST(Rrepresentional State Transfer), Because while designing a large & complex application an architech must have to take certain decision and to take those decision architect must have the knowledge of architecture style. REST is an architecture style and I've already participate all these kind of task.”
                    </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="single-services">
                    <span class="lnr lnr-pie-chart"></span>
                    <a href="#"><h4>Web Design</h4></a>
                    <p>
                        “To be a full stack developer someone should have well understanding of HTML,CSS,BootStrap,JavaScript,jQuery,AngularJS etc. From University session I have been doing lot of work with these stuff like PSD to HTML convertion.Later I realised that I'am not for this kinds of work. As a java guy I think one java developer should not highly skilled in all these things but should have good understanding of how to implement freatures of these thing in general"
                    </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="single-services">
                    <span class="lnr lnr-laptop-phone"></span>
                    <a href="#"><h4>Web Development</h4></a>
                    <p>
                        "Web developemt is alway fun but when you are a java web developer the you are most proud, blessing and happiest one. Because technology is moving very fast and trend is converting into API & microservice related development so comply with the modern technology with  java is not that easy.To be a java developer one guy should have learn a lot of things. I have been working with java for last five years during this time I have solved many critical business logic and I am still a learner of java.As time goes, I am becoming as most skilled java web developer."
                    </p>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<!-- End services Area -->