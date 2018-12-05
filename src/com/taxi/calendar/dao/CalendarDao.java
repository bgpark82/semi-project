package com.taxi.calendar.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.taxi.calendar.dto.CalendarDto;
import com.taxi.common.SqlMapConfig;

public class CalendarDao extends SqlMapConfig{

	private String namespace = "com.taxi.calendar.db.CalendarDB.";
	
	//�޷¿� �Ϻ� ���� ����ϱ� (3��)
	public List<CalendarDto> UserCalView(String cal_id, String yyyyMM){
		
		
	List<CalendarDto> res = new ArrayList<CalendarDto>(); 
		
	CalendarDto dto = new CalendarDto();
		
		dto.setCal_id(cal_id);
		dto.setCal_mdate(yyyyMM);
		
		
		SqlSession session = null;
		
		try {
			
		session = getSqlSessionFactory().openSession(true);
		
		
		
		res = session.selectList(namespace +"UserCalView", dto);
		
		
		}catch(Exception e) {
			e.printStackTrace();
		
		}finally {
			session.close();
		}
		
		return res;
		
	}
	
	//��¥Ŭ���ϸ� ���� �󼼺��� 
/*	public UserCalDto UserCalDetail(int cal_no) {
		
		SqlSession session = null;
		UserCalDto res = null;
		
		try {
			
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(namespace + "UserCalDetail" , cal_no); 
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return res;
	} */
	
	//cal_id,mdate,cal_no
	public List<CalendarDto> UserCalDetail(String cal_id ,int cal_no) {

		
		SqlSession session = null;
		List<CalendarDto> res = new ArrayList<CalendarDto>(); 
		
		
		CalendarDto dto = new CalendarDto();
		
		dto.setCal_id(cal_id);
		dto.setCal_no(cal_no);

		try {

			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(namespace + "UserCalDetail", dto);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}
	
}
