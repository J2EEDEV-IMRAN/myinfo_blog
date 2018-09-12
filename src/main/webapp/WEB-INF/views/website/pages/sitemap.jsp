<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="col-md-12">
    <div class="tbox tag-box-v3 margin-bottom-40">
        <div class="heading heading-v2 margin-bottom-40">
            <h2>Site Map</h2>
        </div>
        <div class="sitemap margin-bottom-40">
            <div class="row">
                <div class="col-sm-4">
                    <h4>Top Menu:</h4>
                    <ul>
                        <li><a href="${contextPath}/"><strong>Home</strong></a></li>
                        <li><a href="${contextPath}/sitemap.html"><strong>Site map</strong></a></li>
                        <li><a href="mailto:israil@legislativediv.gov.bd"><strong>E-mail </strong></a></li>
                        <li><a href="?page=feedback"><strong>Contact Us</strong></a></li>
                    </ul>
                </div>
                <div class="col-sm-4">
                    <h4>Left Menu</h4>
                    <ul>
                        <li><a href="${contextPath}/"><strong>Home</strong></a></li>
                        <li><a href="#"><strong>Laws of Bangladesh</strong></a></li>
                        <ul>
                            <li><a href="${contextPath}/laws-of-bangladesh-chronological-index.html">Chronological Index</a></li>
                            <li><a href="${contextPath}/laws-of-bangladesh-alphabetical-index.html">SAlphabetic Index</a></li>
                            <li><a href="${contextPath}/search.html">Law Search</a></li>
                        </ul>
                        <li><a href="#"><strong>Bangladesh Code </strong></a></li>
                        <ul>
                            <li><a href="${contextPath}/about-bangladesh-code.html">About Bangladesh Code</a></li>
                            <li><a href="${contextPath}/bangladesh-code-chronological-index.html">Chronological Index</a></li>
                            <li><a href="${contextPath}/bangladesh-code-alphabetical-index.html">Alphabetic Index</a></li>
                        </ul>
                        <li><a href="?page=faq"><strong>FAQ</strong></a></li>
                        <li><a href="?page=how-to-search"><strong>How to Search</strong></a></li>
                        <li><a href="?page=how-to-print"><strong>How to Print</strong></a></li>
                        <li><a href="?page=roman-numbers"><strong>Roman Numbers</strong></a></li>
                        <li><a href="?page=glossary"><strong>Glossary</strong></a></li>
                        <li><a href="?page=news-and-notice"><strong>News and Notice</strong></a></li>
                        <li><a href="?page=feedback"><strong>Feedback / Suggestion </strong></a></li>
                    </ul>   
                </div>
                <div class="col-sm-4">
                    <h4>Related Link</h4>
                    <ul>
                        <li><a target="_blank" href="http://www.bangladesh.gov.bd/">Bangladesh Government Official Web Site</a></li>   
                        <li><a target="_blank" href="http://www.legislativediv.gov.bd/">Legislative and Parliamentary Affairs Division</a></li>
                        <li><a target="_blank" href="http://www.parliament.gov.bd/">Parliament Secretariat</a></li>
                    </ul>   
                </div>
            </div>
        </div>
    </div>
</div>