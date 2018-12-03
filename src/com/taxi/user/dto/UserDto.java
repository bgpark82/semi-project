package com.taxi.user.dto;

public class UserDto {

	private int u_no;
	private String u_name;
	private String u_id;
	private String u_pw;
	private String u_birth;
	private String u_gender;
	private String u_phone;
	private String u_email;
	private String u_role;
	private String u_enabled;
	
	public UserDto() {
		super();
	}

	public UserDto(int u_no, String u_name, String u_id, String u_pw, String u_birth, String u_gender, String u_phone,
			String u_email, String u_role, String u_enabled) {
		super();
		this.u_no = u_no;
		this.u_name = u_name;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_birth = u_birth;
		this.u_gender = u_gender;
		this.u_phone = u_phone;
		this.u_email = u_email;
		this.u_role = u_role;
		this.u_enabled = u_enabled;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
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
	
	
}
