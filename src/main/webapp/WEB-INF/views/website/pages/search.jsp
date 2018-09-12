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

<div class="row well well-sm">
    <div class="col-sm-6">
        <form cssClass="form-inline" action="${contextPath}/search.html">
            <div class="input-group">
                <input name="q" value="${fn:escapeXml(q)}" class="form-control" placeholder="<spring:message code="website.search.text"/>"/>
                <span class="input-group-addon">
                    <spring:message code="website.searchBy.forEnglish"></spring:message>
                    <select name="type">
                        <option <c:if test="${type==1}">selected</c:if> value="1"><spring:message code="website.any.text"/></option>
                        <option <c:if test="${type==2}">selected</c:if> value="2"><spring:message code="website.shortTitle.text"/></option>
                        <option <c:if test="${type==3}">selected</c:if> value="3"><spring:message code="website.actNo.text"/></option>
                        <option <c:if test="${type==4}">selected</c:if> value="4"><spring:message code="website.actYear.text"/></option>
                        <option <c:if test="${type==5}">selected</c:if> value="5"><spring:message code="website.part.text"/></option>
                        <option <c:if test="${type==6}">selected</c:if> value="6"><spring:message code="website.chapter.text"/></option>
                        <option <c:if test="${type==7}">selected</c:if> value="7"><spring:message code="website.section.text"/> </option>
                    </select>
                    <spring:message code="website.searchBy.forBangla"></spring:message>
                </span>
                <span class="input-group-btn">
                        <button class="btn-u" type="submit"><i class="fa fa-search"></i></button>
                </span>

            </div>

        </form>
    </div>

    <div class="col-sm-6" style="text-align:left !important;">
        <button class="btn btn-default advancedSearch"><spring:message code="website.advanced.text"/></button>
    </div>
    <div class="row  advancedSearchForm" style="display:none; margin-top:10px;padding: 10px;">
        <form:form modelAttribute="search" action="${contextPath}/search.html" method="get" class="form-inline">
            <table class="table table-striped">
                <tr>
                    <th class="text-right">
                        <spring:message code="website.volume.text"/><sup class="text-danger">*</sup>
                    </th>
                    <td>
                            <form:select class="form-control"  path="volume" id="inputvolumeId" style="width:100%">
                                <form:option value="0"> --SELECT--</form:option>
                                <form:options items="${volumes}" itemLabel="volumeHead" itemValue="id"></form:options>
                            </form:select>
                            <form:errors path="volume" cssClass="help-block text-danger" element="span" />

                    </td>
                    <th class="text-right">
                        <spring:message code="website.actYear.text"/><sup title="This field is required" class="text-danger">*</sup>
                    </th>
                    <td>
                            <form:input path="year" id="inputYear" class="form-control"/>
                    </td>
                    <th class="text-right">
                        <spring:message code="website.actno.text"/><sup class="text-danger">*</sup>
                    </th>
                    <td>
                        <form:input path="actNo" id="inputActNo" class="form-control"/>
                    </td>
                </tr>
                <tr>
                    <th class="text-right"><spring:message code="website.partNo.text"/></th>
                    <td>
                        <form:input path="partNo" id="inputPartNo" class="form-control"/>
                    </td>
                    <th class="text-right"><spring:message code="website.chapterNo.text"/></th>
                    <td>
                        <form:input path="chapterNo" id="inputChapterNo" class="form-control"/>
                    </td>
                    <th class="text-right"><spring:message code="website.sectionNo.text"/></th>
                    <td>
                        <form:input path="sectionNo" id="inputSectionNo" class="form-control"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" class="text-center">
                        <button type="submit" class="btn btn-lg btn-primary"><i class="fa fa-search"></i></button>
                    </td>
                </tr>
            </table>
        </form:form>
    </div>

</div>


    <c:choose>
        <c:when test="${results.hasContent()}">
            <div class="row well well-sm">
                <c:forEach items="${results.getContent()}" var="search" varStatus="loop">

                        <div class="result ${search.actId.repealedAct.status==true? 'repealed': ''}">
                            <h3 class="r"><a href="${contextPath}/${search.link}">${ata:html2Text(search.actId.shortTitle)}</a></h3>
                            <div class="s">
                                <div class="resm">
                                    ${contextPath}/${fn:substring(search.link,0,35)}
                                    <c:if test="${fn:length(search.link)>35}">..</c:if></div>
                                <p>${fn:substring(ata:html2Text(ata:replaceSpecialCharacter(search.description)),0,400)}...</p>
                            </div>
                        </div>

                </c:forEach>
            </div>
            <div class="row well well-sm">
                <div class="col-sm-4">
                    <div class="text-info text-center pagination">
                            ${(p-1)*s+1} to ${((p-1)*s+s)>results.getTotalElements()? results.getTotalElements() : ((p-1)*s+s)} of ${results.getTotalElements()}
                    </div>
                </div>
                <div class="col-sm-8">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li Class="${results.hasPrevious()? '':'disabled hide'}"><a href="${contextPath}/search.html${queryString}&page=${results.previousPageable().getPageNumber()+1}">&laquo;</a></li>

                            <c:set var="initialPage" value="${(p-5)<1 ? 1 : (p-5)}"/>

                            <c:set var="endingPage" value="${9+initialPage}"/>
                            <c:if test="${results.getTotalPages()< endingPage}">
                                <c:set var="endingPage" value="${results.getTotalPages()}"/>
                                <c:set var="initialPage" value="${(endingPage -9)<1? 1: (endingPage -9)}"/>
                            </c:if>
                            <c:forEach begin="${initialPage}" end="${endingPage}" varStatus="loop">

                                    <c:choose>
                                        <c:when test="${p==loop.index}">
                                            <li class="active">
                                             <span>${loop.index} <span class="sr-only">(current)</span></span>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <a href="${contextPath}/search.html${queryString}&page=${loop.index}">${loop.index}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>

                            </c:forEach>
                            <li class="${results.hasNext()? '':'disabled hide'}"><a href="${contextPath}/search.html${queryString}&page=${results.nextPageable().getPageNumber()+1}">&raquo;</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <h3 class="text-danger text-center"><spring:message code="website.noResult.txt"/></h3>
        </c:otherwise>
    </c:choose>
