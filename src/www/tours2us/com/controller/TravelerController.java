package www.tours2us.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.tours2us.com.model.TravelerDto;
import www.tours2us.com.service.TravelerService;

@Controller
public class TravelerController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	TravelerService travelerService;
	
	@RequestMapping(value="signin.do", method=RequestMethod.GET)
	public String signin(Model model) {
		
		logger.info("TravelerController >>>> signin");
		
		return "signin.tiles";
	}
	

	@RequestMapping(value="signinAf.do", method=RequestMethod.GET)
	public String signinAf(HttpServletRequest req, TravelerDto dto, Model model)throws Exception {
		
		logger.info("TravelerController >>>> signinAf");
		System.out.println(dto.toString());
		TravelerDto signin = null;
		signin = travelerService.signin(dto);
		
		
		if(signin != null && !signin.getEmail().equals("")) {
			req.getSession().setAttribute("current_user", signin);
			return "redirect:/main.do";
		}else {
			return "redirect:/signin.do";
		}
	}

	@RequestMapping(value="signup.do", method=RequestMethod.GET)
	public String signup(Model model) {
		
		logger.info("TravelerController >>>> signup");
		
		return "signup.tiles";

	}
	
	@RequestMapping(value="signout.do", method=RequestMethod.GET)
	public String signout(HttpServletRequest req, Model model) {
		
		logger.info("TravelerController >>>> signout");
		req.getSession().invalidate();
		return "redirect:/main.do";

	}
}
