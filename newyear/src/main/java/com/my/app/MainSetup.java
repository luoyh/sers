package com.my.app;

import org.nutz.dao.Dao;
import org.nutz.dao.util.Daos;
import org.nutz.ioc.Ioc;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

/**
 * 
 * @author luoyh
 * @date Nov 1, 2016
 */
public class MainSetup implements Setup {

	@Override
	public void destroy(NutConfig arg0) {
		
	}

	@Override
	public void init(NutConfig cnf) {
		Ioc ioc = cnf.getIoc();
		Dao dao = ioc.get(Dao.class);
		Daos.createTablesInPackage(dao, "com.my.app.entity", false);
	}

}
