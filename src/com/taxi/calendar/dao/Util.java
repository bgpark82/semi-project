package com.taxi.calendar.dao;

import java.util.List;

import com.taxi.calendar.dto.CalendarDto;

public class Util {

private String todate;
	
	public String getToDate() {
		
		return todate;
	}
	
	//���ڸ� ���� ���ڸ� ���� ��ȯ
		public static String isTwo(String msg) {
			
			return (msg.length()<2? "0"+msg : msg);
		}
	
	//���Ϻ� ��¥ ���� ��� 
	public static String fontcolor(int date, int dayOfweek) {
		
		String color = "";
		if((dayOfweek+date-1)%7==0) {
			color ="blue";
		}else if((dayOfweek+date-1)%7==1) {
			color="red";
		}else {
			color="black";
		}
		
		return color;
	}
	
	
	//Ķ������ ���� 3�� �����ֱ� 
	public static String UserCalView(int i , List<CalendarDto> list) {
		String d = isTwo(i+"");
		String res = ""; 
		
		for(CalendarDto dto : list) {
			if(dto.getCal_mdate().substring(6, 8).equals(d)) {
				res += "<p id='CalDetail' onclick='UserCalDetail();' >";
				res += (dto.getCal_title().length()>6)? dto.getCal_title().substring(0, 6)+".." : dto.getCal_title();
				res += "</p>";
			}
		}
		return res;
	}
}
