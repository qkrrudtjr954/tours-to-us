package www.tours2us.com.model;

import java.io.Serializable;

public class TravelerDto implements Serializable {

	private int seq;
	private String email;
	private String password;
	private String name;
	private String reg_date;
	private String last_updated;
	private int author;
	private String profile;
	private String like1;
	private String like2;
	private String like3;
	
	public TravelerDto() {
		// TODO Auto-generated constructor stub
	}

	public TravelerDto(int seq, String email, String password, String name, String reg_date, String last_updated,
			int author) {
		super();
		this.seq = seq;
		this.email = email;
		this.password = password;
		this.name = name;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
		this.author = author;
	}
	

	public TravelerDto(int seq, String email, String password, String name, String reg_date, String last_updated,
			int author, String profile, String like1, String like2, String like3) {
		super();
		this.seq = seq;
		this.email = email;
		this.password = password;
		this.name = name;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
		this.author = author;
		this.profile = profile;
		this.like1 = like1;
		this.like2 = like2;
		this.like3 = like3;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getLast_updated() {
		return last_updated;
	}

	public void setLast_updated(String last_updated) {
		this.last_updated = last_updated;
	}

	public int getAuthor() {
		return author;
	}

	public void setAuthor(int author) {
		this.author = author;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getLike1() {
		return like1;
	}

	public void setLike1(String like1) {
		this.like1 = like1;
	}

	public String getLike2() {
		return like2;
	}

	public void setLike2(String like2) {
		this.like2 = like2;
	}

	public String getLike3() {
		return like3;
	}

	public void setLike3(String like3) {
		this.like3 = like3;
	}

	@Override
	public String toString() {
		return "TravelerDto [seq=" + seq + ", email=" + email + ", password=" + password + ", name=" + name
				+ ", reg_date=" + reg_date + ", last_updated=" + last_updated + ", author=" + author + ", profile="
				+ profile + ", like1=" + like1 + ", like2=" + like2 + ", like3=" + like3 + "]";
	}

	
}
