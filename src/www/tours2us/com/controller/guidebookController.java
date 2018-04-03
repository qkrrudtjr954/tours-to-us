package www.tours2us.com.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class guidebookController {
	private static final Logger logger = LoggerFactory.getLogger(guidebookController.class);
	
	@RequestMapping(value="editor_essay.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String essaylist(Model model) throws Exception{
		logger.info("guidebookController >>>> essaylist");

		return "editor_essay.tiles";
	}
	
	@RequestMapping(value="toditor_write.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toditor_write(Model model) throws Exception{
		logger.info("guidebookController >>>> toditor_write");
		
		return "toditor_write.tiles";
	}
}
