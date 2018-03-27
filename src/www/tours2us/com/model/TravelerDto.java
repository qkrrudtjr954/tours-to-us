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

	@Override
	public String toString() {
		return "TravelerDto [seq=" + seq + ", email=" + email + ", password=" + password + ", name=" + name
				+ ", reg_date=" + reg_date + ", last_updated=" + last_updated + ", author=" + author + "]";
	}
	
	
	
	
}
