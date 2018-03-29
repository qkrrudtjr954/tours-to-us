package www.tours2us.com.model;

import java.io.Serializable;

public class CommuAfterBbsDto implements Serializable {

	private int seq;
	private int target_planer_seq;
	private int target_user_seq;
	private String title;
	private String content;
	private String reg_date;
	private String last_updated;
	private int status;
	private String name;
	
	public CommuAfterBbsDto() {
		// TODO Auto-generated constructor stub
	}

	public CommuAfterBbsDto(int seq, int target_planer_seq, int target_user_seq, String title, String content,
			String reg_date, String last_updated, int status, String name) {
		super();
		this.seq = seq;
		this.target_planer_seq = target_planer_seq;
		this.target_user_seq = target_user_seq;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
		this.status = status;
		this.name = name;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "CommuAfterBbsDto [seq=" + seq + ", target_planer_seq=" + target_planer_seq + ", target_user_seq="
				+ target_user_seq + ", title=" + title + ", content=" + content + ", reg_date=" + reg_date
				+ ", last_updated=" + last_updated + ", status=" + status + ", name=" + name + "]";
	}
	
	
	
	
	





	
	
	
	
	
	
	
	
	

}
