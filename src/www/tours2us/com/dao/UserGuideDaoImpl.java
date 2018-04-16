package www.tours2us.com.dao;

import java.util.ArrayList;
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

	@Override
	public List<PlanerDto> guideSearch(PlanerDto plan) {
		List<PlanerDto> list = new ArrayList<>();
		list=sqlSession.selectList(ns+"guideSearch", plan);
		return list;
	}

	@Override
	public int guideCount(PlanerDto plan) {
		int n = sqlSession.selectOne(ns+"guideCount", plan);
		return n;
	}

	@Override
	public List<PlanerDto> userSearch(String location) {
		List<PlanerDto> list = new ArrayList<>();
		list = sqlSession.selectList(ns+"userSearch", location);
		return list;
	}

}
