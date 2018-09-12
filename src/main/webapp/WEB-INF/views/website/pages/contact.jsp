<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ata" uri="http://ataur.me/jstl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>

<!-- Start contact-page Area -->
<section class="contact-page-area section-gap">
    <div class="container">
        <div class="row">
            <div class="map-wrap" style="width:100%; height: 445px;" id="map">
                <iframe src="https://www.google.com/maps/d/embed?mid=1Ud5DRnqhKifdeHQ0wjENsGgLp_0" width="100%" height="100%"></iframe>
            </div>
            <div class="col-lg-4 d-flex flex-column address-wrap">
                <div class="single-contact-address d-flex flex-row">
                    <div class="icon">
                        <span class="lnr lnr-home"></span>
                    </div>
                    <div class="contact-details">
                        <h5>Dhaka, Bangladesh</h5>
                        <p>

                        </p>
                    </div>
                </div>
                <div class="single-contact-address d-flex flex-row">
                    <div class="icon">
                        <span class="lnr lnr-phone-handset"></span>
                    </div>
                    <div class="contact-details">
                        <h5>+8801743168695</h5>
                        <p>8AM-11PM</p>
                    </div>
                </div>
                <div class="single-contact-address d-flex flex-row">
                    <div class="icon">
                        <span class="lnr lnr-envelope"></span>
                    </div>
                    <div class="contact-details">
                        <h5>explore247h@gmail.com</h5>
                        <p>Send me your query anytime!</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                   <%-- <form:form cssClass="form-horizontal"  method="post" role="form" modelAttribute="feedBack" action="${contextPath}/contact.html${_csrf.parameterName}=${_csrf.token}"  data-validation="true" data-ajax-submit="true" novalidate="novalidate">
                        <div class="row">
                            <div class="col-lg-6 form-group">
                                <spring:bind path="name">
                                    <form:input id="inputname" path="name"  name="name" placeholder="Enter your name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" required="" type="text" class="common-input form-control " data-validation="trim|required|min_length[1]|max_length[255]"  />
                                </spring:bind>
                                  <br>
                                <spring:bind path="email">
                                    <form:input name="email" placeholder="Enter email address" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'"  type="email" class="common-input mb-20 form-control" data-validation="trim|required|valid_email|min_length[1]|max_length[255]" id="inputemail" path="email" />
                                </spring:bind>

                                <spring:bind path="subject">
                                    <form:input name="subject" placeholder="Enter subject" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter subject'" id="inputsubject" path="subject"  required="" type="text" class="common-input mb-20 form-control" data-validation="trim|required|min_length[1]|max_length[255]"  />
                                </spring:bind>

                            </div>
                            <div class="col-lg-6 form-group" style="padding-left: 22px !important;">
                                <spring:bind path="message">
                                    <form:textarea rows="5" class="common-textarea form-control " data-validation="trim|required" id="inputmessage" path="message" name="message" placeholder="Enter Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Messege'" required=""/>
                                </spring:bind>
                            </div>

                            <div class="col-lg-12">
                                <div class="alert-msg" style="text-align: left;"></div>
                                <button class="genric-btn primary" style="float: right;">Send Message</button>
                                <button type="reset" style="float: right;padding-right: 4px;" class="btn-warning genric-btn">Reset</button>
                            </div>
                        </div>
                    </form:form>--%>

                       <form:form class="form-area contact-form text-right" role="form" modelAttribute="feedBack"  action="${contextPath}/mcontact.html?${_csrf.parameterName}=${_csrf.token}" method="POST"  data-ajax-submit="true">
                           <div class="row">
                               <div class="col-lg-6 form-group">
                                   <spring:bind path="name">
                                       <form:input id="inputname" path="name"  name="name" placeholder="Enter your name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" required="" type="text" class="common-input form-control " data-validation="trim|required|min_length[1]|max_length[255]"  />
                                       <form:errors path="name" cssClass="help-block text-danger" element="span" />
                                   </spring:bind>
                                   <br/>
                                   <spring:bind path="email">
                                       <form:input name="email" placeholder="Enter email address" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'"  type="email" class="common-input mb-20 form-control" data-validation="trim|required|valid_email|min_length[1]|max_length[255]" id="inputemail" path="email" />
                                       <form:errors path="email" cssClass="help-block text-danger" element="span" />
                                   </spring:bind>

                                   <spring:bind path="subject">
                                       <form:input name="subject" placeholder="Enter subject" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter subject'" id="inputsubject" path="subject"  required="" type="text" class="common-input mb-20 form-control" data-validation="trim|required|min_length[1]|max_length[255]"  />
                                       <form:errors path="subject" cssClass="help-block text-danger" element="span" />
                                   </spring:bind>

                               </div>
                               <div class="col-lg-6 form-group">
                                   <spring:bind path="message">
                                       <form:textarea rows="5" class="common-textarea form-control " data-validation="trim|required" id="inputmessage" path="message" name="message" placeholder="Enter Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Messege'" required=""/>       <form:errors path="message" cssClass="help-block text-danger" element="span" />
                                   </spring:bind>
                               </div>
                               <div class="col-lg-12">
                                   <div class="alert-msg" style="text-align: left;"></div>
                                   <div class="col-md-10"><button class="genric-btn primary" style="float: right;">Send Message</button></div>
                                   <div class="col-md-2 c-contact-reset-btn"><button type="reset" class="genric-btn primary">Reset</button></div>
                               </div>
                           </div>
                       </form:form>


            </div>
        </div>
    </div>
</section>
<!-- End contact-page Area -->

</div>