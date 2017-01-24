package com.my.app.entity;

import java.util.Date;

import org.nutz.dao.entity.annotation.ColDefine;
import org.nutz.dao.entity.annotation.ColType;
import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Index;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.dao.entity.annotation.TableIndexes;
import org.nutz.json.Json;

/**
 * 
 * @author luoyh
 * @date Nov 1, 2016
 */
@Table("my_db_newyear")
@TableIndexes({
	@Index(name = "unq_phone", fields = "phone", unique = true)
})
public class Member {
	
	@Id
	private long id;
	
	@Column
	@ColDefine(notNull = true, width = 32)
	private String phone;
	
	@Column
	@ColDefine(notNull = true, type = ColType.DATETIME)
	private Date rawTime;
	
	@Column
	@ColDefine(notNull = true, width = 32)
	private String val;
	
	
	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Date getRawTime() {
		return rawTime;
	}


	public void setRawTime(Date rawTime) {
		this.rawTime = rawTime;
	}


	public String getVal() {
		return val;
	}


	public void setVal(String val) {
		this.val = val;
	}


	public String toString() {
		return Json.toJson(this);
	}
	

}
