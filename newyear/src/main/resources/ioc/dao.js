var ioc = {
        dataSource : {
           // type : "org.apache.tomcat.jdbc.pool.DataSource",
        	type: 'com.alibaba.druid.pool.DruidDataSource',
            events : {
            },
            fields : {
                url : "jdbc:mysql://127.0.0.1:3306/${dbname}?useUnicode=true&characterEncoding=UTF8&serverTimezone=GMT-8",
                username : "${dbuser}",
                password : "${dbpass}",
                testWhileIdle : true,
                validationQuery : "select 1" , // Oracle的话需要改一下
                maxActive : 100,
                driverClass: 'com.mysql.cj.jdbc.Driver'
            }
        },
        dao : {
            type : "org.nutz.dao.impl.NutDao",
            args : [{refer:"dataSource"}]
        }
};
