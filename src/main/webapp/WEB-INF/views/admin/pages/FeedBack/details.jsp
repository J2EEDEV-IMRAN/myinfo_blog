<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading text-center text-primary">Feed Back
    <span class="pull-left">
    	 <a href="#FeedBack/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a>
    </span>
    </div>
    <div class="panel-body table-responsive">
        <table class="table table-condensed">
            
					<tr class="">
					<th style="white-space: nowrap;">Name</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${feedBack.name}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Designation</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${feedBack.designation}</td>
					</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Email</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${feedBack.email}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Phone</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${feedBack.phone}</td>
					</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Message</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${feedBack.message}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Created By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${feedBack.createdBy}</td>
					</tr>
				
    				<tr class="">
    				<th style="white-space: nowrap;width:1px;">Created At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${feedBack.createdAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Updated By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${feedBack.updatedBy}</td>
					</tr>
				
    				<tr class="">
    				<th style="white-space: nowrap;width:1px;">Updated At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${feedBack.updatedAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
					</tr>
			<%--<tr class="">--%>
				<%--<th style="white-space: nowrap;width:1px;">Reply</th>--%>
				<%--<th style="white-space:nowrap;width:1px;"> : </th>--%>
				<%--<td>--%>

					<%--<form:form action="${contextPath}/reply" modelAttribute="feedBackReply" data-validation="">--%>
						<%--<table class="table">--%>
							<%--<tr class="">--%>
								<%--<th style="white-space: nowrap;width:1px;">Subject</th>--%>
								<%--<th style="white-space:nowrap;width:1px;"> : </th>--%>
								<%--<td><form:input path="subject"/></td>--%>
							<%--</tr>--%>
							<%--<tr class="">--%>
								<%--<th style="white-space: nowrap;width:1px;">Message</th>--%>
								<%--<th style="white-space:nowrap;width:1px;"> : </th>--%>
								<%--<td><form:textarea path="message"/></td>--%>
							<%--</tr>--%>

							<%--<tr class="">--%>
								<%--<th colspan="2"><input type="hidden" name="feedBackId" value="${feedBack.id}"/></th>--%>
								<%--<td><button type="submit">Reply</button></td>--%>
							<%--</tr>--%>
						<%--</table>--%>
					<%--</form:form>--%>

				<%--</td>--%>
			<%--</tr>--%>
        </table>
	</div>
</div>