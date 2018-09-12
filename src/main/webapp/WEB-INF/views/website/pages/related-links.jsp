<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>



<div class="col-md-12">
    <div class="tbox tag-box-v3 margin-bottom-40">
        <c:forEach items="${relatedLinks}" var="relatedLink">
            <div class="heading heading-v2 margin-bottom-40">

                <h3>
                    <a href="${relatedLink.link}" target="_blank">
                        <c:choose>
                            <c:when test="${lang=='en'}">
                                ${relatedLink.titleEnglish}
                            </c:when>
                            <c:otherwise>
                                ${relatedLink.titleBangla}
                            </c:otherwise>
                        </c:choose>
                    </a>
                </h3>
            </div>

        </c:forEach>


    </div>
</div>