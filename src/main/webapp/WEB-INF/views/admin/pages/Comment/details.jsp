<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading text-center text-primary">Comment<span class="pull-right"><a href="#Comment/edit/${comment.id}" role="button"><i class="fa fa-arrow-right"></i> Edit</a></span>
    <span class="pull-left">
    	 <a href="#Comment/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a>
    </span>
    </div>
    <div class="panel-body table-responsive">
        <table class="table table-condensed">
            
					<tr class="">
					<th style="white-space: nowrap;">Post id</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${comment.postId.id}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Name</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${comment.name}</td>
					</tr>

					<tr class="active">
					<th style="white-space: nowrap;">Email</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${comment.email}</td>
					</tr>
			<tr class="active">
				<th style="white-space: nowrap;">Comment</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${comment.comment}</td>
			</tr>


					<tr class="">
					<th style="white-space: nowrap;">Created By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${comment.createdBy}</td>
					</tr>
				
    				<tr class="">
    				<th style="white-space: nowrap;width:1px;">Created At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${comment.createdAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Updated By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${comment.updatedBy}</td>
					</tr>
				
    				<tr class="">
    				<th style="white-space: nowrap;width:1px;">Updated At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${comment.updatedAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
        </table>
	</div>
</div>