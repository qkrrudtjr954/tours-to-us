package www.tours2us.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.tours2us.com.model.CoTravelerDto;
import www.tours2us.com.model.TravelerDto;

@Repository
public class TravelerDaoImpl implements TravelerDao{
	Logger logger = LoggerFactory.getLogger(TravelerDaoImpl.class);
	
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
	
	@Override
	public TravelerDto getUserBySeq(int seq) {
		return sqlSession.selectOne(ns + "getUserBySeq", seq);
	}

	public TravelerDto signin(TravelerDto dto) throws Exception {
		return sqlSession.selectOne(ns+"signin", dto);
	}

	@Override
	public List<TravelerDto> getTravelersByNamdOrEmail(String name) {
		return sqlSession.selectList(ns + "getTravelersByNamdOrEmail", name);
	}

	@Override
	public List<TravelerDto> getCoTraveler(int planer_seq) {
		return sqlSession.selectList(ns + "getCoTraveler", planer_seq);
	}

	@Override
	public int addCoTraveler(CoTravelerDto coTravelerDto) {
		if(coTravelerDto.getDescription()== null || coTravelerDto.getDescription().equals("")) {
			coTravelerDto.setDescription("no description");
		}
		logger.info("coTravelerDto : {}", coTravelerDto);
		
		
		return sqlSession.insert(ns + "addCoTraveler", coTravelerDto);
	}

	@Override
	public CoTravelerDto getCoTraveler(CoTravelerDto coTraveler) {
		return sqlSession.selectOne(ns+"checkCoTraveler", coTraveler);
	}

	@Override
	public boolean deleteCoTraveler(CoTravelerDto coTraveler) {
		int del = sqlSession.delete(ns+"deleteCoTraveler", coTraveler);
		System.out.println(del);
		return (del > 0)?true:false;
	}

	
}
