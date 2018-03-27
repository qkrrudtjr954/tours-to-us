package www.tours2us.com.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PlanerController {
	
	Logger logger = LoggerFactory.getLogger(PlanerController.class);
	
	@RequestMapping(value="planer.do", method=RequestMethod.GET)
	public String planer(Model model) {
		
		logger.info("PlanerController >>>> planer");
		
		return "planer.tiles";
	}

}
