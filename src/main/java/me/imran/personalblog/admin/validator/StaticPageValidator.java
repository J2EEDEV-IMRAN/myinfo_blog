package me.imran.personalblog.admin.validator;

import me.imran.personalblog.admin.model.StaticPage;
import me.imran.personalblog.admin.repository.StaticPageRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;
/**
 * @author Imran Hossain
 */
@Component
public class StaticPageValidator implements Validator {
	private static final Logger logger        = LoggerFactory.getLogger(StaticPageValidator.class);
	private static final Pattern emailPattern = Pattern.compile("/^([a-z0-9\\+_\\-]+)(\\.[a-z0-9\\+_\\-]+)*@([a-z0-9\\-]+\\.)+[a-z]{2,6}$/i");
	@Autowired
    StaticPageRepository staticPageRepository;
	public boolean supports(Class<?> clazz) {
		return StaticPage.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		StaticPage staticPage = (StaticPage) target;
		
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "field_name", "validation.properties");
		
		//Business validation

		// if(condition){
		// 	errors.rejectValue("field_name","validation.properties");
		// }

		
		if(staticPage.getPageUrl()==null){
			errors.rejectValue("pageUrl","StaticPage.pageUrl.required");
		}
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pageUrl", "StaticPage.pageUrl.required");


		if(staticPage.getPageUrl()!=null && staticPage.getPageUrl().length() >255 ){
			errors.rejectValue("pageUrl","StaticPage.pageUrl.max_length");
		}

		if(staticPage.getPageTitleEnglish()==null){
			errors.rejectValue("pageTitleEnglish","StaticPage.pageTitleEnglish.required");
		}
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pageTitleEnglish", "StaticPage.pageTitleEnglish.required");


		if(staticPage.getPageTitleEnglish()!=null && staticPage.getPageTitleEnglish().length() >255 ){
			errors.rejectValue("pageTitleEnglish","StaticPage.pageTitleEnglish.max_length");
		}

		if(staticPage.getPageTitleBangla()==null){
			errors.rejectValue("pageTitleBangla","StaticPage.pageTitleBangla.required");
		}
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pageTitleBangla", "StaticPage.pageTitleBangla.required");


		if(staticPage.getPageTitleBangla()!=null && staticPage.getPageTitleBangla().length() >255 ){
			errors.rejectValue("pageTitleBangla","StaticPage.pageTitleBangla.max_length");
		}

		if(staticPage.getStatus()==null){
			errors.rejectValue("status","StaticPage.status.required");
		}
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "status", "StaticPage.status.required");

		
		
		
	}
}
