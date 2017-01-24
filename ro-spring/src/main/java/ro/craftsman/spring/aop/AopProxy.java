package ro.craftsman.spring.aop;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import ro.craftsman.spring.Man;
import ro.craftsman.spring.context.ApplicationContext;
import ro.craftsman.spring.service.HelloService;

/**
 * 
 * @author luoyh
 * @date Jan 24, 2017
 */
@SuppressWarnings("unchecked")
public class AopProxy {
	
	private static final Map<String, Object> CACHE = new ConcurrentHashMap<>();
	
	public static <T> T getBean(ApplicationContext ctx, String name) {
		Object t = CACHE.get(name);
		if (null == t) {
			t = proxyHelloService(ctx.getBean(name));
			CACHE.put(name, t);
		}
		return (T) t;
	}
	
	private static <T> T proxyHelloService(T t) {

		return (T) Proxy.newProxyInstance(Man.class.getClassLoader(), new Class<?>[] { HelloService.class }, new InvocationHandler() {

			@Override
			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				System.err.println("start method : " + method.getName());
				Object result = method.invoke(t, args);
				System.err.println("end method");
				return result;
			}
		});
	}

}
