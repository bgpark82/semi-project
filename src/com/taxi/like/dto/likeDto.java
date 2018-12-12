package com.taxi.like.dto;

public class likeDto {
	
	private int like_no;
	private int r_no;
	private int u_no;
	private int like_check;
	
	
	public likeDto() {
		super();
	}

	public likeDto(int like_no, int r_no, int u_no, int like_check) {
		super();
		this.like_no = like_no;
		this.r_no = r_no;
		this.u_no = u_no;
		this.like_check = like_check;
	}

	public int getLike_no() {
		return like_no;
	}

	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public int getLike_check() {
		return like_check;
	}

	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	
	

}
