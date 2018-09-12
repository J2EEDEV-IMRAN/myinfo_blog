package me.imran.personalblog.admin.validator;

import me.imran.personalblog.admin.model.Portfolio;
import me.imran.personalblog.admin.repository.PortFolioRepository;
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
public class PortFolioValidator implements Validator {
	private static final Logger logger        = LoggerFactory.getLogger(PortFolioValidator.class);
	private static final Pattern emailPattern = Pattern.compile("/^([a-z0-9\\+_\\-]+)(\\.[a-z0-9\\+_\\-]+)*@([a-z0-9\\-]+\\.)+[a-z]{2,6}$/i");

	@Autowired
    PortFolioRepository portFolioRepository;

	public boolean supports(Class<?> clazz) {
		return Portfolio.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		Portfolio portFolio = (Portfolio) target;

		
		if(portFolio.getTitle()==null){
			errors.rejectValue("title","PortFolio.title.required");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "PortFolio.title.required");

	/*	Portfolio portfolio= portFolioRepository.findOneByTitle(portFolio.getTitle());
		if(portfolio.equals(null)){
			errors.rejectValue("title","PortFolio.title.duplicate");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "PortFolio.title.duplicate");*/
	}
}
