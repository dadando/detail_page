/*
create table product(
    product_number number primary key,
    product_id varchar2(15) references member(member_id),
    product_subject varchar2(30),
    product_img1 varchar2(50),
    product_img2 varchar2(50),
    product_img3 varchar2(50),
    product_img4 varchar2(50),
    product_img5 varchar2(50),
    product_starting_price number,
    product_purchase_price number
);
*/


package com.spring.alltion.hongsub;

public class BoardVO {
	private int product_number;
	private String product_id;
	private String product_subject;
	private String product_top_bidder;
	private String product_img1;
	private String product_img2;
	private String product_img3;
	private String product_img4;
	private String product_img5;
	private int product_starting_price;
	private int product_purchase_price;
	private int product_now_price;
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_subject() {
		return product_subject;
	}
	public void setProduct_subject(String product_subject) {
		this.product_subject = product_subject;
	}
	public String getProduct_img1() {
		return product_img1;
	}
	public void setProduct_img1(String product_img1) {
		this.product_img1 = product_img1;
	}
	public String getProduct_img2() {
		return product_img2;
	}
	public void setProduct_img2(String product_img2) {
		this.product_img2 = product_img2;
	}
	public String getProduct_img3() {
		return product_img3;
	}
	public void setProduct_img3(String product_img3) {
		this.product_img3 = product_img3;
	}
	public String getProduct_img4() {
		return product_img4;
	}
	public void setProduct_img4(String product_img4) {
		this.product_img4 = product_img4;
	}
	public String getProduct_img5() {
		return product_img5;
	}
	public void setProduct_img5(String product_img5) {
		this.product_img5 = product_img5;
	}
	public int getProduct_starting_price() {
		return product_starting_price;
	}
	public void setProduct_starting_price(int product_starting_price) {
		this.product_starting_price = product_starting_price;
	}
	public int getProduct_purchase_price() {
		return product_purchase_price;
	}
	public void setProduct_purchase_price(int product_purchase_price) {
		this.product_purchase_price = product_purchase_price;
	}
	public int getProduct_now_price() {
		return product_now_price;
	}
	public void setProduct_now_price(int product_now_price) {
		this.product_now_price = product_now_price;
	}
	public String getProduct_top_bidder() {
		return product_top_bidder;
	}
	public void setProduct_top_bidder(String product_top_bidder) {
		this.product_top_bidder = product_top_bidder;
	}
}
