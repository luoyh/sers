package com.my.app;

import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.SetupBy;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

/**
 * 
 * @author luoyh
 * @date Nov 1, 2016
 */
@IocBy(type=ComboIocProvider.class, args={"*js", "ioc/",
         "*anno", "com.my.app",
         "*tx", // 事务拦截 aop
         "*async"}) // 异步执行aop
@Modules(scanPackage = true)
@SetupBy(MainSetup.class)
public class MainModule {

}
