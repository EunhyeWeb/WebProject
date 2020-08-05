package com.vo;

public class MemberVO {
	private String id;
	private String nickname;
	private int password;
	private String birth;
	private String email;
	private String gender;
	private String phonenum;

	public MemberVO() {
	}

	public MemberVO(String id, String nickname, int password, String birth, String email, String gender,
			String phonenum) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.password = password;
		this.birth = birth;
		this.email = email;
		this.gender = gender;
		this.phonenum = phonenum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getPassword() {
		return password;
	}

	public void setPassword(int password) {
		this.password = password;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

}
