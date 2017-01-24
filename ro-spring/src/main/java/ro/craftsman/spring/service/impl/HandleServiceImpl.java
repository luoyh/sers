package ro.craftsman.spring.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ro.craftsman.spring.annotations.Service;
import ro.craftsman.spring.beans.HelloBean;
import ro.craftsman.spring.service.HandleService;

/**
 * 
 * @author luoyh
 * @date Jan 23, 2017
 */
@Service("handleService")
public class HandleServiceImpl implements HandleService {
	
	private static Logger log = LoggerFactory.getLogger(HandleServiceImpl.class);

	public void execute(HelloBean helloBean) {
		log.info("{}", helloBean);
	}

}
