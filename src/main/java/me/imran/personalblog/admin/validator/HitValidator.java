package me.imran.personalblog.admin.validator;

import me.imran.personalblog.admin.model.Hit;
import me.imran.personalblog.admin.repository.HitRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;
/**
 * @author Imran Hossain
 */
@Component
public class HitValidator implements Validator {
	private static final Logger logger        = LoggerFactory.getLogger(HitValidator.class);
	private static final Pattern emailPattern = Pattern.compile("/^([a-z0-9\\+_\\-]+)(\\.[a-z0-9\\+_\\-]+)*@([a-z0-9\\-]+\\.)+[a-z]{2,6}$/i");
	@Autowired
    HitRepository hitRepository;
	public boolean supports(Class<?> clazz) {
		return Hit.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		Hit hit = (Hit) target;
		
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "field_name", "validation.properties");
		
		//Business validation

		// if(condition){
		// 	errors.rejectValue("field_name","validation.properties");
		// }

		

		if(hit.getIp()!=null && hit.getIp().length() >255 ){
			errors.rejectValue("ip","Hit.ip.max_length");
		}


		if(hit.getBrowser()!=null && hit.getBrowser().length() >255 ){
			errors.rejectValue("browser","Hit.browser.max_length");
		}


		if(hit.getBrowserVersion()!=null && hit.getBrowserVersion().length() >255 ){
			errors.rejectValue("browserVersion","Hit.browserVersion.max_length");
		}


		if(hit.getOperatingSystem()!=null && hit.getOperatingSystem().length() >255 ){
			errors.rejectValue("operatingSystem","Hit.operatingSystem.max_length");
		}


		if(hit.getResource()!=null && hit.getResource().length() >255 ){
			errors.rejectValue("resource","Hit.resource.max_length");
		}


		if(hit.getType()!=null && hit.getType().length() >255 ){
			errors.rejectValue("type","Hit.type.max_length");
		}

		
		
		
	}
}
