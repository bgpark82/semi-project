package com.taxi.user.dao;

import org.apache.ibatis.session.SqlSession;

import com.taxi.common.SqlMapConfig;
import com.taxi.user.dto.UserDto;

public class UserDao extends SqlMapConfig {
	private String namespace = "com.taxi.user.";
/*
 * 사용자기능(USER)
 * 1.로그인
 * 2.회원 가입 -> 아이디 중복체크
 * 3.내 정보 조회
 * 4.내 정보 수정
 * 5.회원 탈퇴
 */
	
	// 로그인
	public UserDto login(String u_id, String u_pw) {
		UserDto res = new UserDto();
		UserDto dto = new UserDto();
		dto.setU_id(u_id);
		dto.setU_pw(u_pw);
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(false);
		res = session.selectOne(namespace+"selectlogin", dto);
		return res;
	}
	
	// 회원가입
	public int insertUser(UserDto dto) {
		int res = 0;
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace+"insert", dto);
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	// 아이디 체크
	public String idChk(String u_id) {
		String res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace+"selectChk",u_id);
		}catch(Exception e) {
			session.close();
		}
		
		return res;
	}
	
	// 마이페이지
	public UserDto userInfo(int u_no) {
		UserDto res = new UserDto();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace+"userinfo", u_no);
		} catch(Exception e) {
			session.close();
		}
		
		return res;
	}
	
	// 회원정보 수정
	public int updateUser(UserDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace+"update", dto);
		}catch(Exception e) {
			session.close();
		}
		
		return res;
	}
	
	// 회원 탈퇴
	public int userOut(int u_no) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace+"userout", u_no);
		} catch(Exception e) {
			session.close();
		}
		
		return res;
	}

	
	
}
