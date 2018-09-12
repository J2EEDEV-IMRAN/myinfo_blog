<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ata" uri="http://ataur.me/jstl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>

<!-- Start portfolio-area Area -->
<section class="portfolio-area section-gap" id="portfolio">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-70 col-md-12">
                <div class="title text-center">
                    <h1 class="mb-10">Our Latest Featured Projects</h1>
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
                            <div class="cat"><a href="${portfolio.link}" ></a> ${portfolio.link}</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<!-- End portfolio-area Area -->