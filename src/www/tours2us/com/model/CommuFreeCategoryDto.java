package www.tours2us.com.model;

import java.io.Serializable;

public class CommuFreeCategoryDto implements Serializable {
	
	private int seq;
	private String title;
	private String description;
	private int status;
	private String reg_date;
	private String last_updated;
	
	
	
	public CommuFreeCategoryDto(int seq, String title, String description, int status, String reg_date,
			String last_updated) {
		super();
		this.seq = seq;
		this.title = title;
		this.description = description;
		this.status = status;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
	}



	public int getSeq() {
		return seq;
	}



	public void setSeq(int seq) {
		this.seq = seq;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
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



	@Override
	public String toString() {
		return "CommuFreeCategoryDto [seq=" + seq + ", title=" + title + ", description=" + description + ", status="
				+ status + ", reg_date=" + reg_date + ", last_updated=" + last_updated + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
