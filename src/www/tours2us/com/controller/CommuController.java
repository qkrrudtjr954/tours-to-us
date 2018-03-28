package www.tours2us.com.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class CommuController {
private static final Logger logger = LoggerFactory.getLogger(MainController.class);	
	
@RequestMapping(value="afterBbs.do", 
method= {RequestMethod.GET, RequestMethod.POST})
public String afterBbs(Model model) throws Exception{
	
	logger.info("CommuController >>>> afterbbslist");
	
	return "afterBbs.tiles";

	
	
	
}


	
	

}
