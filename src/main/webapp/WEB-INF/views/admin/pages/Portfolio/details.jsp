<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading text-center text-primary">Port Folio<span class="pull-right"><a href="#Portfolio/edit/${portfolio.id}" role="button"><i class="fa fa-arrow-right"></i> Edit</a></span>
    <span class="pull-left">
    	 <a href="#Portfolio/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a>
    </span>
    </div>
    <div class="panel-body table-responsive">
        <table class="table table-condensed">
            
					<tr class="">
					<th style="white-space: nowrap;">Portfolio Title</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${portfolio.title}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Portfolio About</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${portfolio.about}</td>
					</tr>

					<tr class="active">
					<th style="white-space: nowrap;">Portfolio Decription</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${portfolio.description}</td>
					</tr>
			<tr class="active">
				<th style="white-space: nowrap;">Portfolio Image</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${portfolio.portFolioImage}</td>
			</tr>
			<tr class="active">
				<th style="white-space: nowrap;">Portfolio Topic</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${portfolio.topic}</td>
			</tr>
			<tr class="active">
				<th style="white-space: nowrap;">Portfolio Publish Date</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${portfolio.publishDate}</td>
			</tr>

			<tr class="active">
				<th style="white-space: nowrap;">Portfolio Order</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${portfolio.orderNo}</td>
			</tr>
			<tr class="active">
				<th style="white-space: nowrap;">Is Bangla Portfolio</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${portfolio.isBanglaPortfolio}</td>
			</tr>
			<tr class="active">
				<th style="white-space: nowrap;">Status</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${portfolio.status}</td>
			</tr>
					<tr class="">
					<th style="white-space: nowrap;">Created By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${portfolio.createdBy}</td>
					</tr>
				
    				<tr class="">
    				<th style="white-space: nowrap;width:1px;">Created At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${portfolio.createdAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Updated By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${portfolio.updatedBy}</td>
					</tr>
				
    				<tr class="">
    				<th style="white-space: nowrap;width:1px;">Updated At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${portfolio.updatedAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
        </table>
	</div>
</div>