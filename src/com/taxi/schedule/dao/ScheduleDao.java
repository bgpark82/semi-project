package com.taxi.schedule.dao;

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
}
