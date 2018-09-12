<%--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>

    <div class="tbox tag-box-v3 margin-bottom-40">
        <div class="heading heading-v2 margin-bottom-40">
            <h2><spring:message code="website.faq.text"/> </h2>
            <p><spring:message code="website.Frequently.Asked.Question"/> </p>
        </div>
        <div class="panel-group faq" id="faqAccordion">
            <c:forEach items="${faqList}" var="faq">
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question${faq.id}">
                        <h4 class="panel-title">
                            <a href="#" class="ing">
                                <c:choose>
                                    <c:when test="${lang=='en'}">
                                        ${faq.questionEnglish}
                                    </c:when>
                                    <c:otherwise>
                                        ${faq.questionBangla}
                                    </c:otherwise>
                                </c:choose>
                            </a>
                        </h4>
                    </div>
                    <div id="question${faq.id}" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body">
                            <h5><span class="label label-primary">
                                <spring:message code="website.Answer.text"/>
                            </span></h5>

                            <p>
                                <c:choose>
                                    <c:when test="${lang=='en'}">
                                        ${faq.answerEnglish}
                                    </c:when>
                                    <c:otherwise>
                                        ${faq.answerBangla}
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>--%>




<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>


<script src="<c:out value="/resources/website/assets/js/jquery.wordexport.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/FileSaver.js"/>"></script>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $("a.jquery-word-export").click(function(event) {
            $("#page-content").wordExport();
        });
    });
</script>

<div class="tbox tag-box-v3 margin-bottom-40">
    <div class="heading heading-v2 margin-bottom-40">
        <h2><spring:message code="website.faq.text"/> </h2>
        <p><spring:message code="website.Frequently.Asked.Question"/> </p>
    </div>
    <div class="panel-group faq" id="faqAccordion">
        <c:forEach items="${faqList}" var="faq">
            <div class="panel panel-default " id="page-content">
                <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question${faq.id}">
                    <h4 class="panel-title">
                        <a href="#" class="ing">
                            <c:choose>
                                <c:when test="${lang=='en'}">
                                    ${faq.questionEnglish}
                                </c:when>
                                <c:otherwise>
                                    ${faq.questionBangla}
                                </c:otherwise>
                            </c:choose>
                        </a>
                    </h4>
                </div>
                <div id="question${faq.id}" class="panel-collapse collapse" style="height: 0px;">
                    <div class="panel-body">
                        <h5><span class="label label-primary">
                                <spring:message code="website.Answer.text"/>
                            </span></h5>

                        <p>
                            <c:choose>
                                <c:when test="${lang=='en'}">
                                    ${faq.answerEnglish}
                                </c:when>
                                <c:otherwise>
                                    ${faq.answerBangla}
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>

        <div class="col-xs-5">
            <a class="btn jquery-word-export" href="javascript:void(0)">
                <span class="word-icon">W</span>
                Export as .doc
            </a>
        </div>

    </div>
</div>