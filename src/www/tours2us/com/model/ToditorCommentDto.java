package www.tours2us.com.model;

import java.io.Serializable;
import java.util.Date;

public class ToditorCommentDto implements Serializable {
	

/*CREATE SEQUENCE EDITORCOMMENT_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE  EDITORCOMMENT(
SEQ NUMBER(8) PRIMARY KEY,
TARGET_USER_SEQ NUMBER(8),
TARGET_EDITOR_SEQ NUMBER(8),
FOREIGN KEY(TARGET_USER_SEQ)REFERENCES TRAVELER(SEQ),
FOREIGN KEY(TARGET_EDITOR_SEQ)REFERENCES EDITOR(SEQ),
CONTENT CLOB,
REG_DATE DATE,
LAST_UPDATED DATE,
STATUS NUMBER(3)
);*/
	
	private int seq;
	private int target_user_seq;
	private int target_editor_seq;
	private String content;
	private Date reg_date;
	private Date last_updated;
	private int stauts;
	private String name;
	private String profile; 
	
	public ToditorCommentDto() {
		// TODO Auto-generated constructor stub
	}

	
	public ToditorCommentDto(int seq, int target_user_seq, int target_editor_seq, String content, Date reg_date,
			Date last_updated, int stauts, String name, String profile) {
		super();
		this.seq = seq;
		this.target_user_seq = target_user_seq;
		this.target_editor_seq = target_editor_seq;
		this.content = content;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
		this.stauts = stauts;
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

	public int getTarget_editor_seq() {
		return target_editor_seq;
	}

	public void setTarget_editor_seq(int target_editor_seq) {
		this.target_editor_seq = target_editor_seq;
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

	public int getStauts() {
		return stauts;
	}

	public void setStauts(int stauts) {
		this.stauts = stauts;
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
		return "ToditorCommentDto [seq=" + seq + ", target_user_seq=" + target_user_seq + ", target_editor_seq="
				+ target_editor_seq + ", content=" + content + ", reg_date=" + reg_date + ", last_updated="
				+ last_updated + ", stauts=" + stauts + ", name=" + name + ", profile=" + profile + "]";
	}


	
	
	
	
}
