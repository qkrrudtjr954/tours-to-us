package www.tours2us.com.model;

import java.io.Serializable;

public class CoTravelerDto implements Serializable {
	
	private int seq;
	private int target_user_seq;
	private int target_planer_seq;
	private String description;
	private String reg_date;
	private String last_updated;
	private String target_user_name;
	
	public CoTravelerDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public CoTravelerDto(int target_user_seq, int target_planer_seq, String target_user_name) {
		super();
		this.target_user_seq = target_user_seq;
		this.target_planer_seq = target_planer_seq;
		this.target_user_name = target_user_name;
	}



	public CoTravelerDto(int seq, int target_user_seq, int target_planer_seq, String description, String reg_date, String last_updated, String target_user_name) {
		super();
		this.seq = seq;
		this.target_user_seq = target_user_seq;
		this.target_planer_seq = target_planer_seq;
		this.description = description;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
		this.target_user_name = target_user_name;
	}



	public int getSeq() {
		return seq;
	}



	public void setSeq(int seq) {
		this.seq = seq;
	}



	public int getTarget_user_seq() {
		return target_user_seq;
	}



	public void settarget_user_seq(int target_user_seq) {
		this.target_user_seq = target_user_seq;
	}



	public int getTarget_planer_seq() {
		return target_planer_seq;
	}



	public void settarget_planer_seq(int target_planer_seq) {
		this.target_planer_seq = target_planer_seq;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
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



	public String getTarget_user_name() {
		return target_user_name;
	}



	public void setTarget_user_name(String target_user_name) {
		this.target_user_name = target_user_name;
	}



	@Override
	public String toString() {
		return "CoTravelerDto [seq=" + seq + ", target_user_seq=" + target_user_seq + ", target_planer_seq="
				+ target_planer_seq + ", description=" + description + ", reg_date=" + reg_date + ", last_updated="
				+ last_updated + ", target_user_name=" + target_user_name + "]";
	}
	
	
	
	
	

}
