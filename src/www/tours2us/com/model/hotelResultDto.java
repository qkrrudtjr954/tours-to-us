package www.tours2us.com.model;

import java.io.Serializable;

public class hotelResultDto implements Serializable {

	public String link;
	public String name;
	public String price;
	public float star;
	public String desc;
	
	public hotelResultDto() {
		// TODO Auto-generated constructor stub
	}

	public hotelResultDto(String link, String name, String price, float star, String desc) {
		super();
		this.link = link;
		this.name = name;
		this.price = price;
		this.star = star;
		this.desc = desc;
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
		return "hotelResultDto [link=" + link + ", name=" + name + ", price=" + price + ", star=" + star + ", desc="
				+ desc + "]";
	}
	
}
