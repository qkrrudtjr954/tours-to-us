package util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import www.tours2us.com.model.HotelDto;
import www.tours2us.com.model.HotelResultDto;



public class FindHotel {
	public List<HotelResultDto> getAirSites(HotelDto dto){
		List<HotelResultDto> list = new ArrayList<>();
		
		try {
		
			Document doc = Jsoup.connect("https://www.airbnb.co.kr/s/"+dto.getCity()+"homes?checkin="+dto.getCheckin()+"&checkout="+dto.getCheckout()+"&adults="+dto.getAdults()+"&children="+dto.getChildren()+"&infants=0&source=mc_search_bar&refinement_paths%5B%5D=%2Fhomes&allow_override%5B%5D=&s_tag=DW0bvo2w").get();
			
			Elements links = doc.select("div.cont_inner a.url_fl");
			Elements names = doc.select("div.cont_inner div.wrap_tit a");
			Elements descs = doc.select("div.cont_inner p.desc");
			
			System.out.println(links.size());
			System.out.println(names.size());
			System.out.println(descs.size());
			
			int size = 10;
			
			if(links.size() <= 10 || names.size() <= 10 || descs.size() <= 10) {
				if(links.size() < names.size()) {
					if(descs.size() < links.size()) {
						size = descs.size();
					} else { 
						size = links.size();
					}
				} else {
					if(descs.size() < names.size()) {
						size = descs.size();
					} else { 
						size = names.size();
					}
				}				
			}
			
			for(int i=0; i<size; i++) {
				HotelResultDto hdto = new HotelResultDto();
				System.out.println(links.get(i).text());
				hdto.link = links.get(i).text();
				hdto.name = names.get(i).text();
				hdto.desc = descs.get(i).text();
			/*	hdto.price = price.get(i).text();
				hdto.pic = pic.get.get(i).text();*/
				
				list.add(hdto);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
}
