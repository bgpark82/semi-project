package com.taxi.user.dao;

import org.apache.ibatis.session.SqlSession;

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
	
	//로그인
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
	
	public int insertUser(UserDto dto) {
		int res = 0;
		SqlSession session = null;
		System.out.println(dto.getU_birth());
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace+"insert", dto);
		} catch(Exception e){
			session.close();
		}
		
		return res;
	}
	
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
	
	
}
