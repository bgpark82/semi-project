package com.taxi.like.dao;

import org.apache.ibatis.session.SqlSession;

import com.taxi.like.dto.likeDto;
import com.taxi.common.SqlMapConfig;

public class likeDao extends SqlMapConfig {
	private String namespace = "com.taxi.like.";
	
	public likeDto selectOne(int r_no, int u_no) {
		likeDto res = new likeDto();
		SqlSession session = null;
		likeDto dtol = new likeDto();
		dtol.setR_no(r_no);
		dtol.setU_no(u_no);
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.selectOne(namespace+"selectOne", dtol);
		} catch(Exception e) {
			session.close();
		}
		
		return res;
	}
	
	public int confirmLike(int r_no, int u_no) {
		int res = 0;
		SqlSession session = null;
		likeDto dtol = new likeDto();
		dtol.setR_no(r_no);
		dtol.setU_no(u_no);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace+"confirm", dtol);
		}catch(Exception e){
			session.close();
		}
		
		return res;
	}
	
	public void insertLike(int r_no, int u_no) {
		SqlSession session = null;
		likeDto dtol = new likeDto();
		dtol.setR_no(r_no);
		dtol.setU_no(u_no);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			session.insert(namespace+"insert", dtol);
		} catch(Exception e) {
			session.close();
		}
		
	}
	
	
	public void addLike(int r_no, int u_no) {
		SqlSession session = null;
		likeDto dtol = new likeDto();
		dtol.setR_no(r_no);
		dtol.setU_no(u_no);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			session.update(namespace+"add", dtol);
		} catch(Exception e) {
			session.close();
		}
		
	}
	
	public void cancelLike(int r_no, int u_no) {
		SqlSession session = null;
		likeDto dtol = new likeDto();
		dtol.setR_no(r_no);
		dtol.setU_no(u_no);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			session.update(namespace+"cancel", dtol);
		} catch(Exception e) {
			session.close();
		}
	}
	
	
}
