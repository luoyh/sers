package com.edu.roy.wx.comm;

public class HttpResult {
	
	public static final int OK = 200;
	public static final int ERR = 300;
	
	private int code;
	private String msg;
	private Object data;
	
	public HttpResult() {
		this(ERR);
	}
	
	public HttpResult(int code) {
		this(code, null);
	}
	
	public HttpResult(int code, String msg) {
		this(code, msg, null);
	}
	
	public HttpResult(int code, String msg, Object data) {
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}

}
