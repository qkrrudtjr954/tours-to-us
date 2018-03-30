package www.tours2us.com.model;

import java.io.Serializable;

public class HotelResultDto implements Serializable {

	public String link;
	public String name;
	public String price;
	public float star;
	public String desc;
	public String pic;
	
	public HotelResultDto() {
		// TODO Auto-generated constructor stub
	}

	
	public HotelResultDto(String link, String name, String price, float star, String desc, String pic) {
		super();
		this.link = link;
		this.name = name;
		this.price = price;
		this.star = star;
		this.desc = desc;
		this.pic = pic;
	}


	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public float getStar() {
		return star;
	}

	public void setStar(float star) {
		this.star = star;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}


	@Override
	public String toString() {
		return "HotelResultDto [link=" + link + ", name=" + name + ", price=" + price + ", star=" + star + ", desc="
				+ desc + ", pic=" + pic + "]";
	}


	
}
