package com.zh.bean;

public class EbookBean {
	private  Integer  id;
	private  String   ebookname;
	private  Double   unitprice;
	private  String   author;
	private  String   summary;
	private  String   ebooktxt;
	private  String   ebookimage;
	private  String   classid;
	private  Integer  downloads;
	private  String   link;
	
	public String getEbookimage() {
		return ebookimage;
	}
	public void setEbookimage(String ebookimage) {
		this.ebookimage = ebookimage;
	}
	public Double getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(Double unitprice) {
		this.unitprice = unitprice;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public Integer getDownloads() {
		return downloads;
	}
	public void setDownloads(Integer downloads) {
		this.downloads = downloads;
	}
	public String getEbookname() {
		return ebookname;
	}
	public void setEbookname(String ebookname) {
		this.ebookname = ebookname;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getEbooktxt() {
		return ebooktxt;
	}
	public void setEbooktxt(String ebooktxt) {
		this.ebooktxt = ebooktxt;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

}
