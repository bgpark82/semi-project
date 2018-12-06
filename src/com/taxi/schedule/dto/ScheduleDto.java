package com.taxi.schedule.dto;

import java.util.Date;

public class ScheduleDto {

	private int u_no;
	private Date s_date;
	private int s_time;
	private String s_location;
	private String s_course;
	private int s_people;
	private String s_price;
	private Date s_regdate;
	private String s_latitude;
	private String s_longitude;
	
	public ScheduleDto() {
		
	}

	public ScheduleDto(int u_no, Date s_date, int s_time, String s_location, String s_course, int s_people,
			String s_price, Date s_regdate, String s_latitude, String s_longitude) {
		super();
		this.u_no = u_no;
		this.s_date = s_date;
		this.s_time = s_time;
		this.s_location = s_location;
		this.s_course = s_course;
		this.s_people = s_people;
		this.s_price = s_price;
		this.s_regdate = s_regdate;
		this.s_latitude = s_latitude;
		this.s_longitude = s_longitude;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public Date getS_date() {
		return s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}

	public int getS_time() {
		return s_time;
	}

	public void setS_time(int s_time) {
		this.s_time = s_time;
	}

	public String getS_location() {
		return s_location;
	}

	public void setS_location(String s_location) {
		this.s_location = s_location;
	}

	public String getS_course() {
		return s_course;
	}

	public void setS_course(String s_course) {
		this.s_course = s_course;
	}

	public int getS_people() {
		return s_people;
	}

	public void setS_people(int s_people) {
		this.s_people = s_people;
	}

	public String getS_price() {
		return s_price;
	}

	public void setS_price(String s_price) {
		this.s_price = s_price;
	}

	public Date getS_regdate() {
		return s_regdate;
	}

	public void setS_regdate(Date s_regdate) {
		this.s_regdate = s_regdate;
	}

	public String getS_latitude() {
		return s_latitude;
	}

	public void setS_latitude(String s_latitude) {
		this.s_latitude = s_latitude;
	}

	public String getS_longitude() {
		return s_longitude;
	}

	public void setS_longitude(String s_longitude) {
		this.s_longitude = s_longitude;
	}

		
}
