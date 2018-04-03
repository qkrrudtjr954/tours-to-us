package www.tours2us.com.model;

import java.io.Serializable;

public class HotelResultDto implements Serializable {

	public String link;
	public String name;
	public String price;
	public String desc;
	public String pic;
	
	public HotelResultDto() {
		// TODO Auto-generated constructor stub
	}

	public HotelResultDto(String link, String name, String price, String desc, String pic) {
		super();
		this.link = link;
		this.name = name;
		this.price = price;
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

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	@Override
	public String toString() {
		return "HotelResultDto [link=" + link + ", name=" + name + ", price=" + price + ", desc=" + desc + ", pic="
				+ pic + "]";
	}



	
}
