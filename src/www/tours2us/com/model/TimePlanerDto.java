package www.tours2us.com.model;

import java.io.Serializable;

public class TimePlanerDto implements Serializable {

	private int seq;
	private int target_dayplaner_seq; 
	private String start_time;
	private String end_time;
	private String location;
	private int expected_cost;
	private String transportation;
	private String types;
	private String content;
	private String reg_date;
	private String last_updated;
	
	
	public TimePlanerDto() {
		// TODO Auto-generated constructor stub
	}


	public TimePlanerDto(int seq, int target_dayplaner_seq, String start_time, String end_time, String location,
			int expected_cost, String transportation, String types, String content, String reg_date,
			String last_updated) {
		super();
		this.seq = seq;
		this.target_dayplaner_seq = target_dayplaner_seq;
		this.start_time = start_time;
		this.end_time = end_time;
		this.location = location;
		this.expected_cost = expected_cost;
		this.transportation = transportation;
		this.types = types;
		this.content = content;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getTarget_dayplaner_seq() {
		return target_dayplaner_seq;
	}


	public void setTarget_dayplaner_seq(int target_dayplaner_seq) {
		this.target_dayplaner_seq = target_dayplaner_seq;
	}


	public String getStart_time() {
		return start_time;
	}


	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}


	public String getEnd_time() {
		return end_time;
	}


	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public int getExpected_cost() {
		return expected_cost;
	}


	public void setExpected_cost(int expected_cost) {
		this.expected_cost = expected_cost;
	}


	public String getTransportation() {
		return transportation;
	}


	public void setTransportation(String transportation) {
		this.transportation = transportation;
	}


	public String getTypes() {
		return types;
	}


	public void setTypes(String types) {
		this.types = types;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
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
		return "TimePlanerDto [seq=" + seq + ", target_dayplaner_seq=" + target_dayplaner_seq + ", start_time="
				+ start_time + ", end_time=" + end_time + ", location=" + location + ", expected_cost=" + expected_cost
				+ ", transportation=" + transportation + ", types=" + types + ", content=" + content + ", reg_date="
				+ reg_date + ", last_updated=" + last_updated + "]";
	}
	
	
}
