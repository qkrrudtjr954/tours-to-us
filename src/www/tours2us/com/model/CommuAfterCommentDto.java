package www.tours2us.com.model;

import java.io.Serializable;

public class CommuAfterCommentDto implements Serializable {
	
	private int seq;
	private int target_user_seq;
	private int target_bbs_seq;
	private String content;
	private String reg_date;
	private String last_updated;
	private int status;
	
	
	public CommuAfterCommentDto() {
		// TODO Auto-generated constructor stub
	}
	
	public CommuAfterCommentDto(int seq, int target_user_seq, int target_bbs_seq, String content, String reg_date,
			String last_updated, int status) {
		super();
		this.seq = seq;
		this.target_user_seq = target_user_seq;
		this.target_bbs_seq = target_bbs_seq;
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


	public int getTarget_bbs_seq() {
		return target_bbs_seq;
	}


	public void setTarget_bbs_seq(int target_bbs_seq) {
		this.target_bbs_seq = target_bbs_seq;
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
		return "CommuAfterCommentDto [seq=" + seq + ", target_user_seq=" + target_user_seq + ", target_bbs_seq="
				+ target_bbs_seq + ", content=" + content + ", reg_date=" + reg_date + ", last_updated=" + last_updated
				+ ", status=" + status + "]";
	}
	
	
	
	
	
	
	
	
	
	
	

}
