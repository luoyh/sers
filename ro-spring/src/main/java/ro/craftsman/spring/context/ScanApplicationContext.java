package ro.craftsman.spring.context;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URL;

import ro.craftsman.spring.BeanFactory;
import ro.craftsman.spring.annotations.Autowired;
import ro.craftsman.spring.annotations.PostConstructor;
import ro.craftsman.spring.annotations.Service;
import ro.craftsman.spring.ioc.BeanDefinition;

/**
 * 
 * @author luoyh
 * @date Jan 24, 2017
 */
@SuppressWarnings("unchecked")
public class ScanApplicationContext implements ApplicationContext {
	
	public ScanApplicationContext(String packages) {
		scan(packages);
	}

	@Override
	public <T> T getBean(String name) {
		BeanDefinition beanDef = register.get(name);
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
						Autowired autowired = field.getDeclaredAnnotation(Autowired.class);
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

	private void scan(String packageName) {
		URL url = BeanFactory.class.getClassLoader().getResource(packageName.replaceAll("\\.", "/"));
		File file = new File(url.getPath());
		try {
			scan(packageName, file, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void scan(String packageName, File file, String prefix) throws Exception {
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			for (File f : files) {
				scan(packageName, f, null == prefix ? "" : (prefix + "." + file.getName()));
			}
		} else {
			String name = file.getName();
			if (name.endsWith(".class")) {
				String className = packageName + prefix + "." + name.substring(0, name.indexOf("."));
				Class<?> cls = Class.forName(className);
				Service s = cls.getDeclaredAnnotation(Service.class);
				if (null != s) {
					BeanDefinition def = new BeanDefinition();
					def.setName(s.value());
					def.setClassName(className);
					def.setClazz(cls);
					register.put(s.value(), def);
				}
			}
		}
	}
}
