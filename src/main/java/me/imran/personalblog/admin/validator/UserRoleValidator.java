/*
package me.imran.personalblog.admin.validator;
import me.imran.personalblog.admin.repository.UserRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.regex.Pattern;
*/
/**
 * @author Imran Hossain
 *//*

@Component
public class UserRoleValidator implements Validator {
	private static final Logger logger        = LoggerFactory.getLogger(UserRoleValidator.class);
	private static final Pattern emailPattern = Pattern.compile("/^([a-z0-9\\+_\\-]+)(\\.[a-z0-9\\+_\\-]+)*@([a-z0-9\\-]+\\.)+[a-z]{2,6}$/i");
	@Autowired
    UserRoleRepository userRoleRepository;
	public boolean supports(Class<?> clazz) {
		return UserRole.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		UserRole userRole = (UserRole) target;

		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "field_name", "validation.properties");

		//Business validation

		// if(condition){
		// 	errors.rejectValue("field_name","validation.properties");
		// }


		if(userRole.getUserId().getId()==0){
			errors.rejectValue("userId.id","UserRole.userId.required");
		}


		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userId.id", "UserRole.userId.required");


		if(userRoleRepository.findByRoleIdAndUserId(userRole.getRoleId(),userRole.getUserId())!=null && userRole.getId()!=userRoleRepository.findByRoleIdAndUserId(userRole.getRoleId(),userRole.getUserId()).getId()){

			errors.rejectValue("roleId.id","UserRole.RoleIdAndUserId.group_unique");


			errors.rejectValue("userId.id","UserRole.RoleIdAndUserId.group_unique");

		}

		if(userRole.getRoleId().getId()==0){
			errors.rejectValue("roleId.id","UserRole.roleId.required");
		}


		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "roleId.id", "UserRole.roleId.required");




	}
}
*/
