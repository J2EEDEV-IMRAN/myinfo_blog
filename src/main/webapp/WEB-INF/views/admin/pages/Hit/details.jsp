<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading text-center text-primary">Hit
    <span class="pull-left">
    	 <a href="#Hit/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a>
    </span>
    </div>
    <div class="panel-body table-responsive">
        <table class="table table-condensed">
            
					<tr class="">
					<th style="white-space: nowrap;">Ip</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${hit.ip}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Browser</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${hit.browser}</td>
					</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Browser Version</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${hit.browserVersion}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Operating System</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${hit.operatingSystem}</td>
					</tr>
				
    				<tr class="">
    				<th style="white-space: nowrap;width:1px;">Date</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${hit.date}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Resource</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${hit.resource}</td>
					</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Query</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${hit.query}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Type</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${hit.type}</td>
					</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Created By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${hit.createdBy}</td>
					</tr>
				
    				<tr class="active">
    				<th style="white-space: nowrap;width:1px;">Created At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${hit.createdAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Updated By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${hit.updatedBy}</td>
					</tr>
				
    				<tr class="active">
    				<th style="white-space: nowrap;width:1px;">Updated At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${hit.updatedAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
        </table>
	</div>
</div>