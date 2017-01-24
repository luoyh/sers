package ro.craftsman.spring.context;

import java.io.InputStream;
import java.lang.reflect.Field;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import ro.craftsman.spring.App;
import ro.craftsman.spring.ioc.BeanDefinition;
import ro.craftsman.spring.ioc.PropertyValue;
import ro.craftsman.spring.ioc.Reference;

/**
 * 
 * @author luoyh
 * @date Jan 24, 2017
 */
public class XmlApplicationContext implements ApplicationContext {
	
	public XmlApplicationContext(String xmlName) {
		load(xmlName);
	}

	@Override
	@SuppressWarnings({ "unchecked" })
	public <T> T getBean(String name) {
		BeanDefinition beanDefinition = register.get(name);
		if (null == beanDefinition) {
			throw new NullPointerException("not found " + name);
		}
		T bean = (T) beanDefinition.getBean();
		if (null == bean) {
			System.err.println(name + " is null");
			Class<?> clazz = beanDefinition.getClazz();
			try {
				if (null == clazz) {
					clazz = Class.forName(beanDefinition.getClassName());
					beanDefinition.setClazz(clazz);
				}
				bean = (T) clazz.newInstance();
				for (PropertyValue value : beanDefinition.getPropertyValues()) {
					String key = value.getName();
					Object vale = value.getValue();
					if (vale instanceof Reference) {
						vale = getBean(((Reference) vale).getName());
					}
					Field field = clazz.getDeclaredField(key);
					field.setAccessible(true);
					field.set(bean, vale);
				}
				beanDefinition.setBean(bean);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return bean;
	}

	private void load(String xmlName) {
		try (InputStream in = App.class.getClassLoader().getResourceAsStream(xmlName)) {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(in);

			Element element = doc.getDocumentElement();
			deal(element, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void deal(Element element, BeanDefinition beanDefinition) {
		String name = element.getNodeName();
		if ("bean".equals(name)) {
			String id = element.getAttribute("id");
			String cls = element.getAttribute("class");
			if (null == beanDefinition) {
				beanDefinition = new BeanDefinition();
				beanDefinition.setClassName(cls);
				register.put(id, beanDefinition);
			}
		}
		if ("property".equals(name)) {
			PropertyValue value = new PropertyValue();
			String ptyName = element.getAttribute("name");
			String ptyValue = element.getAttribute("value");
			value.setName(ptyName);
			if (null == ptyValue || ptyValue.length() == 0) {
				String ref = element.getAttribute("ref");
				Reference reference = new Reference();
				reference.setName(ref);
				value.setValue(reference);
			} else {
				value.setValue(ptyValue);
			}
			beanDefinition.putValue(value);
		}
		NodeList nodes = element.getChildNodes();
		for (int i = 0; i < nodes.getLength(); i++) {
			Node node = nodes.item(i);
			if (node instanceof Element) {
				deal((Element) node, beanDefinition);
			}
		}
	}

}
