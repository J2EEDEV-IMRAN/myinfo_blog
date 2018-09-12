<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
			<section class="relative about-banner">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								Blog Details Page				
							</h1>	
							<p class="text-white link-nav"><a href="index.html">Home </a>  <span class="lnr lnr-arrow-right"></span><a href="blog-home.html">Blog </a> <span class="lnr lnr-arrow-right"></span> <a href="blog-single.jsp"> Blog Details Page</a></p>
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->					  
			
			<!-- Start post-content Area -->
			<section class="post-content-area single-post-area">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 posts-list">
							<div class="single-post row">
								<div class="col-lg-12">
									<div class="feature-img">
										<img class="img-fluid" src="<c:url value="${contextPath}/upload/${postsingle.postImage}"/>" alt="${contextPath}/upload/${postsingle.postImage}">
									</div>									
								</div>
								<div class="col-lg-3  col-md-3 meta-details">
									<ul class="tags">
										<c:set var="c" value="0" />
										<c:forEach var="tag" items="${postsingle.postTags}">
											<c:set var="c" value="${c+1}"/>
											<li><a href="blogby-tag-${tag.id}.html">${tag.tagName}<c:if test="${c!=postsingle.postTags.size()}">,</c:if></a></li>
										</c:forEach>
									</ul>
									<div class="user-details row">
										<p class="user-name col-lg-12 col-md-12 col-6"><a href="#">${postsingle.createdBy}</a> <span class="lnr lnr-user"></span></p>
										<p class="date col-lg-12 col-md-12 col-6"><a href="#"><fmt:formatDate value="${postsingle.createdAt}" pattern="dd/MM/yyyy hh:mm a" /></a> <span class="lnr lnr-calendar-full"></span></p>
										<p class="view col-lg-12 col-md-12 col-6"><a href="#">${view} Views</a> <span class="lnr lnr-eye"></span></p>
										<p class="comments col-lg-12 col-md-12 col-6"><a href="#">${postsingle.postComment.size()} Comments</a> <span class="lnr lnr-bubble"></span></p>
										<ul class="social-links col-lg-12 col-md-12 col-6">
											<li><a href="javascript:void(0);" onclick="return fbs_click();" target="_blank"><i class="fa fa-facebook"></i></a></li>
											<li><a href="javascript:void(0);" onclick="return tws_click()" target="_blank"><i class="fa fa-twitter"></i></a></li>
											<li><a href="javascript:void(0);" onclick="return ins_click();" target="_blank"><i class="fa fa-github"></i></a></li>
											<li><a href="javascript:void(0);" onclick="return gps_click();" target="_blank"><i class="fa-google-plus-g"></i></a></li>
										</ul>																				
									</div>
								</div>
								<div class="col-lg-9 col-md-9">
									<h3 class="mt-20 mb-20">${ata:html2Text(postsingle.postTitle)}</h3>
									<p class="excert">
										${ata:html2Text(postsingle.post)}
									</p>
								</div>
								<div class="col-lg-12">

									<div class="row mt-30 mb-30">
										<div class="col-6">
											<img class="img-fluid" src="img/blog/post-img1.jpg" alt="">
										</div>
										<div class="col-6">
											<img class="img-fluid" src="img/blog/post-img2.jpg" alt="">
										</div>
									</div>
								</div>
							</div>
							<div class="navigation-area">
								<div class="row">
									<c:if test="${previouspost!=null}">
										<div class="col-md-6 col-12 pull-left flex-row d-flex justify-content-start align-items-center">
											<div class="row">
												<div class="col-md-3 col-sm-3">
													<div class="thumb">
														<a href="blog-single-${previouspost.id}.html"><img class="img-fluid" src="<c:url value="/resources/website/assets/img/usr.jpg"/>" alt="usr.jpg" ></a>
													</div>
												</div>
												<div class="col-md-9 col-sm-9 text-left">
													<div class="detials">
														<p>Prev Post</p>
														<a href="blog-single-${previouspost.id}.html"><h4>${ata:html2Text(previouspost.postTitle)}</h4></a>
													</div>
												</div>
											</div>

										</div>
									</c:if>
									<c:if test="${nextpost!=null}">
										<div class="col-md-6 col-12 pull-right flex-row d-flex justify-content-end align-items-center">
											<div class="row">
												<div class="col-md-9 col-sm-9 text-right">
													<div class="detials">
														<p>Next Post</p>
														<a href="blog-single-${nextpost.id}.html"><h4>${ata:html2Text(nextpost.postTitle)}</h4></a>
													</div>
												</div>
												<div class="col-md-3 col-sm-3">
													<div class="thumb">
														<a href="blog-single-${nextpost.id}.html"><img class="img-fluid" src="<c:url value="/resources/website/assets/img/usr.jpg"/>" alt="usr.jpg"></a>
													</div>
												</div>
											</div>

										</div>
									</c:if>


								</div>
							</div>
							<div class="comments-area">
								<h4><c:out value="${comments.size()}"/> Comments</h4>
								<div class="comment-list">
                                    <div class="single-comment justify-content-between d-flex">
										<c:forEach items="${comments}" var="comment">
											<div class="user justify-content-between d-flex">
												<div class="thumb">
													<img width="30" height="30" src="<c:url value="/resources/website/assets/img/web-user.jpg"/>" alt="web-user.jpg">
												</div>
												<div class="desc">
													<h5><a href="#">${comment.name}</a></h5>
													<p class="date"><fmt:formatDate value="${comment.createdAt}" pattern="dd/MM/yyyy hh:mm a" /></p>
													<p class="comment">
															${comment.comment}
													</p>
												</div>
											</div>
										</c:forEach>
                                    </div>
                                </div>
							</div>
							<div class="comment-form">
								<h4>Leave a Comment</h4>
                           <form:form cssClass="form-horizontal" id="commentForm" method="post" role="form" modelAttribute="comment" action="${contextPath}/comment-${postsingle.id}.html?${_csrf.parameterName}=${_csrf.token}"   data-ajax-submit="true">
							 <%--  <spring:bind path="postId">
									   <form:input path="postId" data-validation="trim|integer" type="hidden" value="${postsingle.id}"></form:input>
							   </spring:bind>--%>

									<div class="form-inline">
									  <div class="form-group col-md-6 col-sm-12 name" style="padding-bottom: 20px">
                                      <spring:bind path="name">
											  <form:input type="text" class="form-control" data-validation="trim|min_length[1]|max_length[255]|required" id="inputname" path="name" value="${fn:escapeXml(name)}"  placeholder="Enter Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Name'"/>
                                              <form:errors path="name" cssClass="help-block text-danger" element="span" />
                                      </spring:bind>
									  </div>
									  <div class="col-md-6 col-sm-12 email" style="padding-bottom: 20px">
                                          <spring:bind path="email">
												  <form:input type="text" class="form-control" data-validation="trim|min_length[1]|max_length[255]|required" id="inputemail" path="email" value="${fn:escapeXml(email)}"  placeholder="Enter email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'"/>
                                                  <form:errors path="email" cssClass="help-block text-danger" element="span" />
                                          </spring:bind>
									  </div>										
									</div>
									<div class="form-group col-md-12 col-sm-12">
                                        <spring:bind path="subject">
                                            <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
												<form:input type="text" class="form-control" data-validation="trim|min_length[1]|max_length[255]" id="inputsubject" path="subject" value="${fn:escapeXml(subject)}" placeholder="Subject" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Subject'"/>
                                                <form:errors path="subject" cssClass="help-block text-danger" element="span" />
                                            </div>
                                        </spring:bind>
									</div>
									<div class="form-group col-md-12 col-sm-12">
                                        <spring:bind path="comment">
                                            <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
												<form:textarea rows="5" class="form-control " data-validation="trim|required" id="inputcomment" path="comment"  value="${fn:escapeXml(comment)}" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""/>
                                                <form:errors path="comment" cssClass="help-block text-danger" element="span" />
                                            </div>
                                        </spring:bind>
									</div>
									<button type="submit" class="primary-btn text-uppercase">Post Comment</button>
								</form:form>
							</div>
						</div>
						<div class="col-lg-4 sidebar-widgets">
							<div class="widget-wrap">
								<div class="single-sidebar-widget search-widget">
									<form class="search-form" action="${contextPath}/search.html">
			                            <input placeholder="Search Posts" name="search" value="${fn:escapeXml(search)}" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Posts'" >
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
<script type="text/javascript">
	function fbs_click() {
		 u = window.location.href;
		alert(u);
		t = document.title;
		window.open('http://www.facebook.com/sharer.php?u=' + encodeURIComponent(u) + '&t=' + encodeURIComponent(t), 'sharer', 'toolbar=0,status=0,width=626,height=436, scrollbars=yes,left=50,top=50');
		return false;
	}

	function ins_click() {
		 u = window.location.href;
		t = document.title;
		window.open('http://www.linkedin.com/shareArticle?mini=true&url=' + encodeURIComponent(u) + '&title=' + encodeURIComponent(t), 'sharer', 'toolbar=0,status=0,width=700,height=00, scrollbars=yes,left=350,top=50');
		return false;
	}

	function tws_click() {
		u  = window.location.href;
		t = document.title;
		window.open('http://twitter.com/share?url=' + encodeURIComponent(u) + '&text=' + encodeURIComponent(t) + ' @', 'sharer', 'toolbar=0,status=0,width=700,height=500, scrollbars=yes,left=50,top=50');
		return false;
	}

	function gps_click() {
		u = window.location.href;
		t = document.title;
		window.open('https://plus.google.com/share?url=' + encodeURIComponent(u), 'sharer', 'toolbar=0,status=0,width=700,height=500, scrollbars=yes,left=50,top=50');
		return false;
	}
</script>
			<!-- End post-content Area -->
			

