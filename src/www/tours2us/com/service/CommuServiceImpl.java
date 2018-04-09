package www.tours2us.com.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import www.tours2us.com.dao.CommuDao;
import www.tours2us.com.model.CommuAfterBbsDto;
import www.tours2us.com.model.CommuAfterCommentDto;
import www.tours2us.com.model.CommuFreeBbsDto;

@Service
public class CommuServiceImpl implements CommuService {

Logger logger = LoggerFactory.getLogger(CommuServiceImpl.class);

@Autowired
CommuDao commutDao;

@Override
@Transactional(readOnly=true)
public List<CommuAfterBbsDto> getAfterBbslist() throws Exception {
	// TODO Auto-generated method stub
	return commutDao.getAfterBbslist();
}

@Override
public boolean afterwriteBbs(CommuAfterBbsDto bbs) throws Exception {
	// TODO Auto-generated method stub
	return commutDao.afterwriteBbs(bbs);
}

@Override
public CommuAfterBbsDto getAfterBbs(int seq) throws Exception {
	// TODO Auto-generated method stub
	return commutDao.getAfterBbs(seq);
}

@Override
public boolean AfterUpdate(CommuAfterBbsDto bbs) throws Exception {
	// TODO Auto-generated method stub
	return commutDao.AfterUpdate(bbs);
}

@Override
public boolean Afterdelete(int seq) throws Exception {
	// TODO Auto-generated method stub
	return commutDao.Afterdelete(seq);
}

@Override
public List<CommuAfterBbsDto> AftergetBbsPagingList(CommuAfterBbsDto afterparam) throws Exception {
	// TODO Auto-generated method stub
	return commutDao.AftergetBbsPagingList(afterparam);
}

@Override
public int AfterGetBbsCount(CommuAfterBbsDto aftercontparam) throws Exception {

	return commutDao.AfterGetBbsCount(aftercontparam);
}

//FreeBbs
@Override
@Transactional(readOnly=true)
public List<CommuFreeBbsDto> getFreeBbslist() throws Exception {
	// TODO Auto-generated method stub
	return commutDao.getFreeBbslist();
}

@Override
public boolean FreeBbsWrite(CommuFreeBbsDto freewrite) throws Exception {
	// TODO Auto-generated method stub
	return commutDao.FreeBbsWrite(freewrite);
}

@Override
public CommuFreeBbsDto FreeBbsDetail(int seq) throws Exception {
	
	return commutDao.FreeBbsDetail(seq);
}

@Override
public boolean FreeBbsUpdate(CommuFreeBbsDto freebbsupdate) throws Exception {
	// TODO Auto-generated method stub
	return commutDao.FreeBbsUpdate(freebbsupdate);
}





}
