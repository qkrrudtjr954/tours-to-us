package www.tours2us.com.model;

import java.io.Serializable;

public class PlanerDto implements Serializable {

	private int seq;
	private int target_user_seq;
	private String title;
	private String location;
	private int status;
	private String to_date;
	private String from_date;
	private long total_cost;
	private String reg_date;
	private String last_updated;

	// 표지 url
	private String paper;

	public PlanerDto() {
		// TODO Auto-generated constructor stub
	}

	public PlanerDto(int seq, int target_user_seq, String title, String location, int status, String to_date,
			String from_date, long total_cost, String reg_date, String last_updated, String paper) {
		super();
		this.seq = seq;
		this.target_user_seq = target_user_seq;
		this.title = title;
		this.location = location;
		this.status = status;
		this.to_date = to_date;
		this.from_date = from_date;
		this.total_cost = total_cost;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
		this.paper = paper;
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

	public void setTarget_user_seq(int target_user_seq) {
		this.target_user_seq = target_user_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTo_date() {
		return to_date;
	}

	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}

	public String getFrom_date() {
		return from_date;
	}

	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}

	public long getTotal_cost() {
		return total_cost;
	}

	public void setTotal_cost(long total_cost) {
		this.total_cost = total_cost;
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

	public String getPaper() {
		return paper;
	}

	public void setPaper(String paper) {
		this.paper = paper;
	}

	@Override
	public String toString() {
		return "PlanerDto [seq=" + seq + ", target_user_seq=" + target_user_seq + ", title=" + title + ", location="
				+ location + ", status=" + status + ", to_date=" + to_date + ", from_date=" + from_date
				+ ", total_cost=" + total_cost + ", reg_date=" + reg_date + ", last_updated=" + last_updated
				+ ", paper=" + paper + "]";
	}

}
