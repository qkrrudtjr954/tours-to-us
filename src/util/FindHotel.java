package util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import www.tours2us.com.model.HotelDto;
import www.tours2us.com.model.HotelResultDto;



public class FindHotel {
	public List<HotelResultDto> getAirSites(HotelDto dto){
		List<HotelResultDto> list = new ArrayList<>();
		
		try {
		
			Document doc = Jsoup.connect("https://www.airbnb.co.kr/s/"+dto.getCity()+"--한국/homes?checkin="+dto.getCheckin()+"&checkout="+dto.getCheckout()+"&adults="+dto.getAdults()+"&children="+dto.getChildren()+"&infants=0&source=mc_search_bar&refinement_paths%5B%5D=%2Fhomes&allow_override%5B%5D=&s_tag=DW0bvo2w").get();
			//Document doc = Jsoup.connect("").get();
			Elements links = doc.select("div._1szwzht a:first-child");
			Elements names = doc.select("div._1qp0hqb div._1rths372");
			Elements descs = doc.select("div._saba1yg span");
			Elements pic = doc.select("div._1szwzht div._1df8dftk");
			Elements price = doc.select("div._1yarz4r span span:nth-child(2)");
			
			
			System.out.println(doc);
			for (Element e : pic) {
				String attr = e.attr("style");
				e.text(attr.substring(attr.indexOf("https://"), attr.indexOf(")")));
			}
			for (Element e : links) {
				String attr = e.attr("href");
				System.out.println(attr);
				e.text("https://www.airbnb.co.kr"+attr);
			}
		
			
			int size = 12;
			
			if(links.size() <= 12 || names.size() <= 12 || descs.size() <= 12 || pic.size() <= 12 || price.size() <= 12) {
				if(links.size() < names.size()) {
					if(descs.size() < links.size()) {
						size = descs.size();
						size=pic.size();
						size=price.size();
					} else { 
						size = links.size();
						size=pic.size();
						size=price.size();
					}
				} else {
					if(descs.size() < names.size()) {
						size = descs.size();
						size=pic.size();
						size=price.size();
					} else { 
						size = names.size();
						size=pic.size();
						size=price.size();
					}
				}				
			}
			
			for(int i=0; i<size; i++) {
				HotelResultDto hdto = new HotelResultDto();
				
				hdto.link = links.get(i).text();
				hdto.name = names.get(i).text();
				hdto.desc = descs.get(i).text();
				hdto.price = price.get(i).text();
				hdto.pic = pic.get(i).text();
				list.add(hdto);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}

}
