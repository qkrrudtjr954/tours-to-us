package www.tours2us.com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.tours2us.com.model.PlanerDto;

@Repository
public class UserGuideDaoImpl implements UserGuideDao {
	

	@Autowired
	SqlSessionTemplate sqlSession;

	private String ns = "Toditor.";

	@Override
	public List<PlanerDto> getUserPlanList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getUserPlanList");
	}

}
