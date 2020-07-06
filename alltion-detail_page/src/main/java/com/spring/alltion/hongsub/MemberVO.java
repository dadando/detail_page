/*
create table member(
    member_id varchar2(15) primary key,
    member_password varchar2(20)
);
*/

package com.spring.alltion.hongsub;

public class MemberVO {
	private String member_id;
	private String member_password;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
}
