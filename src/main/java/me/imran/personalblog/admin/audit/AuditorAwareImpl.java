package me.imran.personalblog.admin.audit;
/**
 * @author Imran Hossain
 */
import me.imran.personalblog.admin.model.User;
import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.context.SecurityContextHolder;


class AuditorAwareImpl implements AuditorAware<String> {

	// @Override
	public String getCurrentAuditor() {
		System.out.println("Output test *****************************************************Output test2");
		// Can use Spring Security to return currently logged in user
		return ((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();

	}
}
