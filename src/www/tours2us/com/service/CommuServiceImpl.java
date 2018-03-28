package www.tours2us.com.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.tours2us.com.dao.CommuDao;

@Service
public class CommuServiceImpl implements CommuService {

Logger logger = LoggerFactory.getLogger(PlanerServiceImpl.class);

@Autowired
CommuDao commutDao;



	

}
