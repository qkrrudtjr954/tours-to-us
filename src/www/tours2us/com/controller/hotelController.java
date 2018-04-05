package www.tours2us.com.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import util.FindHotel;
import www.tours2us.com.model.HotelDto;
import www.tours2us.com.model.HotelResultDto;

@Controller
public class hotelController {

	private static final Logger logger = LoggerFactory.getLogger(hotelController.class);
	@RequestMapping(value="hotelPrice.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String hotelPrice(Model model) throws Exception{
		logger.info("TravelerController >>>> hotelPrice");

		return "hotelPrice.tiles";
	}
	
	
	@RequestMapping(value="hotelSearch.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String searchResult(HotelDto dto, Model model) throws Exception{
		logger.info("TravelerController >>>> searchResult");
		
		FindHotel util = new FindHotel();
		
		List<HotelResultDto> list = util.getAirSites(dto);
		model.addAttribute("list", list);

		return "hotelPrice.tiles";
	}
	
}
