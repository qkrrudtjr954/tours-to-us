package www.tours2us.com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.tours2us.com.model.PlanerDto;
import www.tours2us.com.model.TravelerDto;
import www.tours2us.com.service.PlanerService;

@Controller
public class UserGuideController {
	private static final Logger logger = LoggerFactory.getLogger(guidebookController.class);
	
	@Autowired
	PlanerService planerService;
	
	// 투둥이 가이드북
		@RequestMapping(value="user_guide.do", method={RequestMethod.GET, RequestMethod.POST})
		public String user_guide(HttpServletRequest req, Model model) {
			logger.info("guidebookController >>>> user_guide");
			TravelerDto t_dto = (TravelerDto) req.getSession().getAttribute("current_user");
			System.out.println(t_dto.getSeq());
			int seq = t_dto.getSeq();
			
			List<PlanerDto> planlist = planerService.getplanList(seq);
			System.out.println(planlist);
			model.addAttribute("seq", seq);
			model.addAttribute("planlist", planlist);
			
			return "user_guide.tiles";
		}
}
