package com.taxi.schedule.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.taxi.common.SqlMapConfig;
import com.taxi.schedule.dto.ScheduleDto;

public class ScheduleDao extends SqlMapConfig{

	private String namespace = "com.taxi.schedule.";
	
	public int insertSchedule(ScheduleDto scheduleDto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace + "insertSchedule", scheduleDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}
	
	public List<ScheduleDto> UserCalView(int u_no, String yyyy_MM){
		
		List<ScheduleDto> res = new ArrayList<ScheduleDto>(); 
		ScheduleDto dto = new ScheduleDto();

		dto.setU_no(u_no);
		dto.setS_date(yyyy_MM);
		System.out.println(dto);
		
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
	
	
	public ScheduleDto UserCalDetail(int u_no ,int s_seq) {
		SqlSession session = null;
		ScheduleDto res = null;
		
		ScheduleDto dto = new ScheduleDto();
		dto.setU_no(u_no);
		dto.setS_seq(s_seq);

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
