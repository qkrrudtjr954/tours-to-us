package www.tours2us.com.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.tours2us.com.model.EventDto;
import www.tours2us.com.service.EventService;

@Controller
public class EventController {
	Logger logger = LoggerFactory.getLogger(PlanerController.class);
	
	@Autowired
	EventService eventService;
	
	@RequestMapping(value="event.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String event(Model model)throws Exception {
		logger.info("TravelerController >>>> event");
		List<EventDto> eventlist = eventService.getEventList();
		model.addAttribute("eventlist", eventlist);
		System.out.println(eventlist.toString());
		return "event.tiles";
	}
	
	@RequestMapping(value="eventDetail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String eventDetail(int seq, Model model)throws Exception {
		logger.info("TravelerController >>>> event");
		
		
		return "eventDetail.tiles";
	}
	
}
