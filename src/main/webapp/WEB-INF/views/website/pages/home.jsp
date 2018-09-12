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
<section class="banner-area">
    <div class="container">
        <div class="row fullscreen align-items-center justify-content-between banner-div">
            <div class="col-lg-6 col-md-6 banner-left">
                <h6>This is me</h6>
                <h3>IMRAN HOSSAIN</h3>
                <h4>
                    <time>Software Developer(Java & Spring)</time>
                </h4>
                <p>BASE Ltd.</p>
                <a href="${contextPath}/about.html" class="primary-btn text-uppercase">discover now</a>
                <br/><br/>
                <h6>About Me</h6>
                <h3 class="text-uppercase">Personal Details</h3>
                <p style="text-align: justify">
                    Hi, I'm Md.  Amran Hossain (My formal name is Md Amran Hossain but I alway like to introduce myself as Imran Hossain), I've completed B.Eng. in Computer Science & Telecommunication Engineering at the end of 2016. I'm a Web Developer, specialized in REST webservice, spring and hibernate since early 2013, I've cultivated my career as a professional web developer. I build clean, tempting and functional interfaces which comply with latest web standards.In my professional career as a programmer I've solved many critical business logic.I can assure about  quality & success of work. I always like to expose myself in different areas of science not only in computer science, so when somebody need not only a coder, but also someone who think logically/analytically, I'm your guy.
                </p>
                <a href="${contextPath}/about.html" class="primary-btn text-uppercase">View Full Details</a>


            </div>
            <div class="col-lg-6 col-md-6 banner-right d-flex align-self-end">
                <img class="img-fluid c-homeimage" WIDTH="383" HEIGHT="413" src="<c:url value="/resources/website/assets/img/IMRAN.jpg"/>" alt="IMRAN.jpg">
                <div class="footer-social d-flex align-items-center" style="padding-top: 40px;align-content: center;">
                    <a href="https://www.facebook.com/profile.php?id=100005065213335" target="_blank"><i class="fa fa-facebook"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="https://twitter.com/IMRANHO15468379" target="_blank"><i class="fa fa-twitter"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="https://github.com/Huntsman-Imran" target="_blank"><i class="fa fa-github"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="https://www.instagram.com/durbarimran24h/" target="_blank"><i class="fa fa-instagram"></i></a>
                </div>
            </div>


        </div>
    </div>
</section>
<!-- End banner Area -->

<!-- Start services Area -->
<section class="services-area section-gap">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content  col-md-12">
                <div class="title text-center">
                    <h1 class="mb-10">My Offered Services</h1>
                    <p>I have worked in every stages of Software Develpment Life Cycle(SDLC). But i am specialized in these following field. </p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4">
                <div class="single-services">
                    <span class="lnr lnr-rocket"></span>
                    <a href="${contextPath}/services.html"><h4>Architecture Planning</h4></a>
                    <p>
                        “Java is an Object oriented Programming(OOP) language and one of its popular framework is Hibernate. Knowledge of hibernate provide good understanding of relationship between classes and is enough to design small application But.....”
                    </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="single-services">
                    <span class="lnr lnr-pie-chart"></span>
                    <a href="${contextPath}/services.html"><h4>Web Design</h4></a>
                    <p>
                        “To be a full stack developer someone should have well understanding of HTML,CSS,BootStrap,JavaScript,jQuery,AngularJS etc. From University session I have been doing lot of work with these stuff like PSD to HTML convertion.Later I .....”
                    </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="single-services">
                    <span class="lnr lnr-laptop-phone"></span>
                    <a href="${contextPath}/services.html"><h4>Web Development</h4></a>
                    <p>
                        "Web developemt is alway fun but when you are a java web developer the you are most proud, blessing and happiest one. Because technology is moving very fast and trend is converting into API & microservice related development so comply....."
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End services Area -->

<!-- Start portfolio-area Area -->
<section class="portfolio-area section-gap" id="portfolio" style="padding-bottom: 50px;">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-70 col-md-12">
                <div class="title text-center">
                    <h1 class="mb-10">My Featured Projects</h1>
                    <p>Project for all those guy, who are extremely in love with JAVA & PHP.</p>
                </div>
            </div>
        </div>

        <div class="filters">
            <ul>
                <li class="active" data-filter="*">All</li>
                <li data-filter=".java">JAVA</li>
                <li data-filter=".php">PHP</li>
                <li data-filter=".ux">UI/UX</li>
            </ul>
        </div>
        <div class="filters-content">
            <div class="row grid">
                <c:forEach items="${portfolioList}" varStatus="loop" var="portfolio">
                <div class="single-portfolio col-sm-4 all ${portfolio.topic}">
                    <div class="relative">
                        <div class="thumb">
                            <div class="overlay overlay-bg"></div>
                            <img class="image img-fluid" src="${contextPath}/upload/${portfolio.portFolioImage}" alt="${portfolio.portFolioImage}">
                        </div>
                        <a href="<c:url value="${contextPath}/upload/${portfolio.portFolioImage}"/>" class="img-pop-up">

                            <div class="middle">
                                <div class="text align-self-center d-flex"><img <%--width="500px" height="200px;"--%> src="<c:url value="/resources/website/assets/img/preview.png"/>" alt=""></div>
                            </div>
                        </a>
                    </div>
                    <div class="p-inner">
                        <h4>${portfolio.title}</h4>
                        <div class="cat">${portfolio.about}</div>
                        <a href="http://${portfolio.link}" target="_blank" >${portfolio.link}</a>
                    </div>
                </div>
                </c:forEach>
           </div>
        </div>
    </div>
</section>
<!-- End portfolio-area Area -->

<!-- Start recent-blog Area -->
<section class="recent-blog-area section-gap">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 pb-30 header-text">
                <h1>Latest posts from my blog</h1>
                <p>
                    If you are a J2EE developer or interested in cricket then these post going to help & entertain you.
                </p>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${PostList}" varStatus="loop" var="post">
            <div class="single-recent-blog col-lg-4 col-md-4">
                <div class="thumb">
                    <img class="f-img img-fluid mx-auto c-size" src="<c:url  value="${contextPath}/upload/${post.postImage}"/>" alt="">
                </div>
                <div class="bottom d-flex justify-content-between align-items-center flex-wrap">
                    <div>
                        <img class="img-fluid" src="<c:url value="/resources/website/assets/img/usr.jpg"/>" alt="">
                        <a href="#"><span>Imran Hossain</span></a>
                    </div>
                    <div class="meta">
                        ${post.publishDate}
                            <div id="${post.id}">
                                <button class="lnr lnr-heart like-btn"></button> <span id="like_count-${post.id}">${post.love}</span>
                            </div>
                        <span class="lnr lnr-bubble"></span> ${post.postComment.size()}
                    </div>
                </div>
                <a href="#">
                    <h4>${ata:html2Text(post.postTitle)}</h4>
                </a>
                    ${fn:substring(ata:html2Text(post.post),0,200)}
                </p>
                <a href="blog-single-${post.id}.html" class="primary-btn">View More</a>
            </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- end recent-blog Area -->
