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
				res += "<div class='panel panel-default' style='margin-bottom:5px'>";
				res += "<div class='panel-body' style='padding:5px'>";
				res += "<p id="+dto.getS_seq()+" onclick='scheduleDetail(this);' style='cursor: pointer; margin:0; font-size:10px;'><span>";
				res += (dto.getS_location().length()>6)? dto.getS_location().substring(0, 6)+".." : dto.getS_location()+" 여행</span>";
				if(dto.getS_confirmed_check().equals("P")) {
					res += "<span id='dot' confirmed='"+dto.getS_confirmed_check()+"' style='float:right; color:orange'>●</span>";
				} else if(dto.getS_confirmed_check().equals("N")) {
					res += "<span id='dot' confirmed='"+dto.getS_confirmed_check()+"' style='float:right; color:red'>●</span>";
				} else {
					res += "<span id='dot' confirmed='"+dto.getS_confirmed_check()+"' style='float:right; color:green'>●</span>";
				}
				res += "</p>";
				res += "</div>";
				res += "</div>";
			}
		}
		return res;
	}
//	 data-toggle='modal' data-target='#myCal' 
}
