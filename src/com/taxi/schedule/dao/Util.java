package com.taxi.schedule.dao;

import java.util.List;

import com.taxi.schedule.dto.ScheduleDto;

public class Util {

	private String todate;
	
	public String getToDate() {
		return todate;
	}
	
	// 한자리 숫자를 두자리로 만듦
	public static String isTwo(String msg) {
		return (msg.length()<2? "0"+msg : msg);
	}
	
	// 요일 색 설정 
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
	
	// 해당 날짜의 일정 보여주기
	public static String UserCalView(int i , List<ScheduleDto> list) {
		String d = isTwo(i+"");
		String res = ""; 
		
		for(ScheduleDto dto : list) {													//     678
			if(dto.getS_date().substring(8, 10).equals(d)) {							//19890522
				res += "<p id="+dto.getS_seq()+" onclick='scheduleDetail(this);' style='cursor: pointer;'>";
				res += (dto.getS_location().length()>6)? dto.getS_location().substring(0, 6)+".." : dto.getS_location()+" 여행";
				res += "</p>";
			}
		}
		return res;
	}
//	 data-toggle='modal' data-target='#myCal' 
}
