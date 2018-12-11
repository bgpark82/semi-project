package com.taxi.schedule.dto;

import java.sql.Date;
import java.util.List;

import com.taxi.driver.dto.DriverDto;
import com.taxi.user.dto.UserDto;

public class ScheduleDto {

	private int s_seq;
	private int u_no;
	private int d_no;
	private int s_no;
	private String s_date;
	private int s_time;
	private String s_location;
	private String s_course;
	private int s_people;
	private String s_price;
	private Date s_regdate;
	private String s_latitude;
	private String s_longitude;
	private String s_confirmed_check;
	private DriverDto driverDto;
	
	
	private String d_profile; 
	private String d_region;
	private String d_name;
	private String d_id;
	private String d_pw;
	private String d_birth;
	private String d_gender;
	private String d_phone;
	private String d_email;
	private String d_enabled;
	private String d_license;
	private String d_carnum;
	private String d_role;
	private String d_title;
	private String d_content;
	
	
	private String u_name;
	private String u_id;
	private String u_pw;
	private String u_birth;
	private String u_gender;
	private String u_phone;
	private String u_email;
	private String u_role;
	private String u_enabled;
	
	
	private int ra_no;
	private int ra_rating;

	
	
	
	public ScheduleDto() {
		
	}

	public ScheduleDto(int s_seq, int u_no, int d_no, int s_no, String s_date, int s_time, String s_location,
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

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
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




	public DriverDto getDriverDto() {
		return driverDto;
	}

	public void setDriverDto(DriverDto driverDto) {
		this.driverDto = driverDto;
	}


	@Override
	public String toString() {
		return "ScheduleDto [s_seq=" + s_seq + ", u_no=" + u_no + ", d_no=" + d_no + ", s_no=" + s_no + ", s_date="
				+ s_date + ", s_time=" + s_time + ", s_location=" + s_location + ", s_course=" + s_course
				+ ", s_people=" + s_people + ", s_price=" + s_price + ", s_regdate=" + s_regdate + ", s_latitude="
				+ s_latitude + ", s_longitude=" + s_longitude + ", s_confirmed_check=" + s_confirmed_check
				+ ", driverDto=" + driverDto + ", d_profile=" + d_profile + ", d_region=" + d_region + ", d_name="
				+ d_name + ", d_id=" + d_id + ", d_pw=" + d_pw + ", d_birth=" + d_birth + ", d_gender=" + d_gender
				+ ", d_phone=" + d_phone + ", d_email=" + d_email + ", d_enabled=" + d_enabled + ", d_license="
				+ d_license + ", d_carnum=" + d_carnum + ", d_role=" + d_role + ", d_title=" + d_title + ", d_content="
				+ d_content + ", u_name=" + u_name + ", u_id=" + u_id + ", u_pw=" + u_pw + ", u_birth=" + u_birth
				+ ", u_gender=" + u_gender + ", u_phone=" + u_phone + ", u_email=" + u_email + ", u_role=" + u_role
				+ ", u_enabled=" + u_enabled + ", ra_no=" + ra_no + ", ra_rating=" + ra_rating + "]";
	}

	public String getD_profile() {
		return d_profile;
	}

	public void setD_profile(String d_profile) {
		this.d_profile = d_profile;
	}

	public String getD_region() {
		return d_region;
	}

	public void setD_region(String d_region) {
		this.d_region = d_region;
	}

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
	}

	public String getD_id() {
		return d_id;
	}

	public void setD_id(String d_id) {
		this.d_id = d_id;
	}

	public String getD_pw() {
		return d_pw;
	}

	public void setD_pw(String d_pw) {
		this.d_pw = d_pw;
	}

	public String getD_birth() {
		return d_birth;
	}

	public void setD_birth(String d_birth) {
		this.d_birth = d_birth;
	}

	public String getD_gender() {
		return d_gender;
	}

	public void setD_gender(String d_gender) {
		this.d_gender = d_gender;
	}

	public String getD_phone() {
		return d_phone;
	}

	public void setD_phone(String d_phone) {
		this.d_phone = d_phone;
	}

	public String getD_email() {
		return d_email;
	}

	public void setD_email(String d_email) {
		this.d_email = d_email;
	}

	public String getD_enabled() {
		return d_enabled;
	}

	public void setD_enabled(String d_enabled) {
		this.d_enabled = d_enabled;
	}

	public String getD_license() {
		return d_license;
	}

	public void setD_license(String d_license) {
		this.d_license = d_license;
	}

	public String getD_carnum() {
		return d_carnum;
	}

	public void setD_carnum(String d_carnum) {
		this.d_carnum = d_carnum;
	}

	public String getD_role() {
		return d_role;
	}

	public void setD_role(String d_role) {
		this.d_role = d_role;
	}

	public String getD_title() {
		return d_title;
	}

	public void setD_title(String d_title) {
		this.d_title = d_title;
	}

	public String getD_content() {
		return d_content;
	}

	public void setD_content(String d_content) {
		this.d_content = d_content;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_birth() {
		return u_birth;
	}

	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_role() {
		return u_role;
	}

	public void setU_role(String u_role) {
		this.u_role = u_role;
	}

	public String getU_enabled() {
		return u_enabled;
	}

	public void setU_enabled(String u_enabled) {
		this.u_enabled = u_enabled;
	}

	
	
	
	
	
	// 별점 
	public int getRa_no() {
		return ra_no;
	}

	public void setRa_no(int ra_no) {
		this.ra_no = ra_no;
	}

	public int getRa_rating() {
		return ra_rating;
	}

	public void setRa_rating(int ra_rating) {
		this.ra_rating = ra_rating;
	}
	
	
	
	
	
	
	
	
	
	
	
}
