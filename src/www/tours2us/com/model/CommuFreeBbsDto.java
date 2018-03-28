package www.tours2us.com.model;

import java.io.Serializable;

public class CommuFreeBbsDto implements Serializable {
	private int seq;
	private int target_category_seq;
	private int target_user_seq;
	private String title;
	private String content;
	private String reg_date;
	private String last_updeated;
	private int status;
	
	
	
	public CommuFreeBbsDto(int seq, int target_category_seq, int target_user_seq, String title, String content,
			String reg_date, String last_updeated, int status) {
		super();
		this.seq = seq;
		this.target_category_seq = target_category_seq;
		this.target_user_seq = target_user_seq;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.last_updeated = last_updeated;
		this.status = status;
	}



	public int getSeq() {
		return seq;
	}



	public void setSeq(int seq) {
		this.seq = seq;
	}



	public int getTarget_category_seq() {
		return target_category_seq;
	}



	public void setTarget_category_seq(int target_category_seq) {
		this.target_category_seq = target_category_seq;
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



	public String getLast_updeated() {
		return last_updeated;
	}



	public void setLast_updeated(String last_updeated) {
		this.last_updeated = last_updeated;
	}



	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "CommuFreeBbsDto [seq=" + seq + ", target_category_seq=" + target_category_seq + ", target_user_seq="
				+ target_user_seq + ", title=" + title + ", content=" + content + ", reg_date=" + reg_date
				+ ", last_updeated=" + last_updeated + ", status=" + status + "]";
	}
	
	
	
	
	
	
	
}
