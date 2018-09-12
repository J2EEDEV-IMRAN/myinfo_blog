<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>


<div class="col-md-12">
    <div class="tbox tag-box-v3 margin-bottom-40">
        <div class="heading heading-v2 margin-bottom-40">
            <h2>
                <c:choose>
                    <c:when test="${lang=='en'}">
                        ${staticPage.pageTitleEnglish}
                    </c:when>
                    <c:otherwise>
                        ${staticPage.pageTitleBangla}
                    </c:otherwise>
                </c:choose>
            </h2>
        </div>
        <div class="glossary">
            <c:choose>
                <c:when test="${lang=='en'}">
                    ${staticPage.pageContentEnglish}
                </c:when>
                <c:otherwise>
                    ${staticPage.pageContentBangla}
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>