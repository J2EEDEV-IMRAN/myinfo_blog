<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading  text-center text-primary">Static Page<span class="pull-right"><a href="#StaticPage/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a></span></div>
    <div class="panel-body">
		<form:form method="post" role="form" modelAttribute="staticPage" action="${contextPath}/admin/staticPage${action}?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal" data-validation="true" data-ajax-submit="true" novalidate="novalidate">
		    <spring:bind path="pageUrl">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputpageUrl" class="col-sm-2 control-label">Page Url</label>
				    	<div class="col-sm-9">
				      		<form:input type="url" class="form-control" data-validation="trim|required|min_length[1]|max_length[255]" id="inputpageUrl" path="pageUrl"  placeholder="Page Url"/>
				      		<form:errors path="pageUrl" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	</spring:bind><spring:bind path="pageTitleEnglish">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputpageTitleEnglish" class="col-sm-2 control-label">Page Title English</label>
				    	<div class="col-sm-9">
				      		<form:input type="text" class="form-control" data-validation="trim|required|min_length[1]|max_length[255]" id="inputpageTitleEnglish" path="pageTitleEnglish"  placeholder="Page Title English"/>
				      		<form:errors path="pageTitleEnglish" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	</spring:bind><spring:bind path="pageTitleBangla">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputpageTitleBangla" class="col-sm-2 control-label">Page Title Bangla</label>
				    	<div class="col-sm-9">
				      		<form:input type="text" class="form-control" data-validation="trim|required|min_length[1]|max_length[255]" id="inputpageTitleBangla" path="pageTitleBangla"  placeholder="Page Title Bangla"/>
				      		<form:errors path="pageTitleBangla" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	</spring:bind><spring:bind path="pageContentEnglish">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputpageContentEnglish" class="col-sm-2 control-label">Page Content English</label>
				    	<div class="col-sm-8">
				      		<form:textarea class="form-control richtext" data-validation="trim|required" id="inputpageContentEnglish" path="pageContentEnglish"  placeholder="Page Content English"/>
				      		<form:errors path="pageContentEnglish" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	</spring:bind><spring:bind path="pageContentBangla">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputpageContentBangla" class="col-sm-2 control-label">Page Content Bangla</label>
				    	<div class="col-sm-8">
				      		<form:textarea class="form-control richtext" data-validation="trim|required" id="inputpageContentBangla" path="pageContentBangla"  placeholder="Page Content Bangla"/>
				      		<form:errors path="pageContentBangla" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	</spring:bind><spring:bind path="status">
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
		            <a href="#StaticPage/index" role="button" class="btn btn-warning">Cancel</a> 
		        </div>
		    </div>
		</form:form>
	</div>
</div>