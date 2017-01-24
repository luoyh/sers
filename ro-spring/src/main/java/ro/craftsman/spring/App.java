package ro.craftsman.spring;

import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import ro.craftsman.spring.beans.HelloBean;
import ro.craftsman.spring.service.HandleService;
import ro.craftsman.spring.service.HelloService;

/**
 * Hello world!
 *
 */
public class App {
	private static Logger log = LoggerFactory.getLogger(App.class);
	private static Map<String, BeanDefinition> beansMap = new HashMap<>();
	public static void main(String[] args) throws Exception {
		log.info("initialization");
		InputStream in = App.class.getClassLoader().getResourceAsStream("beans.xml");
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse(in);
		
		Element element = doc.getDocumentElement();
		deal(element, null);
		
		in.close();
		
		HelloService helloService = getBean("helloService");
		HelloBean helloBean = new HelloBean();
		helloBean.setId(88991);
		helloBean.setName("My first IoC like Spring");
		helloService.hello(helloBean);
		
		System.out.println(helloService);
		
		HandleService handleService = getBean("handleService");
		handleService.execute(helloBean);
	}

	@SuppressWarnings("unchecked")
	private static <T> T getBean(String name) {
		BeanDefinition beanDefinition = beansMap.get(name);
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
	
	
	private static void deal(Element element, BeanDefinition beanDefinition) {
		String name = element.getNodeName();
		if ("bean".equals(name)) {
			String id = element.getAttribute("id");
			String cls = element.getAttribute("class");
			if (null == beanDefinition) {
				beanDefinition = new BeanDefinition();
				beanDefinition.setClassName(cls);
				beansMap.put(id, beanDefinition);
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
		for (int i = 0; i < nodes.getLength(); i ++) {
			Node node = nodes.item(i);
			if (node instanceof Element) {
				deal((Element) node, beanDefinition);
			}
		}
	}
}
