package www.tours2us.com.model;

import java.io.Serializable;

public class CommuFreeCommentDto implements Serializable {
	
	private int seq;
	private int target_user_seq;
	private int target_free_seq;
	private String content;
	private String reg_date;
	private String last_updated;
	private int status;
	
	public CommuFreeCommentDto() {
		// TODO Auto-generated constructor stub
	}

	public CommuFreeCommentDto(int seq, int target_user_seq, int target_free_seq, String content, String reg_date,
			String last_updated, int status) {
		super();
		this.seq = seq;
		this.target_user_seq = target_user_seq;
		this.target_free_seq = target_free_seq;
		this.content = content;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
		this.status = status;
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

	public int getTarget_free_seq() {
		return target_free_seq;
	}

	public void setTarget_free_seq(int target_free_seq) {
		this.target_free_seq = target_free_seq;
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

	@Override
	public String toString() {
		return "CommuFreeCommentDto [seq=" + seq + ", target_user_seq=" + target_user_seq + ", target_free_seq="
				+ target_free_seq + ", content=" + content + ", reg_date=" + reg_date + ", last_updated=" + last_updated
				+ ", status=" + status + "]";
	}

	
	
	
	

}
