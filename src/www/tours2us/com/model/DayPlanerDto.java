package www.tours2us.com.model;

import java.io.Serializable;

public class DayPlanerDto implements Serializable {
	private int seq;
	private int target_planer_seq;
	private String day;
	private int day_count;
	private int expected_cost;
	private String reg_date;
	private String last_updated;
	
	
	public DayPlanerDto() {
		// TODO Auto-generated constructor stub
	}


	public DayPlanerDto(int seq, int target_planer_seq, String day, int day_count, int expected_cost, String reg_date,
			String last_updated) {
		super();
		this.seq = seq;
		this.target_planer_seq = target_planer_seq;
		this.day = day;
		this.day_count = day_count;
		this.expected_cost = expected_cost;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
	}


	public DayPlanerDto(int target_planer_seq, String day, int day_count) {
		super();
		this.target_planer_seq = target_planer_seq;
		this.day = day;
		this.day_count = day_count;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getTarget_planer_seq() {
		return target_planer_seq;
	}


	public void setTarget_planer_seq(int target_planer_seq) {
		this.target_planer_seq = target_planer_seq;
	}


	public String getDay() {
		return day;
	}


	public void setDay(String day) {
		this.day = day;
	}


	public int getDay_count() {
		return day_count;
	}


	public void setDay_count(int day_count) {
		this.day_count = day_count;
	}


	public int getExpected_cost() {
		return expected_cost;
	}


	public void setExpected_cost(int expected_cost) {
		this.expected_cost = expected_cost;
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
		return "DayPlanerDto [seq=" + seq + ", target_planer_seq=" + target_planer_seq + ", day=" + day + ", day_count="
				+ day_count + ", expected_cost=" + expected_cost + ", reg_date=" + reg_date + ", last_updated="
				+ last_updated + "]";
	}
	
}
