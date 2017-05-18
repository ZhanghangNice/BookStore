package com.zh.bean;

public class MessageBean {
	private Integer mid;
	private String  mdate;
	private String  message;
	private String  bookid;
	private Integer userid;
	private Integer isbuy;
	private Integer ismessage=0;
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getIsbuy() {
		return isbuy;
	}
	public void setIsbuy(Integer isbuy) {
		this.isbuy = isbuy;
	}
	public Integer getIsmessage() {
		return ismessage;
	}
	public void setIsmessage(Integer ismessage) {
		this.ismessage = ismessage;
	}
	
}
