package me.imran.personalblog.admin.audit;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

/**
 * @author Imran Hossain
 */
@Service
public class BeanUtil implements ApplicationContextAware {

	private static ApplicationContext context;

	//@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		context = applicationContext;
	}

	public static <T> T getBean(Class<T> beanClass) {
		System.out.println("Output test *****************************************************Output test2");
		return context.getBean(beanClass);
	}

}