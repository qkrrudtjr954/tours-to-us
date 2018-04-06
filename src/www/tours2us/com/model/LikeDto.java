package www.tours2us.com.model;

import java.io.Serializable;

public class LikeDto implements Serializable {
	
/*	CREATE SEQUENCE LIKE_SEQ START WITH 1 INCREMENT BY 1;
	CREATE TABLE LIKETABLE(
		SEQ NUMBER(8) PRIMARY KEY,   
		BBS_CATEGORY NUMBER(8), 
		TARGET_USER_SEQ NUMBER(8),
		FOREIGN KEY (TARGET_USER_SEQ) REFERENCES TRAVELER(seq),
		TARGET_BBS_SEQ NUMBER(8)
		);*/
	private int seq;
	private int bbs_category;
	private int target_user_seq;
	private int target_bbs_seq;
	
	public LikeDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	public LikeDto(int bbs_category, int target_user_seq, int target_bbs_seq) {
		super();
		this.bbs_category = bbs_category;
		this.target_user_seq = target_user_seq;
		this.target_bbs_seq = target_bbs_seq;
	}


	public LikeDto(int seq, int bbs_category, int target_user_seq, int target_bbs_seq) {
		super();
		this.seq = seq;
		this.bbs_category = bbs_category;
		this.target_user_seq = target_user_seq;
		this.target_bbs_seq = target_bbs_seq;
	}
	
	
	public LikeDto(int bbs_category, int target_bbs_seq) {
		super();
		this.bbs_category = bbs_category;
		this.target_bbs_seq = target_bbs_seq;
	}


	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getBbs_category() {
		return bbs_category;
	}

	public void setBbs_category(int bbs_category) {
		this.bbs_category = bbs_category;
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

	@Override
	public String toString() {
		return "LikeDto [seq=" + seq + ", bbs_category=" + bbs_category + ", target_user_seq=" + target_user_seq
				+ ", target_bbs_seq=" + target_bbs_seq + "]";
	}
	
	
}
