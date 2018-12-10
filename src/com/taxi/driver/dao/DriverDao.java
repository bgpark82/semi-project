package com.taxi.driver.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.taxi.common.SqlMapConfig;
import com.taxi.driver.dto.DriverDto;
import com.taxi.schedule.dto.ScheduleDto;

public class DriverDao extends SqlMapConfig{

	private String namespace = "com.taxi.driver.";
	
	//회원가입
	public int insertDriver(DriverDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace + "regist", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	
	//아이디체크
	public String idChk(String d_id) {
		SqlSession session = null;
		String res = null;
		
			try {
				session = getSqlSessionFactory().openSession(true);
				res = session.selectOne(namespace + "idchk", d_id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				session.close();
			}
		return res;	
	}
	
	
	//로그인
	public DriverDto login(String d_id, String d_pw) {
		SqlSession session = null;
		
		DriverDto res = new DriverDto();
		// id,pw를 dto라는 그릇에 담는 공식
		DriverDto dto = new DriverDto();
		dto.setD_id(d_id);
		dto.setD_pw(d_pw);
			try {
				session = getSqlSessionFactory().openSession(true);
				res = session.selectOne(namespace + "login", dto);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				session.close();
			}
		return res;
	}
	
	
	//마이페이지
	public DriverDto selectDriver(int d_no) {
		
		SqlSession session = null;
		DriverDto dto = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne(namespace + "driverinfo", d_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
		
	}
	
	
	//마이페이지 수정
	public int updateDriver(DriverDto dto) {
		
		SqlSession session = null;
		
		int res = 0;

		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace + "driverupdate", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	//마이페이지 탈퇴
	public int deleteDriver(int d_no) {
		SqlSession session = null;
		
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace + "driverdelete", d_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
		
	}
	
	//운전자 리스트 조회
	public List<DriverDto> DriverList(){
		List<DriverDto> res = new ArrayList<DriverDto>();
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectList(namespace + "driverlist");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	
	
	//프로필 사진
		public String getProfile(int d_no) {
			SqlSession session = null;
			
			try {
				session = getSqlSessionFactory().openSession();
				String rs = session.selectOne(namespace+"getprofile", d_no);
				
				if(rs.equals("")) {
					return "http://localhost:8787/SemiProject/images/icon.jpg";
				}
				return "http://localhost:8787/SemiProject/upload/"+rs;
				
			} catch (Exception e) {
				session.close();
			}
			
			return "http://localhost:8787/SemiProject/images/icon.jpg";
		}
		
		public DriverDto getUser(String d_id) {
			SqlSession session = null;
			
			DriverDto dto = new DriverDto();
			
			try {
				session = getSqlSessionFactory().openSession();
				dto = session.selectOne(namespace+"driverselect", d_id);
				
			} catch (Exception e) {
				session.close();
			} 
			
			return dto;
		}
		
		public int profile(String d_id, String filename) {
			SqlSession session = null;
			DriverDto dto = new DriverDto();
			int res = 0;
			
			try {
				session = getSqlSessionFactory().openSession(true);
				dto.setD_id(d_id);
				dto.setD_profile(filename);
				res = session.update(namespace+"updateProfile", dto);

			} catch (Exception e) {
				session.close();
			}
			return res;
		}
		

		
		
		
		

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
