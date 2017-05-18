package com.zh.bean;

public class OrderformBean {
	private  Integer  id;
	private  String   orderid;
	private  Integer  userid;
	private  String   bookid;
	private  Integer  quantity;
	private  String   ordertime;
	private  String   receiver;    //收货人
	private  String   address;	   //收货地址
	private  String   courier;	   //送货员
	private  String   contact;	   //联系电话
	private  String   orderremark;  //备注
	private  String   bookimage;
	private  String   bookname;
	private  Double   unitprice;
	private  String   username;	
	private  String   pay;
	
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCourier() {
		return courier;
	}
	public void setCourier(String courier) {
		this.courier = courier;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getOrderremark() {
		return orderremark;
	}
	public void setOrderremark(String orderremark) {
		this.orderremark = orderremark;
	}
	public String getBookimage() {
		return bookimage;
	}
	public void setBookimage(String bookimage) {
		this.bookimage = bookimage;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public Double getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(Double unitprice) {
		this.unitprice = unitprice;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
}
