package me.imran.personalblog.admin.validator;

import me.imran.personalblog.admin.model.FeedBack;
import me.imran.personalblog.admin.repository.FeedBackRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Component
public class FeedBackValidator implements Validator {
	private static final Logger logger        = LoggerFactory.getLogger(FeedBackValidator.class);
	private static final Pattern emailPattern = Pattern.compile("/^([a-z0-9\\+_\\-]+)(\\.[a-z0-9\\+_\\-]+)*@([a-z0-9\\-]+\\.)+[a-z]{2,6}$/i");
	@Autowired
    FeedBackRepository feedBackRepository;
	public boolean supports(Class<?> clazz) {
		return FeedBack.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		FeedBack feedBack = (FeedBack) target;
		
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "field_name", "validation.properties");
		
		//Business validation

		// if(condition){
		// 	errors.rejectValue("field_name","validation.properties");
		// }

		
		if(feedBack.getName()==null){
			errors.rejectValue("name","FeedBack.name.required");
		}
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "FeedBack.name.required");


		if(feedBack.getName()!=null && feedBack.getName().length() >255 ){
			errors.rejectValue("name","FeedBack.name.max_length");
		}



		if(feedBack.getEmail()==null){
			errors.rejectValue("email","FeedBack.email.required");
		}

		logger.info(feedBack.getEmail()+"Ataur ");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "FeedBack.email.required");

		
		
		
	}
}
