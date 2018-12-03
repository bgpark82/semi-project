package com.taxi.board.dto;

import java.util.Date;

public class RBoardDto {

	private int r_no;
	private String r_writer;
	private String r_title;
	private String r_content;
	private String r_area;
	private Date r_date;
	private int r_count;
	
	
	
	public RBoardDto() {
		super();
	}

	public RBoardDto(int r_no, String r_writer, String r_title, String r_content, String r_area, Date r_date,
			int r_count) {
		super();
		this.r_no = r_no;
		this.r_writer = r_writer;
		this.r_title = r_title;
		this.r_content = r_content;
		this.r_area = r_area;
		this.r_date = r_date;
		this.r_count = r_count;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_area() {
		return r_area;
	}

	public void setR_area(String r_area) {
		this.r_area = r_area;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public int getR_count() {
		return r_count;
	}

	public void setR_count(int r_count) {
		this.r_count = r_count;
	} 
	
	
	
}
