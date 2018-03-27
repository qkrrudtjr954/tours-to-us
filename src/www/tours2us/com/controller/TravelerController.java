package www.tours2us.com.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.tours2us.com.service.TravelerService;

@Controller
public class TravelerController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	TravelerService travelerService;
	
	@RequestMapping(value="signin.do", method=RequestMethod.GET)
	public String signin(Model model) {
		
		logger.info("TravelerController >>>> login");
		
		return "signin.tiles";
	}
	
	@RequestMapping(value="signup.do", method=RequestMethod.GET)
	public String signup(Model model) {
		
		logger.info("TravelerController >>>> signup");
		
		return "signup.tiles";
	}
}
