package www.tours2us.com.model;

import java.io.Serializable;
import java.util.Date;

public class CommuFreeCommentDto implements Serializable {
	
	private int seq;
	private int target_user_seq;
	private int target_free_seq;
	private String content;
	private Date reg_date;
	private Date last_updated;
	private int status;
	private String name;
	
	private String profile;
	
	public CommuFreeCommentDto() {
		// TODO Auto-generated constructor stub
	}

	

	public CommuFreeCommentDto(int seq, int target_user_seq, int target_free_seq, String content, Date reg_date,
			Date last_updated, int status, String name, String profile) {
		super();
		this.seq = seq;
		this.target_user_seq = target_user_seq;
		this.target_free_seq = target_free_seq;
		this.content = content;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
		this.status = status;
		this.name = name;
		this.profile = profile;
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

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getLast_updated() {
		return last_updated;
	}

	public void setLast_updated(Date last_updated) {
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
	
	
	public String getProfile() {
		return profile;
	}



	public void setProfile(String profile) {
		this.profile = profile;
	}



	@Override
	public String toString() {
		return "CommuFreeCommentDto [seq=" + seq + ", target_user_seq=" + target_user_seq + ", target_free_seq="
				+ target_free_seq + ", content=" + content + ", reg_date=" + reg_date + ", last_updated=" + last_updated
				+ ", status=" + status + ", name=" + name + "]";
	}
	
	
	

}
