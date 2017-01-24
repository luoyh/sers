package ro.craftsman.spring;

import ro.craftsman.spring.beans.HelloBean;
import ro.craftsman.spring.context.ApplicationContext;
import ro.craftsman.spring.context.XmlApplicationContext;
import ro.craftsman.spring.service.HandleService;
import ro.craftsman.spring.service.HelloService;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) {
		ApplicationContext ctx = new XmlApplicationContext("beans.xml");

		HelloService helloService = ctx.getBean("helloService");
		HelloBean helloBean = new HelloBean();
		helloBean.setId(88991);
		helloBean.setName("My first IoC like Spring");
		helloService.hello(helloBean);

		System.out.println(helloService);

		HandleService handleService = ctx.getBean("handleService");
		handleService.execute(helloBean);

		System.err.println("=========================");

		HelloService helloService1 = ctx.getBean("helloService");
		HelloBean helloBean1 = new HelloBean();
		helloBean1.setId(99999999);
		helloBean1.setName("My second IoC like Spring");
		helloService1.hello(helloBean1);

		System.out.println(helloService1);

		HandleService handleService1 = ctx.getBean("handleService");
		handleService1.execute(helloBean1);
	}
}
