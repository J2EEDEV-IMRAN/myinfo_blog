<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="rand"><%= java.lang.Math.random() * java.lang.Math.random() %></c:set>
<div class="panel panel-success">
    <!-- Default panel contents -->
 	<div class="panel-heading text-center text-primary">
 		User Log
 	</div>
    <div class="panel-body">
  		<div class="table-responsive">
			<table id="datatable_for_volumeHistory" class="datatable table table-striped table-bordered dt-responsive nowrap compact stripe"
				data-title="User Log List"
				data-deferRender="false"
				data-stateSave="false"
				data-responsive="{&quot;details&quot;:false}"
				data-page-length="10"
				data-lengthMenu="[ [10, 20, 50, 100,10000], [10, 20, 50, 100, &quot;All&quot;] ]"
				data-order="[[ 1, &quot;asc&quot; ]]"
				data-info="true"
				data-ordering="true"
				data-paging="true"
				data-scrollY="&quot;200px&quot;"
				data-searching="true"
				data-ajax-url="<c:url value="/admin/UserLog/data?${_csrf.parameterName}=${_csrf.token}"/>"
				data-dom="<'row toolbar'><'row'<'col-sm-3'l><'col-sm-5 text-center'B><'col-sm-4'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>"
				buttons="copy,csv,excel,pdf,print,reload,resetColReorder,colvis"
				data-fixedHeader="true"
				data-colReorder="true"
				width="100%"
				data-columns-sequence="index,actions,tableName,file,modifiedBy,modifiedDate"
			>
				<thead>
					<th name="index" value="" type="index" data-priority="1" data-visible="false" data-orderable="false" data-searchable="false">SL No</th>
					<th name="actions" value="actions" data-priority="2">Actions</th>
					<th name="tableName" value="tableName" data-priority="3">Table Name</th>
					<th name="file" value="file" data-priority="4">Content Id</th>
					<th name="modifiedBy" value="modifiedBy" data-priority="5">Modified By</th>
					<th name="modifiedDate" value="modifiedDate" data-priority="15">Modification Date</th>
				</thead>
			</table>
		</div>

	</div>
</div>
