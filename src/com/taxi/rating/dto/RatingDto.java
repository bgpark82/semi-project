package com.taxi.rating.dto;

public class RatingDto {

	private int ra_no;
	private int u_no;
	private int ra_rating;
	private int d_no;
	
	public RatingDto() {
		
	}

	public RatingDto(int ra_no, int u_no, int ra_rating, int d_no) {
		super();
		this.ra_no = ra_no;
		this.u_no = u_no;
		this.ra_rating = ra_rating;
		this.d_no = d_no;
	}

	public int getRa_no() {
		return ra_no;
	}

	public void setRa_no(int ra_no) {
		this.ra_no = ra_no;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public int getRa_rating() {
		return ra_rating;
	}

	public void setRa_rating(int ra_rating) {
		this.ra_rating = ra_rating;
	}

	public int getD_no() {
		return d_no;
	}

	public void setD_no(int d_no) {
		this.d_no = d_no;
	}

	
}
