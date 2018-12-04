package com.taxi.schedule.dto;

import java.sql.Date;

public class ScheduleDto {

	private int u_no;
	private Date s_date;
	private String s_time;
	private String s_local;
	private String s_course;
	private int s_people;
	private Date s_regdate;
	
	public ScheduleDto() {
		
	}

	public ScheduleDto(int u_no, Date s_date, String s_time, String s_local, String s_course, int s_people,
			Date s_regdate) {
		super();
		this.u_no = u_no;
		this.s_date = s_date;
		this.s_time = s_time;
		this.s_local = s_local;
		this.s_course = s_course;
		this.s_people = s_people;
		this.s_regdate = s_regdate;
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

	public String getS_time() {
		return s_time;
	}

	public void setS_time(String s_time) {
		this.s_time = s_time;
	}

	public String getS_local() {
		return s_local;
	}

	public void setS_local(String s_local) {
		this.s_local = s_local;
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

	public Date getS_regdate() {
		return s_regdate;
	}

	public void setS_regdate(Date s_regdate) {
		this.s_regdate = s_regdate;
	}
	
	
}
