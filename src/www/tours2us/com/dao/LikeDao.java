package www.tours2us.com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.tours2us.com.model.LikeDto;

@Repository
public class LikeDao {
	
private String ns = "Like.";
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int prevent_duplication(LikeDto dto) {
		System.out.println(dto);
		int isS = sqlSession.selectOne(ns+"prevent_duplication", dto);
		return isS;
	}
	
	public void insert_like(LikeDto dto) {
		sqlSession.insert(ns+"insert_like", dto);
	}
	
	public void delete_like(LikeDto dto) {
		sqlSession.delete(ns+"delete_like", dto);
	}
	
	public int getLikeCount(LikeDto dto) {
		int n = 0;
		n = sqlSession.selectOne(ns+"getLikeCount", dto);
		return n;
	}
}
