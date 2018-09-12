<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading  text-center text-primary">Comment<span class="pull-right"><a href="#Comment/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a></span></div>
    <div class="panel-body">
		<form:form method="post" role="form" modelAttribute="comment" action="${contextPath}/admin/Comment${action}?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal" data-validation="true" data-ajax-submit="true" novalidate="novalidate">
			<spring:bind path="postId.id">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputpostid.id" class="col-sm-2 control-label">Category</label>
					<div class="col-sm-9" style="width: 973px;">
						<form:select class="form-control selectpicker" data-selected="${comment.postId.id}"
									 data-itemLabel="postId"
									 data-live-search="true" data-itemValue="id"
									 data-validation="trim|is_exist[PostId.id]|integer"
									 path="postId.id" id="inputpostid.id">
							<form:option value="0"> --SELECT--</form:option>
							<form:options items="${PostList}" itemLabel="postTitle" itemValue="id"></form:options>
						</form:select>
						<form:errors path="postId.id" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="name">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputname" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-9">
						<form:input type="text" class="form-control" data-validation="trim|min_length[1]|max_length[255]"
									id="inputname" path="name" placeholder="Name"/>
						<form:errors path="name" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="email">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputemail" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-9">
						<form:input type="text" class="form-control" data-validation="trim|min_length[1]|max_length[255]"
									id="inputemail" path="email" placeholder="Email"/>
						<form:errors path="email" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="comment">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputcomment" class="col-sm-2 control-label">Comment</label>
					<div class="col-sm-9">
						<form:textarea class="form-control richtext" data-validation="trim" id="inputcomment"
									   path="comment" placeholder="Comment"/>
						<form:errors path="comment" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>

			<spring:bind path="status">
       	        	<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
       	   	    	<label for="inputstatus" class="col-sm-2 control-label">Status</label>
				    	<div class="col-sm-9">
				    		<div class="checkbox-inline">
				      			<form:checkbox data-validation="trim|required|is_boolean" id="inputstatus" path="status"  value="1" /> Status
				      			<form:errors path="status" cssClass="help-block text-danger" element="span" />
							</div>
				    	</div>
				  	</div>
				  	</spring:bind>
		    <div class="form-group">
		        <div class="col-sm-offset-4 col-sm-5">
		            <button type="submit" class="btn btn-primary"> &nbsp; Save &nbsp; </button> &nbsp; &nbsp; 
		            <a href="#Comment/index" role="button" class="btn btn-warning">Cancel</a>
		        </div>
		    </div>
		</form:form>
	</div>
</div>