package ro.craftsman.spring.context;

import java.util.HashMap;
import java.util.Map;

import ro.craftsman.spring.ioc.BeanDefinition;

/**
 * 
 * @author luoyh
 * @date Jan 24, 2017
 */
public interface ApplicationContext {
	
	Map<String, BeanDefinition> register = new HashMap<>();
	
	<T> T getBean(String name);

}
