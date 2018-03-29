package www.tours2us.com.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class hotelController {

	private static final Logger logger = LoggerFactory.getLogger(hotelController.class);
	@RequestMapping(value="hotelPrice.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String hotelPrice(Model model) throws Exception{
		logger.info("TravelerController >>>> hotelPrice");

		return "hotelPrice.tiles";
	}
}
