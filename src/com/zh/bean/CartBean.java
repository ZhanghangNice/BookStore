package com.zh.bean;

public class CartBean {
	private  Integer count;   //计数（此用户添加书的种类）
	private  String  bookid;
	private  String  bookname;
	private  Integer quantity;         //数量
	private  Double  unitprice;	      //单价
	private  String  author;
	private  String  bookimage;
	
/*	public CartBean(String bookid, String bookname, Integer quantity, Double unitprice, String author, String bookimage){
		this.bookid = bookid;
		this.bookname = bookname;
		this.quantity = quantity;
		this.unitprice = unitprice;
		this.author = author;
		this.bookimage = bookimage;
	}*/
	
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Double getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(Double unitprice) {
		this.unitprice = unitprice;
	}
	public String getBookimage() {
		return bookimage;
	}

	public void setBookimage(String bookimage) {
		this.bookimage = bookimage;
	}
	//总价
	public double getSum(){
		return this.quantity * this.unitprice;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}

}
