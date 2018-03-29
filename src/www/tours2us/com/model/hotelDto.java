package www.tours2us.com.model;

import java.io.Serializable;


public class hotelDto implements Serializable {
	private String city;
	private String checkin;
	private String checkout;
	private int adults;
	private int children;
	
	public hotelDto() {
		// TODO Auto-generated constructor stub
	}

	public hotelDto(String city, String checkin, String checkout, int adults, int children) {
		super();
		this.city = city;
		this.checkin = checkin;
		this.checkout = checkout;
		this.adults = adults;
		this.children = children;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getAdults() {
		return adults;
	}

	public void setAdults(int adults) {
		this.adults = adults;
	}

	public int getChildren() {
		return children;
	}

	public void setChildren(int children) {
		this.children = children;
	}

	@Override
	public String toString() {
		return "hotelDto [city=" + city + ", checkin=" + checkin + ", checkout=" + checkout + ", adults=" + adults
				+ ", children=" + children + "]";
	}
	
}
