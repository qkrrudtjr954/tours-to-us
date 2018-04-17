package www.tours2us.com.model;

import java.io.Serializable;

public class CommuFreeCategoryDto implements Serializable {
	
	private int seq;
	private String title;
	private String description;
	private int status;
	private String reg_date;
	private String last_updated;
	
	
	//추가
		private String profile;
		private int like_count;
		private int next_seq;
		private int prev_seq;
		private String next_title;
		private String prev_title;
		
		private int comment_count;

	
	public CommuFreeCategoryDto() {
		// TODO Auto-generated constructor stub
	}


	public CommuFreeCategoryDto(int seq, String title, String description, int status, String reg_date,
			String last_updated, String profile, int like_count, int next_seq, int prev_seq, String next_title,
			String prev_title, int comment_count) {
		super();
		this.seq = seq;
		this.title = title;
		this.description = description;
		this.status = status;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
		this.profile = profile;
		this.like_count = like_count;
		this.next_seq = next_seq;
		this.prev_seq = prev_seq;
		this.next_title = next_title;
		this.prev_title = prev_title;
		this.comment_count = comment_count;
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


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
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


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public int getLike_count() {
		return like_count;
	}


	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}


	public int getNext_seq() {
		return next_seq;
	}


	public void setNext_seq(int next_seq) {
		this.next_seq = next_seq;
	}


	public int getPrev_seq() {
		return prev_seq;
	}


	public void setPrev_seq(int prev_seq) {
		this.prev_seq = prev_seq;
	}


	public String getNext_title() {
		return next_title;
	}


	public void setNext_title(String next_title) {
		this.next_title = next_title;
	}


	public String getPrev_title() {
		return prev_title;
	}


	public void setPrev_title(String prev_title) {
		this.prev_title = prev_title;
	}


	public int getComment_count() {
		return comment_count;
	}


	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}


	@Override
	public String toString() {
		return "CommuFreeCategoryDto [seq=" + seq + ", title=" + title + ", description=" + description + ", status="
				+ status + ", reg_date=" + reg_date + ", last_updated=" + last_updated + ", profile=" + profile
				+ ", like_count=" + like_count + ", next_seq=" + next_seq + ", prev_seq=" + prev_seq + ", next_title="
				+ next_title + ", prev_title=" + prev_title + ", comment_count=" + comment_count + "]";
	}


	
	

}
