package ro.craftsman.spring.service;

import ro.craftsman.spring.beans.HelloBean;

/**
 * 
 * @author luoyh
 * @date Jan 23, 2017
 */
public interface HelloService {
	
	void hello(HelloBean helloBean);
	
	String dofn(String msg);

}
