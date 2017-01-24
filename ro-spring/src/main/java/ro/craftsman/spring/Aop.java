package ro.craftsman.spring;

import ro.craftsman.spring.aop.AopProxy;
import ro.craftsman.spring.beans.HelloBean;
import ro.craftsman.spring.context.ApplicationContext;
import ro.craftsman.spring.context.ScanApplicationContext;
import ro.craftsman.spring.service.HandleService;
import ro.craftsman.spring.service.HelloService;

/**
 * 
 * @author luoyh
 * @date Jan 24, 2017
 */
public class Aop {

	public static void main(String[] args) {
		ApplicationContext ctx = new ScanApplicationContext("ro.craftsman.spring.service");
		
		HelloService helloService = AopProxy.getBean(ctx, "helloService");

		HelloBean helloBean = new HelloBean();
		helloBean.setId(88991);
		helloBean.setName("My first IoC like Spring");
		helloService.hello(helloBean);

		System.out.println(helloService);

		HandleService handleService = ctx.getBean("handleService");
		handleService.execute(helloBean);

		System.err.println("=========================");

		HelloService helloService1 = AopProxy.getBean(ctx, "helloService");
		HelloBean helloBean1 = new HelloBean();
		helloBean1.setId(99999999);
		helloBean1.setName("My second IoC like Spring");
		helloService1.hello(helloBean1);

		System.out.println(helloService1);

		HandleService handleService1 = ctx.getBean("handleService");
		handleService1.execute(helloBean1);
	}

}
