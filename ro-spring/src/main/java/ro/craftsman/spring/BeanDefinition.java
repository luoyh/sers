package ro.craftsman.spring;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author luoyh
 * @date Jan 23, 2017
 */
@SuppressWarnings("rawtypes")
public class BeanDefinition {
	
	private String name;
	private Class clazz;
	private String className;
	private List<PropertyValue> propertyValues = new ArrayList<>();
	private Object bean;
	
	public Object getBean() {
		return bean;
	}
	public void setBean(Object bean) {
		this.bean = bean;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Class getClazz() {
		return clazz;
	}
	public void setClazz(Class clazz) {
		this.clazz = clazz;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
//		try {
//			this.clazz = Class.forName(className);
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		}
	}
	public void putValue(PropertyValue value) {
		propertyValues.add(value);
	}

	public List<PropertyValue> getPropertyValues() {
		return propertyValues;
	}
	
}
