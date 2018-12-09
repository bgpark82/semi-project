package com.taxi.driver.dto;

public class DriverDto {

	private int d_no;
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
	
	
	
	public DriverDto() {
		
	}

	public DriverDto(int d_no, String d_profile, String d_region, String d_name, String d_id, String d_pw,
			String d_birth, String d_gender, String d_phone, String d_email, String d_enabled, String d_license,
			String d_carnum, String d_role, String d_title, String d_content) {
		super();
		this.d_no = d_no;
		this.d_profile = d_profile;
		this.d_region = d_region;
		this.d_name = d_name;
		this.d_id = d_id;
		this.d_pw = d_pw;
		this.d_birth = d_birth;
		this.d_gender = d_gender;
		this.d_phone = d_phone;
		this.d_email = d_email;
		this.d_enabled = d_enabled;
		this.d_license = d_license;
		this.d_carnum = d_carnum;
		this.d_role = d_role;
		this.d_title = d_title;
		this.d_content = d_content;
	}

	public int getD_no() {
		return d_no;
	}

	public void setD_no(int d_no) {
		this.d_no = d_no;
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

	

	@Override
	public String toString() {
		return "DriverDto [d_no=" + d_no + ", d_profile=" + d_profile + ", d_region=" + d_region + ", d_name=" + d_name
				+ ", d_id=" + d_id + ", d_pw=" + d_pw + ", d_birth=" + d_birth + ", d_gender=" + d_gender + ", d_phone="
				+ d_phone + ", d_email=" + d_email + ", d_enabled=" + d_enabled + ", d_license=" + d_license
				+ ", d_carnum=" + d_carnum + ", d_role=" + d_role + ", d_title=" + d_title + ", d_content=" + d_content
				+ "]";
	}

	
	
	
	
}
