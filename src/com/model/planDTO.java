package com.model;

public class planDTO {
	private String id;
	private String date;
	private String time;
	private String name;
	private String address;
	private double lat;
	private double lng;
	
	public planDTO(String id, String time) {
		super();
		this.id = id;
		this.time = time;
	}
	public planDTO(String id) {
		super();
		this.id = id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
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
	public void setAddress(String address) {
		this.address = address;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public planDTO(String id, String date, String time, String name, String address, double lat, double lng) {
		super();
		this.id = id;
		this.date = date;
		this.time = time;
		this.name = name;
		this.address = address;
		this.lat = lat;
		this.lng = lng;
	}
	
	
}
