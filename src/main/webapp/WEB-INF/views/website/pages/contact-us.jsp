<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script>
    function onSubmit(token) {
        document.getElementById("contactUsForm").submit();
    }
</script>

<div class="row well well-sm" id="pageContent">
    <div class="heading heading-v2 margin-bottom-40">
        <h2>Contact Us</h2>
    </div>
       <div class="row">
           <div class="col-sm-5">
                <p>
                    Md. Israil Hossain<br/>
                    Additional Secretary<br/>
                    Legislative and Parliamentary Affairs Division<br/>
                    Ministry of Law, Justice and Parliamentary Affairs<br/>
                    Bangladesh Secretariat, Dhaka - 1000, Bangladesh.<br/>
                    Phone : +88-02-9563001<br/>
                    Fax : 7166236<br/>
                    E-mail : <a href="mailto:israil@legislativediv.gov.bd" target="_top">israil@legislativediv.gov.bd</a><br/>
                </p>
           </div>
           <div class="col-sm-7">
               <form:form cssClass="form-horizontal" id="contactUsForm" method="post" role="form" modelAttribute="feedBack" action="${contextPath}/contact-us.html?${_csrf.parameterName}=${_csrf.token}"  data-validation="true" data-ajax-submit="true" novalidate="novalidate">
                   <spring:bind path="name">
                       <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
                           <label for="inputname" class="col-sm-2 control-label">Name</label>
                           <div class="col-sm-5">
                               <form:input type="text" class="form-control" data-validation="trim|required|min_length[1]|max_length[255]" id="inputname" path="name"  placeholder="Name"/>
                               <form:errors path="name" cssClass="help-block text-danger" element="span" />
                           </div>
                       </div>
                   </spring:bind><spring:bind path="designation">
                   <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
                       <label for="inputdesignation" class="col-sm-2 control-label">Designation</label>
                       <div class="col-sm-5">
                           <form:input type="text" class="form-control" data-validation="trim|min_length[1]|max_length[255]" id="inputdesignation" path="designation"  placeholder="Designation"/>
                           <form:errors path="designation" cssClass="help-block text-danger" element="span" />
                       </div>
                   </div>
               </spring:bind><spring:bind path="email">
                   <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
                       <label for="inputemail" class="col-sm-2 control-label">Email</label>
                       <div class="col-sm-5">
                           <form:input type="email" class="form-control" data-validation="trim|required|valid_email|min_length[1]|max_length[255]" id="inputemail" path="email"  placeholder="Email"/>
                           <form:errors path="email" cssClass="help-block text-danger" element="span" />
                       </div>
                   </div>
               </spring:bind><spring:bind path="phone">
                   <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
                       <label for="inputphone" class="col-sm-2 control-label">Phone</label>
                       <div class="col-sm-5">
                           <form:input type="text" class="form-control" data-validation="trim|valid_bd_phone_no|min_length[1]|max_length[255]" id="inputphone" path="phone"  placeholder="Phone"/>
                           <form:errors path="phone" cssClass="help-block text-danger" element="span" />
                       </div>
                   </div>
               </spring:bind><spring:bind path="message">
                   <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
                       <label for="inputmessage" class="col-sm-2 control-label">Message</label>
                       <div class="col-sm-9">
                           <form:textarea rows="5" class="form-control " data-validation="trim|required" id="inputmessage" path="message"  placeholder="Message"/>
                           <form:errors path="message" cssClass="help-block text-danger" element="span" />
                       </div>
                   </div>
               </spring:bind>
                   <div class="form-group">
                       <label class="col-sm-2"></label>
                       <div class="col-sm-9">
                           <div class="g-recaptcha" data-sitekey="<spring:eval expression="@propertyConfigurer.getProperty('recaptcha.validation.siteKey')" />"></div>
                       </div>
                   </div>
                   <div class="form-group">
                       <div class="col-sm-offset-4 col-sm-5">
                           <button type="submit" class="btn btn-primary"> &nbsp; <spring:message code="website.submit.text"/> &nbsp; </button> &nbsp; &nbsp;
                           <button type="reset" class="btn btn-warning"><spring:message code="website.reset.text"/></button>
                       </div>
                   </div>
               </form:form>
           </div>

       </div>
</div>