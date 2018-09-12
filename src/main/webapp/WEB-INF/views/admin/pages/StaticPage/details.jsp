<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading text-center text-primary">Static Page<span class="pull-right"><a href="#StaticPage/edit/${id}" role="button"><i class="fa fa-arrow-right"></i> Edit</a></span>
    <span class="pull-left">
    	 <a href="#StaticPage/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a>
    </span>
    </div>
    <div class="panel-body table-responsive">
        <table class="table table-condensed">
            
					<tr class="">
					<th style="white-space: nowrap;">Page Url</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${staticPage.pageUrl}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Page Title English</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${staticPage.pageTitleEnglish}</td>
					</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Page Title Bangla</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${staticPage.pageTitleBangla}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Page Content English</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${staticPage.pageContentEnglish}</td>
					</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Page Content Bangla</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${staticPage.pageContentBangla}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Status</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${staticPage.status}</td>
					</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Created By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${staticPage.createdBy}</td>
					</tr>
				
    				<tr class="active">
    				<th style="white-space: nowrap;width:1px;">Created At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${staticPage.createdAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Updated By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${staticPage.updatedBy}</td>
					</tr>
				
    				<tr class="active">
    				<th style="white-space: nowrap;width:1px;">Updated At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${staticPage.updatedAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
        </table>
	</div>
</div>