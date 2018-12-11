package com.taxi.rating.dao;

import org.apache.ibatis.session.SqlSession;

import com.taxi.common.SqlMapConfig;
import com.taxi.rating.dto.RatingDto;

public class RatingDao extends SqlMapConfig{

	private String namespace = "com.taxi.rating.";
	
	public int insertRating(int ra_rating, int d_no, int u_no) {
		SqlSession session = null;
		
		RatingDto dto = new RatingDto();
		dto.setRa_rating(ra_rating);
		dto.setD_no(d_no);
		dto.setU_no(u_no);
		int res = 0;
		
		System.out.println("ra_rating : " +ra_rating);
		System.out.println("d_no : " +d_no);
		System.out.println("u_no : " +u_no);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace+"insertRating", dto);

		
		System.out.println("res : "+res);
		
		} catch (Exception e) {
			session.close();
		}
		return res;
	}
	
	public int showRating(int d_no) {
		SqlSession session = null;
		int res = 0;
		

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(namespace+"showRating", d_no);

		
		System.out.println("res : "+res);
		
		} catch (Exception e) {
			session.close();
		}
		return res;
	}
}
