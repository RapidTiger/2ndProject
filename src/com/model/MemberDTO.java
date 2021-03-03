package com.model;

public class MemberDTO {
	
	
	private String id;
	private String pw;
	private String name;	
	private String address;
	private String detail;
	private int favor;
	private int mood;
	private int convenience;
	
	public int getFavor() {
		return favor;
	}


	public void setFavor(int favor) {
		this.favor = favor;
	}


	public int getMood() {
		return mood;
	}


	public void setMood(int mood) {
		this.mood = mood;
	}


	public int getConvenience() {
		return convenience;
	}


	public void setConvenience(int convenience) {
		this.convenience = convenience;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public void setDetail(String detail) {
		this.detail = detail;
	}


	public MemberDTO(String id, String pw, String name, String address, String detail, int favor,
			int mood, int convenience) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.detail = detail;
		this.favor = favor;
		this.mood = mood;
		this.convenience = convenience;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setLocation1(String address) {
		this.address = address;
	}

	public String getDetail() {
		return detail;
	}


	public void setLocation(String detail) {
		this.detail = detail;
	}

	public MemberDTO(String id, String pw, String name, String address,String detail) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.detail = detail;
	}
	public MemberDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}
	public MemberDTO(String id) {
		super();
		this.id = id;
	}


	public MemberDTO(String id, String address, String name) {
		super();
		this.id = id;
		this.address = address;
		this.name = name;
	}
	
	
	
	
	
	
}
