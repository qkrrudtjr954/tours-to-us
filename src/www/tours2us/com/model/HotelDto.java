package www.tours2us.com.model;

import java.io.Serializable;


public class HotelDto implements Serializable {
	private String city;
	private String checkin;
	private String checkout;
	private int adults;
	private int children;
	private int room_no;
	
	public HotelDto() {
		// TODO Auto-generated constructor stub
	}

	public HotelDto(String city, String checkin, String checkout, int adults, int children, int room_no) {
		super();
		this.city = city;
		this.checkin = checkin;
		this.checkout = checkout;
		this.adults = adults;
		this.children = children;
		this.room_no = room_no;
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

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	@Override
	public String toString() {
		return "HotelDto [city=" + city + ", checkin=" + checkin + ", checkout=" + checkout + ", adults=" + adults
				+ ", children=" + children + ", room_no=" + room_no + "]";
	}

	
}
