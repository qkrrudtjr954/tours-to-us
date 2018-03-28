package www.tours2us.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.tours2us.com.model.TravelerDto;

@Repository
public class TravelerDaoImpl implements TravelerDao{
	@Autowired
	SqlSession sqlSession;

	private String ns = "Traveler.";

	@Override
	public boolean signup(TravelerDto dto) throws Exception {
		int n = sqlSession.insert(ns+"signup", dto);
		return n>0? true:false;
	}

	@Override
	public TravelerDto getUserByEmail(String email) {
		return sqlSession.selectOne(ns + "getUserByEmail", email);
	}

	public TravelerDto signin(TravelerDto dto) throws Exception {
		return sqlSession.selectOne(ns+"signin", dto);
	}

	@Override
	public List<TravelerDto> getTravelersByNamdOrEmail(String name) {
		return sqlSession.selectList(ns + "getTravelersByNamdOrEmail", name);
	}

	@Override
	public boolean myInfoUpd(TravelerDto dto) {
		int n = sqlSession.update(ns+"myInfoUpd", dto);
		return n>0?true:false;
	}
}
