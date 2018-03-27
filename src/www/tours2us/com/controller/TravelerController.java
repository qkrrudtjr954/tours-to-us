package www.tours2us.com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


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
	public String signinAf(HttpServletRequest req,  Model model) throws Exception {
		
		logger.info("TravelerController >>>> signinAf");
		
		
		
		return "redirect:/main.do";
	}

	@RequestMapping(value="signup.do", method=RequestMethod.GET)
	public String signup(Model model) throws Exception{
		
		logger.info("TravelerController >>>> signup");
		
		
		return "signup.tiles";

	}
	
	@RequestMapping(value="signup1step.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String signup(Model model, TravelerDto dto) throws Exception{
		
		logger.info("TravelerController >>>> signup1step");
		System.out.println(dto.toString());
		
		boolean isS = travelerService.signup(dto);
		
		if(isS) {
			System.out.println("성공");
		}
		
		return "signup.tiles";

	}
	
	@ResponseBody
	@RequestMapping(value="checkEmail", method=RequestMethod.GET)
	public String checkEmail(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
				logger.info("test");
					    
			    String email = req.getParameter("email");
			    
			    TravelerDto dto = new TravelerDto();
			    dto = travelerService.getUserByEmail(email);
				
				if(dto != null) {
					// result.getSeq()가 0이 아니면 아이디가 있는 것.
					//	아이디 사용 불가능 
					//resp.getWriter().write("no");
					return "no";
				}else {
					// result.getSeq()가 0이면 아이디가 없는 것.
					//	아이디 사용 가능  
					//resp.getWriter().write("yes");
					return "yse";
				}
				
	}
	
	@ResponseBody
	@RequestMapping(value="findFriend.do", method=RequestMethod.POST)
	public List<TravelerDto> findFriend(String name){
		logger.info("TravelerController findFriend name : {}", name);
		
		List<TravelerDto> friends = null;
		
		//	name 은 쿼리임. email일 수도 있고, name일 수도 있음.
		if(!name.trim().equals("")) {
			friends = travelerService.getTravelersByNamdOrEmail(name);			
		}
		
		return friends;
	}
}
