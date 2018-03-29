package www.tours2us.com.controller;

import java.util.ArrayList;
import java.util.Date;
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
	List<CommuAfterBbsDto> list = new ArrayList<CommuAfterBbsDto>();
	list = commuService.getAfterBbslist();
	model.addAttribute("afterBbslist", list);
	

	return "afterBbs.tiles";
	
}

@RequestMapping(value = "afterWrite.do", method = {RequestMethod.GET,	RequestMethod.POST})
public String afterbbswrite(Model model) {
	logger.info("CommuController >>>> afterWrite");	
return "afterWrite.tiles";

}


@RequestMapping(value = "afterWriteAf.do", 
method = RequestMethod.GET)
public String bbswriteAf(CommuAfterBbsDto bbs, Model model) throws Exception {
if(bbs.getContent().equals("") || bbs.getTitle().equals("")){
	
return "afterWrite.tiles";
}
logger.info("CommuController >>>> bbswriteAf");	
commuService.afterwriteBbs(bbs);
return "redirect:/afterBbs.do";
}





	
	

}
