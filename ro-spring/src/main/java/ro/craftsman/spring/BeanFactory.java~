package ro.craftsman.spring;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import ro.craftsman.spring.annotations.Autowired;
import ro.craftsman.spring.annotations.PostConstructor;
import ro.craftsman.spring.annotations.Service;
import ro.craftsman.spring.beans.HelloBean;
import ro.craftsman.spring.service.HandleService;
import ro.craftsman.spring.service.HelloService;

/**
 * 
 * @author luoyh
 * @date Jan 23, 2017
 */
@SuppressWarnings({ "unchecked", "rawtypes"})
public class BeanFactory {

	private static final String packs = "ro.craftsman.spring.service";
	
	public static void main(String[] args) throws Exception {
		URL url = BeanFactory.class.getClassLoader().getResource(packs.replaceAll("\\.", "/"));
		File file = new File(url.getPath());
		scan(file, null);
		
		HelloService helloService = getBean("helloService");
		HelloBean helloBean = new HelloBean();
		helloBean.setId(88991);
		helloBean.setName("My first IoC like Spring");
		helloService.hello(helloBean);
		
		System.out.println(helloService);
		
		HandleService handleService = getBean("handleService");
		handleService.execute(helloBean);
		
		
		System.err.println("=========================");
		
		HelloService helloService1 = getBean("helloService");
		HelloBean helloBean1 = new HelloBean();
		helloBean1.setId(99999999);
		helloBean1.setName("My second IoC like Spring");
		helloService1.hello(helloBean1);
		
		System.out.println(helloService1);
		
		HandleService handleService1 = getBean("handleService");
		handleService1.execute(helloBean1);
		
	}
	
	public static void scan(File file, String prefix) throws Exception {
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			for (File f : files) {
				scan(f, null == prefix ? "" : (prefix + "." + file.getName()));
			}
		} else {
			String name = file.getName();
			if (name.endsWith(".class")) {
				String className = packs + prefix + "." + name.substring(0, name.indexOf("."));
				Class cls = Class.forName(className);
				Service s = (Service) cls.getDeclaredAnnotation(Service.class);
				if (null != s) {
					BeanDefinition def = new BeanDefinition();
					def.setName(s.value());
					def.setClassName(className);
					def.setClazz(cls);
					beans.put(s.value(), def);
				}
			}
		}
	}
	
	private static Map<String, BeanDefinition> beans = new HashMap<>();
	
	public void scan() {
		
	}
	
	
	public static <T> T getBean(String name) {
		BeanDefinition beanDef = beans.get(name);
		if (null == beanDef) {
			throw new NullPointerException("Not found class " + name);
		}
		
		Object bean = beanDef.getBean();
		if (null == bean) {
			System.err.println(name + " is null");
			Class<?> clazz = beanDef.getClazz();
			try {
				bean = clazz.newInstance();
				
				Method[] methods = clazz.getDeclaredMethods();
				if (null != methods) {
					for (Method method : methods) {
						if (method.getDeclaredAnnotation(PostConstructor.class) != null) {
							if (method.getParameterCount() > 0) {
								throw new IllegalArgumentException("Use @PostConstructor method can not have argurment:" + method.getName());
							}
							method.invoke(bean);
						}
					}
				}
				
				Field[] fields = clazz.getDeclaredFields();
				if (null != fields) {
					for (Field field : fields) {
						Autowired autowired = field.getAnnotation(Autowired.class);
						if (null != autowired) {
							Object autoBean = getBean(field.getName());
							if (null == autoBean) {
								throw new NullPointerException("Can not autowired " + field.getName());
							}
							field.setAccessible(true);
							field.set(bean, autoBean);
						}
					}
				}
				beanDef.setBean(bean);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return (T) bean;
	}

}
