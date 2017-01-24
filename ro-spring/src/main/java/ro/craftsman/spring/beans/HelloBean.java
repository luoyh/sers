package ro.craftsman.spring.beans;

import java.util.Date;

/**
 * 
 * @author luoyh
 * @date Jan 23, 2017
 */
public class HelloBean {

	private long id;
	private String name;
	private Date gmtCreated;
	private Date gmtModified;

	@Override
	public String toString() {
		return "[id:" + id +
				",name:" + name +
				",created:" + gmtCreated +
				",modified:" + gmtModified + "]";
	}
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getGmtCreated() {
		return gmtCreated;
	}

	public void setGmtCreated(Date gmtCreated) {
		this.gmtCreated = gmtCreated;
	}

	public Date getGmtModified() {
		return gmtModified;
	}

	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}

}
