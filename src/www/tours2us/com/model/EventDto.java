package www.tours2us.com.model;

import java.io.Serializable;

public class EventDto implements Serializable {
	private int seq;
	private String title;
	private String content;
	private String from_date;
	private String to_date;
	private String last_dated;
	private String reg_date;
	private int status;
	
	public EventDto() {
		// TODO Auto-generated constructor stub
	}

	public EventDto(int seq, String title, String content, String from_date, String to_date, String last_dated,
			String reg_date, int status) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.from_date = from_date;
		this.to_date = to_date;
		this.last_dated = last_dated;
		this.reg_date = reg_date;
		this.status = status;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFrom_date() {
		return from_date;
	}

	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}

	public String getTo_date() {
		return to_date;
	}

	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}

	public String getLast_dated() {
		return last_dated;
	}

	public void setLast_dated(String last_dated) {
		this.last_dated = last_dated;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "EventDto [seq=" + seq + ", title=" + title + ", content=" + content + ", from_date=" + from_date
				+ ", to_date=" + to_date + ", last_dated=" + last_dated + ", reg_date=" + reg_date + ", status="
				+ status + "]";
	}
	
	
}
