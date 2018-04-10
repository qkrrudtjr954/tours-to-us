package www.tours2us.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import www.tours2us.com.service.TotoGuideService;

@Controller
public class TotoGuideController {

	@Autowired
	TotoGuideService totoGuideService;
}
