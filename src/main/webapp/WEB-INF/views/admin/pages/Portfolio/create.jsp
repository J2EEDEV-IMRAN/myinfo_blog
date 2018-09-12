<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading  text-center text-primary">Porotfolio<span class="pull-right"><a href="#Portfolio/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a></span></div>
    <div class="panel-body">
		<form:form method="post" role="form" modelAttribute="portfolio" action="${contextPath}/admin/portfolio${action}?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal" data-validation="true" data-ajax-submit="true" novalidate="novalidate">

			<spring:bind path="title">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputTitle" class="col-sm-2 control-label">Title</label>
					<div class="col-sm-9">
						<form:input type="text" class="form-control"
									data-validation="trim|required|min_length[1]|max_length[255]" id="inputTitle"
									path="title" placeholder="Title"/>
						<form:errors path="title" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>

			<spring:bind path="about">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputAbout" class="col-sm-2 control-label">About</label>
					<div class="col-sm-9">
						<form:input type="text" class="form-control"
									data-validation="trim|required|min_length[1]|max_length[255]" id="inputAbout"
									path="about" placeholder="About"/>
						<form:errors path="about" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="description">
			<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				<label for="inputDescription" class="col-sm-2 control-label">Description</label>
				<div class="col-sm-8">
					<form:textarea class="form-control richtext" data-validation="trim" id="inputDescription" path="description"
								   placeholder="Description"/>
					<form:errors path="description" cssClass="help-block text-danger" element="span"/>
				</div>
			</div>
		</spring:bind>
			<spring:bind path="portFolioImage">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputPortFolioImage" class="col-sm-2 control-label">Portfolio Image</label>
					<div class="col-sm-9">
						<label class="btn btn-default btn-file">
							Browse <input type="file" class="form-control"
										  data-validation="trim|file_allowed_type[jpeg,jpg,png,doc,docx,pdf,ppt,pptx,csv,xls,xls,zip,mp3,mp4,flv]|min_length[1]|max_length[255]"
										  id="inputPortFolioImage" name="portFolioImageFile"
										  placeholder="Portfolio Image" multiple/>

						</label>
						<form:errors path="portFolioImage" cssClass="help-block text-danger" element="span"/>

					</div>
				</div>
			</spring:bind>
			<spring:bind path="topic">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputTopic" class="col-sm-2 control-label">Topic</label>
					<div class="col-sm-9" style="width: 973px;">
						<form:select class="form-control selectpicker" data-selected="${title}"
									 data-itemLabel="title"
									 data-itemValue="id"
									 data-validation="trim"
									 path="topic" id="inputTopic">
							<form:option value="0"> --SELECT--</form:option>
							<form:option value="java"> JAVA</form:option>
							<form:option value="php"> PHP</form:option>
							<form:option value="ux"> UX/UI</form:option>
						</form:select>
						<form:errors path="title" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="link">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputTitle" class="col-sm-2 control-label">Link</label>
					<div class="col-sm-9">
						<form:input type="text" class="form-control"
									data-validation="trim|required|min_length[1]|max_length[255]" id="inputLink"
									path="link" placeholder="Link"/>
						<form:errors path="link" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="publishDate">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputpublishDate" class="col-sm-2 control-label">Publish Date</label>
					<div class="col-sm-9">
						<form:input type="text" class="form-control" data-validation="trim|min_length[1]|max_length[255]"
									id="inputpublishDate" path="publishDate" placeholder="Publish Date"/>
						<form:errors path="publishDate" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="orderNo">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputOrderNo" class="col-sm-2 control-label">Portfolio Order</label>
					<div class="col-sm-9">
						<form:input type="number" class="form-control" data-validation="trim|integer" id="inputOrderNo"
									path="orderNo" placeholder="Order No"/>
						<form:errors path="orderNo" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="isBanglaPortfolio">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputIsBanglaPortfolio" class="col-sm-2 control-label">Is Bangla Portfolio</label>
					<div class="col-sm-9">
						<div class="checkbox-inline">
							<form:checkbox data-validation="trim|is_boolean" id="inputIsBanglaPortfolio" path="isBanglaPortfolio"
										   value="1"/> Is Bangla Portfolio
							<form:errors path="isBanglaPortfolio" cssClass="help-block text-danger" element="span"/>
						</div>
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
		            <a href="#Portfolio/index" role="button" class="btn btn-warning">Cancel</a>
		        </div>
		    </div>
		</form:form>
	</div>
</div>