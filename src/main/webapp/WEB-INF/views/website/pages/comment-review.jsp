<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ata" uri="http://ataur.me/jstl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>

<div class="row">
    <div class="col-md-12 col-sm-12" style="padding-top: 200px;padding-bottom: 200px;color: green">
        <div class="alert alert-primary text-center">
            This Comment is Sent For Review. <a href="blog-single-${id}.html" class="primary-btn">Go Back</a>
        </div>
    </div>
</div>
