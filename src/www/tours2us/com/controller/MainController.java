package www.tours2us.com.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.tours2us.com.model.ToditorBBS;
import www.tours2us.com.service.ToditorService;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	ToditorService toditorService;
	
	@RequestMapping(value="main.do", method=RequestMethod.GET)
	public String home(Model model) {
		
		logger.info("access");
		
		List<ToditorBBS> b1list = toditorService.best123();	
		model.addAttribute("b1list", b1list);
		
		return "main.tiles";
	}

	
}
