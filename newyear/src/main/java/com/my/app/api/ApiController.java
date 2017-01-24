package com.my.app.api;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.util.NutMap;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.GET;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.POST;
import org.nutz.mvc.annotation.Param;

import com.my.app.entity.Member;
import com.my.app.util.UuidUtils;

/**
 * 
 * @author luoyh
 * @date Nov 1, 2016
 */
@IocBean
@At("/api")
public class ApiController {
	
	
	private static int total = 0;
	
	private final String KEY = "20161111.11:11";
	
	@Inject
	private Dao dao;
	//让用户抽红包， 红包里有茅台，金戒指，金项链，0.01-1元现金红包。
	private String[] vals = {
			"红包现金",
			"茅台",
			"金戒指",
			"金项链"
	};
	
	@Ok("jsp:/qrcode")
	@At("/716ecd81870b26cebb8cace3122627d0")
	@GET
	public Object page() {
		return NutMap.NEW().setv("total", total ++);
	}

	@At("/export")
	public void ex(@Param("token") String token, HttpServletResponse response) {
		if(StringUtils.isBlank(token) || !KEY.equals(token)) {
			return;
		}
		List<Member> list = dao.query(Member.class, Cnd.where("1", "=", "1"));
		response.setContentType("application/vnd.openxmlformats;charset=UTF-8");
		//MediaType.MICROSOFT_EXCEL
		response.setHeader("Content-Disposition", "attachment; filename=\"phone.xls\"");
		try (OutputStream out = response.getOutputStream()) {
			StringBuilder sb = new StringBuilder();
			out.write("<html><head><meta charset=\"UTF-8\" /><style>td{mso-number-format:\"\\@\";}</style><table border=\"1\"></head><body><thead><tr><th>编号</th><th>电话</th></tr></thead><tbody>".getBytes("UTF-8"));
			int index = 1;
			for(Member m : list) {
				sb.append("<tr><td>").append(index ++).append("</td><td>").append(m.getPhone()).append("</td></tr>");
			}
			sb.append("</tbody></thead></body></html>");
			out.write(sb.toString().getBytes("UTF-8"));
			out.flush();
		} catch(IOException ex) {
			ex.printStackTrace();
		}
	}
	
	@Ok("json")
	@At("/page")
	@POST
	public NutMap page(@Param("token")String token,@Param("pageNo") Integer pageNo,@Param("pageSize") Integer pageSize) {
		if(StringUtils.isBlank(token)) {
			return NutMap.NEW().setv("code", 300);
		}
		if(!KEY.equals(token)) {
			return NutMap.NEW().setv("code", 300);
		}
		pageNo = null == pageNo ? 1 : pageNo;
		pageSize = null == pageSize ? 100 : pageSize;

		int count = dao.count(Member.class);

		Pager pager = dao.createPager(pageNo, pageSize);
		pager.setRecordCount(count);

		List<Member> list = dao.query(Member.class, Cnd.where("1", "=", 1), pager);
		return NutMap.NEW().setv("code", 200).setv("data", new QueryResult(list, pager));
	}
	
	
	@Ok("json")
	@At("/check/phone")
	@POST
	public NutMap checkPhone(@Param("phone") String phone, HttpServletRequest request, HttpServletResponse response) {
		if(StringUtils.isBlank(phone)) {
			return NutMap.NEW().setv("code", 300).setv("msg", "手机号不能为空");
		}
		Member member = dao.fetch(Member.class, Cnd.where("phone", "=", phone));
		if(null != member) {
			return NutMap.NEW().setv("code", 300).setv("msg", "此手机号已经抽奖");
		}
		
		Cookie[] cookies = request.getCookies();
		if(null != cookies) {
			for(Cookie cookie : cookies) {
				if("MYrpUUID".equals(cookie.getName())) {
					return NutMap.NEW().setv("code", 300).setv("msg", "您已抽奖了");
				}
			}	
		}
		return NutMap.NEW().setv("code", 200);
	}
	
	private String fen2yuan(int val) {
		String v = val + "";
		int len = v.length();
		if(len == 0) {
			return "0.00";
		}
		if(len == 1) {
			return "0.0"+v;
		}
		if(len == 2) {
			return "0."+v;
		}
		return v.substring(0, len - 2) + "." + v.substring(len - 2);
	}
	
	@Ok("json")
	@At("/rand")
	@POST
	public NutMap rand(@Param("phone") String phone, HttpServletResponse response) {
		if(StringUtils.isBlank(phone)) {
			return NutMap.NEW().setv("code", 300).setv("msg", "手机号不能为空");
		}
		Member member = dao.fetch(Member.class, Cnd.where("phone", "=", phone));
		if(null != member) {
			return NutMap.NEW().setv("code", 300).setv("msg", "这个手机号已经抽奖了");
		}
		// rand type
		int randType = new Random().nextInt(4);
		String val = vals[randType];
		NutMap ret = NutMap.NEW().setv("code", 200).setv("type", randType);
		
		if(randType == 0) {
			int v = new Random().nextInt(100);
			ret.setv("val", v);
			val += fen2yuan(v) + "元";
		}
		
		// in db
		try {
			Member m = new Member();
			m.setPhone(phone);
			m.setVal(val);
			m.setRawTime(new Date());
			dao.insert(m);
			ret.setv("product", val);
			Cookie cookie = new Cookie("MYrpUUID", UuidUtils.uuid62String());
			cookie.setHttpOnly(true);
			cookie.setMaxAge(-1);
			cookie.setPath("/");
			response.addCookie(cookie);
		} catch(Exception ex) { // exists
			ret.setv("code", 300).setv("msg", "这个手机号已经抽奖了");
		}

		return ret;
	}
	

}
