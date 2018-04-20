package util;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
			String checkInDate[] = dto.getCheckin().split("-");
			String checkOutDate[] = dto.getCheckout().split("-");
			//Document doc = Jsoup.connect("https://www.airbnb.co.kr/s/"+dto.getCity()+"--한국/homes?checkin="+dto.getCheckin()+"&checkout="+dto.getCheckout()+"&adults="+dto.getAdults()+"&children="+dto.getChildren()+"&infants=0&source=mc_search_bar&refinement_paths%5B%5D=%2Fhomes&allow_override%5B%5D=&s_tag=DW0bvo2w").timeout(5000).get();
			String url = "https://www.booking.com/searchresults.ko.html?"
					+ "aid=309654&label=hotels-korean-ko-gyVHHho6XvMzklDv1L_GHwS95119518172%3Apl%3Ata%3Ap1%3Ap21%2C759%2C000%3Aac%3Aap1t1%3Aneg%3Afi%3Atikwd-4205654390%3Alp1009871%3Ali%3Adec%3Adm&sid=1fb7acf20a72b50b206b2c656ec2f409&sb=1&src=index&src_elem=sb&error_url=https%3A%2F%2Fwww.booking.com%2Findex.ko.html%3Faid%3D309654%3Blabel%3Dhotels-korean-ko-gyVHHho6XvMzklDv1L_GHwS95119518172%253Apl%253Ata%253Ap1%253Ap21%252C759%252C000%253Aac%253Aap1t1%253Aneg%253Afi%253Atikwd-4205654390%253Alp1009871%253Ali%253Adec%253Adm%3Bsid%3D1fb7acf20a72b50b206b2c656ec2f409%3Bsb_price_type%3Dtotal%26%3B&ac_presel=0"
					+ "&ss="+dto.getCity()
					+ "&checkin_year="+checkInDate[0]
					+ "&checkin_month="+checkInDate[1]
					+ "&checkin_monthday="+checkInDate[2]
					+ "&checkout_year="+checkOutDate[0]
					+ "&checkout_month="+checkOutDate[1]
					+ "&checkout_monthday="+checkOutDate[2]
					+ "&group_adults="+dto.getAdults()
					+ "&group_children="+dto.getChildren()
					+ "&no_rooms="+dto.getRoom_no();
			
			Document doc = Jsoup.connect(url).timeout(5000).get();
			
			Elements links = doc.select("a.hotel_name_link.url");
			Elements names = doc.select("a.hotel_name_link.url span:first-child");
			Elements descs = doc.select("span.review-score-widget__body span:first-child");
			Elements pic = doc.select("img.hotel_image");
			Elements price = doc.select("div.totalPrice");

			int array[] = new int[5];
			array[0] = links.size();
			array[1] = names.size();
			array[2] = descs.size();
			array[3] = pic.size();
			array[4] = price.size();
			
			System.out.println(array.toString());
			
			int max =array[0];	
			for(int i=0; i < array.length ; i++) {
			    if( array[i] > max ) max = array[i];
			}
	
			int size = max;
			
			for(int i=0; i<size; i++) {
				HotelResultDto hdto = new HotelResultDto();
				if(i >= links.size()) {
					hdto.link = "";
				}else {
					String attr = links.get(i).attr("href");
					hdto.link ="https://www.booking.com"+attr;
				}
				
				if(i >= names.size()) {
					hdto.name = "";
				}else {
					hdto.name = names.get(i).text();
				}
				
				if(i >= descs.size()) {
					hdto.desc = "";
				}else {
					hdto.desc = descs.get(i).text();
				}
				
				if(i >= price.size()) {
					hdto.price = "";
				}else {
					hdto.price = price.get(i).text();
				}
				
				if(i >= pic.size()) {
					hdto.pic = "";
				}else {
					String src = pic.get(i).attr("src");
					hdto.pic = src;
				}
			
				list.add(hdto);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}

}
