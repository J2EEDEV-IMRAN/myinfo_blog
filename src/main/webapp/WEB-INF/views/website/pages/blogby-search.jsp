<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ata" uri="http://ataur.me/jstl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>
<c:set var="queryString">${pageContext.request.getAttribute("javax.servlet.forward.query_string")}</c:set>
<c:set var="queryString"><c:if test="${not empty queryString}">?</c:if>${queryString}</c:set>

<section class="banner-area relative blog-home-banner" id="home">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content blog-header-content col-lg-12">
                <h1 class="text-white">
                    Dude You’re Getting
                    a Telescope
                </h1>
                <p class="text-white">
                    There is a moment in the life of any aspiring astronomer that it is time to buy that first
                </p>
                <a href="blog-single.jsp" class="primary-btn">View More</a>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->

<!-- Start top-category-widget Area -->
<section class="top-category-widget-area pt-90 pb-90 ">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="single-cat-widget">
                    <div class="content relative">
                        <div class="overlay overlay-bg"></div>
                        <a href="#" target="_blank">
                            <div class="thumb">
                                <img class="content-image img-fluid d-block mx-auto" src="img/blog/cat-widget1.jpg" alt="">
                            </div>
                            <div class="content-details">
                                <h4 class="content-title mx-auto text-uppercase">Social life</h4>
                                <span></span>
                                <p>Enjoy your social life together</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="single-cat-widget">
                    <div class="content relative">
                        <div class="overlay overlay-bg"></div>
                        <a href="#" target="_blank">
                            <div class="thumb">
                                <img class="content-image img-fluid d-block mx-auto" src="img/blog/cat-widget2.jpg" alt="">
                            </div>
                            <div class="content-details">
                                <h4 class="content-title mx-auto text-uppercase">Politics</h4>
                                <span></span>
                                <p>Be a part of politics</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="single-cat-widget">
                    <div class="content relative">
                        <div class="overlay overlay-bg"></div>
                        <a href="#" target="_blank">
                            <div class="thumb">
                                <img class="content-image img-fluid d-block mx-auto" src="img/blog/cat-widget3.jpg" alt="">
                            </div>
                            <div class="content-details">
                                <h4 class="content-title mx-auto text-uppercase">Food</h4>
                                <span></span>
                                <p>Let the food be finished</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End top-category-widget Area -->

<!-- Start post-content Area -->
<section class="post-content-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 posts-list">

                 <c:choose>
                <c:when test="${PostList.hasContent()}">
                  <%--  <div class="row well well-sm">--%>
                        <c:forEach items="${PostList.getContent()}" var="post" varStatus="loop">

                            <div class="single-post row">
                                <div class="col-lg-3  col-md-3 meta-details">
                                    <ul class="tags">
                                        <c:set var="c" value="0" />
                                        <c:forEach var="tag" items="${post.postTags}">
                                            <c:set var="c" value="${c+1}"/>
                                            <li><a href="blogby-tag-${tag.id}.html">${tag.tagName}<c:if test="${c!=post.postTags.size()}">,</c:if></a></li>
                                        </c:forEach>
                                    </ul>
                                    <div class="user-details row">
                                        <p class="user-name col-lg-12 col-md-12 col-6"><a href="#">${post.createdBy}</a> <span class="lnr lnr-user"></span></p>
                                        <p class="date col-lg-12 col-md-12 col-6"><a href="#"><fmt:formatDate value="${post.createdAt}" pattern="dd/MM/yyyy hh:mm a" /></a> <span class="lnr lnr-calendar-full"></span></p>
                                        <p class="comments col-lg-12 col-md-12 col-6"><a href="#">${post.postComment.size()} Comments</a> <span class="lnr lnr-bubble"></span></p>
                                    </div>
                                </div>

                                <div class="col-lg-9 col-md-9 ">
                                    <div class="feature-img">
                                        <img class="img-fluid" src="<c:url value="${contextPath}/upload/${post.postImage}"/>" alt="${contextPath}/upload/${post.postImage}">
                                    </div>
                                    <a class="posts-title" href="blog-single-${post.id}.html"><h3>${ata:html2Text(post.postTitle)}</h3></a>
                                    <p class="excert">
                                            ${ata:html2Text(post.post)}
                                    </p>
                                    <a href="blog-single-${post.id}.html" class="primary-btn">View More</a>
                                </div>
                            </div>
                        </c:forEach>
                   <%-- </div>--%>
                     <div class="row">
                         <div class="col-sm-4">
                             <div class="text-info text-center pagination">
                                     ${(p-1)*s+1} to ${((p-1)*s+s)>PostList.getTotalElements()? PostList.getTotalElements() : ((p-1)*s+s)} of ${PostList.getTotalElements()}
                             </div>
                         </div>
                         <div class="col-sm-8">
                             <nav aria-label="Page navigation">
                                 <ul class="pagination">
                                <c:if test="${fn:contains(queryString,'page')}">
                                    <c:set var="pageNo" value="${fn:substring(queryString, 0, queryString.lastIndexOf('&'))}"  />
                                    <li Class="${PostList.hasPrevious()? '':'disabled hide'}"><a class="page-link" href="${contextPath}/search.html${pageNo}&page=${PostList.previousPageable().getPageNumber()+1}">
                                         <span aria-hidden="true">
		                                        <span class="lnr lnr-chevron-left"></span>
		                                    </span>
                                    </a></li>
                                </c:if>

                                     <c:set var="initialPage" value="${(p-5)<1 ? 1 : (p-5)}"/>

                                     <c:set var="endingPage" value="${9+initialPage}"/>
                                     <c:if test="${PostList.getTotalPages()< endingPage}">
                                         <c:set var="endingPage" value="${PostList.getTotalPages()}"/>
                                         <c:set var="initialPage" value="${(endingPage -9)<1? 1: (endingPage -9)}"/>
                                     </c:if>
                                     <c:forEach begin="${initialPage}" end="${endingPage}" varStatus="loop">

                                         <c:choose>
                                             <c:when test="${p==loop.index}">
                                                 <li class="active page-item">
                                                     <span>${loop.index} <span class="sr-only">(current)</span></span>
                                                 </li>
                                             </c:when>
                                             <c:otherwise>
                                           <%--      <li class="page-item">
                                                     <a class="page-link" href="${contextPath}/search.html?page=${loop.index}">${loop.index}</a>
                                                 </li>--%>

                                                 <c:choose>
                                                     <c:when test="${fn:contains(queryString,'page')}">
                                                         <c:set var="pageNo" value="${fn:substring(queryString, 0, queryString.lastIndexOf('&'))}"  />
                                                         <%--<c:out value="${separatorPosition[fn:length(separatorPosition)-1]}">
                                                         </c:out>--%>
                                                    <li class="page-item">
                                                         <a href="${contextPath}/search.html${pageNo}&page=${loop.index}">${loop.index}</a>
                                                    </li>
                                                     </c:when>
                                                     <c:otherwise>
                                                    <li class="page-item">
                                                         <a href="${contextPath}/search.html${queryString}&page=${loop.index}">${loop.index}</a>
                                                    </li>
                                                     </c:otherwise>
                                                 </c:choose>
                                             </c:otherwise>
                                         </c:choose>

                                     </c:forEach>
                                     <c:if test="${fn:contains(queryString,'page')}">
                                         <c:set var="pageNo" value="${fn:substring(queryString, 0, queryString.lastIndexOf('&'))}"  />
                                         <li class="${PostList.hasNext()? '':'disabled hide'}"><a class="page-link" href="${contextPath}/search.html${pageNo}&page=${PostList.nextPageable().getPageNumber()+1}">
                                           <span aria-hidden="true">
		                                        <span class="lnr lnr-chevron-right"></span>
		                                    </span>
                                         </a></li>
                                     </c:if>

                                 </ul>
                             </nav>
                         </div>
                     </div>
                </c:when>
                     <c:otherwise>
                         <c:out value="${PostList.size}"/> <h3 class="text-danger text-center"><spring:message code="website.noResult.txt"/></h3>
                     </c:otherwise>
                 </c:choose>
            </div>


            <div class="col-lg-4 sidebar-widgets">
                <div class="widget-wrap">
                    <div class="single-sidebar-widget search-widget">
                        <form class="search-form" action="#">
                            <input placeholder="Search Posts" name="search" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Posts'" >
                            <button type="submit"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                    <div class="single-sidebar-widget user-info-widget">
                        <img class="img-circle" src="<c:url value="/resources/website/assets/img/IMRAN1.jpg"/>" alt="">
                        <a href="#"><h4>Imran Hossain</h4></a>
                        <p>
                            Senior blog writer
                        </p>
                        <ul class="social-links">
                            <li><a href="https://www.facebook.com/profile.php?id=100005065213335" target="_blank"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="https://twitter.com/IMRANHO15468379" target="_blank"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="https://github.com/Huntsman-Imran" target="_blank"><i class="fa fa-github"></i></a></li>
                            <li><a href="https://www.instagram.com/durbarimran24h/" target="_blank"><i class="fa fa-instagram"></i></a></li>
                        </ul>
                        <p>
                            I'm a java programmer. I've been working with java for last five years. So I'll give you many important info through the bolg. Keep in touch
                        </p>
                    </div>
                    <div class="single-sidebar-widget popular-post-widget">
                        <h4 class="popular-title">Popular Posts</h4>
                        <div class="popular-post-list">
                      <c:forEach items="${popularPostList}" varStatus="loop" var="popularPost" >
                            <div class="single-post-list d-flex flex-row align-items-center">
                                <div class="thumb">
                                    <img class="img-fluid pupular-post-img"  src="<c:url value="${contextPath}/upload/${popularPost.postImage}"/>" alt="">
                                </div>
                                <div class="details">
                                    <a href="blog-single-${popularPost.id}.html"><h6>${ata:html2Text(popularPost.postTitle)}</h6></a>
                                    <p>02 Hours ago</p>
                                </div>
                            </div>
                    </c:forEach>
                        </div>
                    </div>
                    <div class="single-sidebar-widget ads-widget">
                        <a href="#"><img class="img-fluid" src="img/blog/ads-banner.jpg" alt=""></a>
                    </div>
                    <div class="single-sidebar-widget post-category-widget">
                        <h4 class="category-title">Post Catgories</h4>
                        <ul class="cat-list">
                            <c:forEach items="${postCategories}" varStatus="loop" var="caregory">
                            <li>
                                <a href="postby-category-${caregory.id}.html" class="d-flex justify-content-between">
                                    <p>${caregory.categoryName}(${caregory.postList.size()})</p>
                                </a>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="single-sidebar-widget newsletter-widget">
                        <h4 class="newsletter-title">Archive</h4>
                        <ul class="cat-list">
                            <c:forEach items="${postyear}" varStatus="loop" var="postyear">
                                <li>
                                    <c:if test="${postyear.contains('January')}">
                                        <a href="blogby-year.html?year=1${postyear.substring(7,12)}" class="d-flex justify-content-between">
                                            <p> ${postyear}</p>
                                        </a>
                                    </c:if>
                                    <c:if test="${postyear.contains('February')}">
                                        <a href="blogby-year.html?year=2${postyear.substring(8,13)}" class="d-flex justify-content-between">
                                            <p> ${postyear}</p>
                                        </a>
                                    </c:if>
                                    <c:if test="${postyear.contains('March')}">
                                        <a href="blogby-year.html?year=3${postyear.substring(5,10)}" class="d-flex justify-content-between">
                                            <p> ${postyear}</p>
                                        </a>
                                    </c:if>
                                    <c:if test="${postyear.contains('April')}">
                                        <a href="blogby-year.html?year=4${postyear.substring(5,10)}" class="d-flex justify-content-between">
                                            <p> ${postyear}</p>
                                        </a>
                                    </c:if>
                                    <c:if test="${postyear.contains('May')}">
                                        <a href="blogby-year.html?year=5${postyear.substring(3,8)}" class="d-flex justify-content-between">
                                            <p> ${postyear}</p>
                                        </a>
                                    </c:if>
                                    <c:if test="${postyear.contains('June')}">
                                        <a href="blogby-year.html?year=6${postyear.substring(4,9)}" class="d-flex justify-content-between">
                                            <p> ${postyear}</p>
                                        </a>
                                    </c:if>
                                    <c:if test="${postyear.contains('July')}">
                                        <a href="blogby-year.html?year=7${postyear.substring(4,9)}" class="d-flex justify-content-between">
                                            <p> ${postyear}</p>
                                        </a>
                                    </c:if>
                                    <c:if test="${postyear.contains('August')}">
                                        <a href="blogby-year.html?year=8${postyear.substring(6,11)}" class="d-flex justify-content-between">
                                            <p> ${postyear}</p>
                                        </a>
                                    </c:if>
                                    <c:if test="${postyear.contains('September')}">
                                        <a href="blogby-year.html?year=9${postyear.substring(9,14)}" class="d-flex justify-content-between">
                                            <p> ${postyear}</p>
                                        </a>
                                    </c:if>
                                    <c:if test="${postyear.contains('October')}">
                                        <a href="blogby-year.html?year=10${postyear.substring(7,12)}" class="d-flex justify-content-between">
                                            <p> ${postyear}</p>
                                        </a>
                                    </c:if>
                                    <c:if test="${postyear.contains('November')}">
                                        <a href="blogby-year.html?year=11${postyear.substring(8,13)}" class="d-flex justify-content-between">
                                            <p> ${postyear}</p>
                                        </a>
                                    </c:if>

                                    <c:if test="${postyear.contains('December')}">
                                        <a href="blogby-year.html?year=12${postyear.substring(8,13)}" class="d-flex justify-content-between">
                                            <p> ${postyear}</p>
                                        </a>
                                    </c:if>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="single-sidebar-widget tag-cloud-widget">
                        <h4 class="tagcloud-title">Tag Clouds</h4>
                        <ul>
                            <c:forEach items="${postTags}" varStatus="loop" var="tags">
                                <li>
                                    <a href="blogby-tag-${tags.id}.html">${tags.tagName}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End post-content Area -->