<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ata" uri="http://ataur.me/jstl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>

<!-- Start home-about Area -->
<section class="home-about-area section-gap">
    <div class="container">
        <div class="row align-items-center justify-content-between">
            <div class="col-lg-6 col-md-6 home-about-left">
                <img class="img-fluid" WIDTH="383" HEIGHT="413"  src="<c:url value="/resources/website/assets/img/java.jpg"/>" alt="">
            </div>
            <div class="col-lg-5 col-md-6 home-about-right">
                <h6>About Me</h6>
                <h1 class="text-uppercase">Personal Details</h1>
                <p style="text-align: justify;">
                    Hi, I'm Md.  Amran Hossain (My formal name is Md Amran Hossain but I alway like to introduce myself as Imran Hossain), I've completed B.Eng. in Computer Science & Telecommunication Engineering at the end of 2016.

                    I'm a Web Developer, specialized in REST webservice, spring and hibernate since early 2013, I've cultivated my career as a professional web developer. I build clean, tempting and functional interfaces which comply with latest web standards.In my professional career as a programmer I've solved many critical business logic.I can assure about  quality & success of work. I always like to expose myself in different areas of science not only in computer science, so when somebody need not only a coder, but also someone who think logically/analytically, I'm your guy.

                </p>
            </div>
            <div class="col-lg-12 pt-60">
                <h1 class="mb-10">Career Objective</h1>
                <p>
                    Scaling new heights of success and leaving a mark of excellence in assignments which involve
                    analytical capabilities and professional growth, preferably in Bangladesh.
                </p>
                <p>
                    To secure a position where I can efficiently contribute my skills and abilities for the growth of the organization and
                    build my professional career on web development specially on Java EE.
                </p>
                <p>
                    To face challenges using knowledge, perception, and innovation to pursue long-term successful career in dynamic
                    & professional environment of any leading organization.
                </p>
                <div class="col-md-6 col-sm-12">
                    <h2 class="mb-10">IT Skills</h2>
                    <p> Java EE Web Component APIs: Java EE, Servlets, JSP and JSF</p>
                    <p>Frameworks: Spring Cloud, Spring Boot, Spring mvc, Spring security, Spring webflow</p>
                    <p>Web Service: REST</p>
                    <p>ORM Framework: Hibernate 4</p>
                    <p>Business Components: DataJPA</p>
                    <p>Web Development: AngularJS, JavaScript, AJAX and jQuery, Twitter Bootstrap, BootsFaces</p>
                    <p>Testing: Junit, Mokito</p>
                    <p>Oracle Fusion Technologies: WebLogic 11g as database</p>
                    <p>Build Tool: Maven, Gradle</p>
                    <p>Application Servers: Apache Tomcat, XAMPP</p>
                    <p>IDE: Eclipse, Intellijae, NetBeans</p>
                    <p>Database: Oracle RDBMS, MySQL, SQL</p>
                    <p>Reporting Software: iReport</p>
                    <p>Script: JSON, XML</p>
                    <p>Other Languages: C, C++, PHP</p>
                    <p>Other Skill: Adobe Photoshop</p>
                    <p>OS: Windows, Ubuntu</p>
                </div>
                <div class="col-md-6 col-sm-12">
                    <h2 class="mb-10">Skilled in</h2>
                    <p style="text-align: justify;"> -> Developing high-volume & low-latency applications
                        and delivering high-availability & performance</p>
                    <p style="text-align: justify;">-> Assuring that the designs are in compliance with specifications</p>
                    <p style="text-align: justify;">-> Supporting continuous improvement by investigating alternatives &
                        technologies and presenting these for architectural review</p>

                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <p>
                    Recently I have done a lot of work with REST web service and Microservice.
                    In the end I'm not just only a efficient developer, but also someone that will help you with project in general(excluding graphic design ).
                </p>
            </div>
        </div>
        <div class="row skillbar-wraps">
            <h2 class="pt-30 text-center">Tools Expertness</h2>
            <div class="col-lg-6 skill-left">
                <div class="single-skill">
                    <p>
                        Intellije 90%
                    </p>
                    <div class="skill" data-width="95"></div>
                </div>
                <div class="single-skill">
                    <p>
                        Eclipse 90%
                    </p>
                    <div class="skill" data-width="95"></div>
                </div>
                <div class="single-skill">
                    <p>
                        MySQL 80%
                    </p>
                    <div class="skill" data-width="80"></div>
                </div>
                <div class="single-skill">
                    <p>
                        SQL Server 80%
                    </p>
                    <div class="skill" data-width="80"></div>
                </div>

            </div>
            <div class="col-lg-6 skill-right">
                <div class="single-skill">
                    <p>
                        Oracle RDBMS 80%
                    </p>
                    <div class="skill" data-width="80"></div>
                </div>
                <div class="single-skill">
                    <p>
                        Sublime 70%
                    </p>
                    <div class="skill" data-width="70"></div>
                </div>
                <div class="single-skill">
                    <p>
                        Windows 90%
                    </p>
                    <div class="skill" data-width="90"></div>
                </div>
                <div class="single-skill">
                    <p>
                        Ubuntu 90%
                    </p>
                    <div class="skill" data-width="90"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End home-about Area -->

<!-- Start timeline Area -->
<section class="timeline pb-120">
    <div class="text-center">
        <div class="menu-content pb-70">
            <div class="title text-center">
                <h1 class="mb-10">My Qualifications</h1>
                <p>Who are in extremely love with eco friendly system.</p>
            </div>
        </div>
    </div>
    <ul>
        <li>
            <div class="content c-state" >
                <h4>
                    <time>Secondary School Certificate(SSC)</time>
                </h4>
                <p><b>Institution:</b> Debidwar Reaz Uddin Pilot High School</p>
                <p><b>Group:</b> Science</p>
                <p><b>Session:</b> 2007-08</p>
                <p><b>Result:</b> 4.38 (In the Scale of 5.00)</p>
            </div>
        </li>
        <li style="padding-right: 700px; background: none !important;">
        <div class="content c-state" >
            <h4>
                <time>Higher Secondary School Certificate(HSC)</time>
            </h4>
            <p><b>Institution:</b> Badiul Alam Degree College</p>
            <p><b>Group:</b> Science</p>
            <p><b>Session:</b> 2009-10</p>
            <p><b>Result:</b> 5.00 (In the Scale of 5.00)</p>
        </div>
    </li>
        <li>
            <div class="content c-state" >
                <h4>
                    <time>Computer Science & Telecommunication Engineering</time>
                </h4>
                <p><b>Institution:</b> Noakhali Science & Technology University(NSTU)</p>
                <p><b>Session:</b> 2012-17</p>
                <p><b>Result:</b> 3.10 (In the Scale of 4.00)</p>
            </div>
        </li>
        <li style="padding-right: 700px; background: none !important;">
            <div class="content c-state" >
                <img class="img-fluid mx-auto d-block mb-30" src="<c:url value="/resources/website/assets/img/about/c-logo.png"/>" alt="">
                <h4>
                    <time>Junior Software Developer(Java & Vaddin)</time>
                </h4>
                <p>E-vision Software Ltd.</p>
                <p>January 2017 to December 2017</p>
            </div>
        </li>
        <li>
            <div class="content c-state">
                <img class="img-fluid mx-auto d-block mb-30" src="<c:url value="/resources/website/assets/img/about/c-logo.png"/>" alt="">
                <h4>
                    <time>Software Developer(Java & Spring)</time>
                </h4>
                <p>BASE Ltd.</p>
                <p>December 2017 to Present</p>
            </div>
        </li>
    </ul>
</section>

<!-- End timeline Area -->
