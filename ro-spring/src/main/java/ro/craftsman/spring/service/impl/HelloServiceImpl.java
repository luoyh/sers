package ro.craftsman.spring.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
@Service("helloService")
public class HelloServiceImpl implements HelloService {
	private static Logger log = LoggerFactory.getLogger(HelloServiceImpl.class);
	
	private String name;
	
	@Autowired
	private HandleService handleService;
	
	@PostConstructor
	public void init() {
		this.name = "John";
	}
	
	@Override
	public void hello(HelloBean helloBean) {
		log.info("hello, {}", name);
		handleService.execute(helloBean);
	}

	@Override
	public String dofn(String msg) {
		System.err.println(msg);
		return "hello " + msg;
	}
	
}
