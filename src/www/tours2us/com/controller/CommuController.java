package www.tours2us.com.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.tours2us.com.model.CommuAfterBbsDto;
import www.tours2us.com.service.CommuService;



@Controller
public class CommuController {
private static final Logger logger = LoggerFactory.getLogger(CommuController.class);	

@Autowired
CommuService commuService;


@RequestMapping(value="afterBbs.do", 
method= {RequestMethod.GET, RequestMethod.POST})
public String afterBbs(Model model) throws Exception{
	
	logger.info("CommuController >>>> afterbbslist");
	List<CommuAfterBbsDto> list = commuService.getAfterBbslist();
	
	model.addAttribute("afterBbslist", list);
	

	return "afterBbs.tiles";

	
	
	
}


	
	

}
