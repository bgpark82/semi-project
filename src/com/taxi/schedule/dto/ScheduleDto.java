package com.taxi.schedule.dto;

import java.util.Date;

public class ScheduleDto {

	private int s_seq;
	private int u_no;
	private int d_no;
	private int s_no;
	private Date s_date;
	private int s_time;
	private String s_location;
	private String s_course;
	private int s_people;
	private String s_price;
	private Date s_regdate;
	private String s_latitude;
	private String s_longitude;
	private String s_confirmed_check;
	
	public ScheduleDto() {
		
	}

	public ScheduleDto(int s_seq, int u_no, int d_no, int s_no, Date s_date, int s_time, String s_location,
			String s_course, int s_people, String s_price, Date s_regdate, String s_latitude, String s_longitude,
			String s_confirmed_check) {
		super();
		this.s_seq = s_seq;
		this.u_no = u_no;
		this.d_no = d_no;
		this.s_no = s_no;
		this.s_date = s_date;
		this.s_time = s_time;
		this.s_location = s_location;
		this.s_course = s_course;
		this.s_people = s_people;
		this.s_price = s_price;
		this.s_regdate = s_regdate;
		this.s_latitude = s_latitude;
		this.s_longitude = s_longitude;
		this.s_confirmed_check = s_confirmed_check;
	}

	public int getS_seq() {
		return s_seq;
	}

	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public int getD_no() {
		return d_no;
	}

	public void setD_no(int d_no) {
		this.d_no = d_no;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
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

	public String getS_confirmed_check() {
		return s_confirmed_check;
	}

	public void setS_confirmed_check(String s_confirmed_check) {
		this.s_confirmed_check = s_confirmed_check;
	}

	@Override
	public String toString() {
		return "ScheduleDto [s_seq=" + s_seq + ", u_no=" + u_no + ", d_no=" + d_no + ", s_no=" + s_no + ", s_date="
				+ s_date + ", s_time=" + s_time + ", s_location=" + s_location + ", s_course=" + s_course
				+ ", s_people=" + s_people + ", s_price=" + s_price + ", s_regdate=" + s_regdate + ", s_latitude="
				+ s_latitude + ", s_longitude=" + s_longitude + ", s_confirmed_check=" + s_confirmed_check + "]";
	}
	
	

	}
