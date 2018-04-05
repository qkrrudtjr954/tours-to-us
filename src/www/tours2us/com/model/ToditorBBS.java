package www.tours2us.com.model;

import java.io.Serializable;
import java.util.Date;

public class ToditorBBS implements Serializable {
	
/*	CREATE SEQUENCE EDITOR_SEQ START WITH 1 INCREMENT BY 1;
	CREATE TABLE EDITOR(
	SEQ NUMBER(8) PRIMARY KEY,
	TARGET_USER_SEQ NUMBER(8),
	TARGET_CATEGORY_SEQ NUMBER(8),
	FOREIGN KEY(TARGET_USER_SEQ)REFERENCES TRAVELER(SEQ),
	FOREIGN KEY(TARGET_CATEGORY_SEQ)REFERENCES EDITORCATEGORY(SEQ),
	TITLE VARCHAR2(100),
	CONTENT CLOB,
	REG_DATE DATE,
	LAST_UPDATED DATE
	);*/
	
	private int seq;
	private int target_user_seq;
	private int target_category_seq;
	private String title;
	private String content;
	private String pic1;
	private Date reg_date;
	private Date last_date;
	private String category;
	private String name;
	private String profile;
	
	public ToditorBBS() {
		// TODO Auto-generated constructor stub
	}


	public ToditorBBS(int seq, int target_user_seq, int target_category_seq, String title, String content, String pic1,
			Date reg_date, Date last_date) {
		super();
		this.seq = seq;
		this.target_user_seq = target_user_seq;
		this.target_category_seq = target_category_seq;
		this.title = title;
		this.content = content;
		this.pic1 = pic1;
		this.reg_date = reg_date;
		this.last_date = last_date;
	}
	
	



	public ToditorBBS(int seq, int target_user_seq, int target_category_seq, String title, String content, String pic1,
			Date reg_date, Date last_date, String category, String name, String profile) {
		super();
		this.seq = seq;
		this.target_user_seq = target_user_seq;
		this.target_category_seq = target_category_seq;
		this.title = title;
		this.content = content;
		this.pic1 = pic1;
		this.reg_date = reg_date;
		this.last_date = last_date;
		this.category = category;
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

	public int getTarget_category_seq() {
		return target_category_seq;
	}

	public void setTarget_category_seq(int target_category_seq) {
		this.target_category_seq = target_category_seq;
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

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getLast_date() {
		return last_date;
	}

	public void setLast_date(Date last_date) {
		this.last_date = last_date;
	}

	
	public String getPic1() {
		return pic1;
	}


	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
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
		return "ToditorBBS [seq=" + seq + ", target_user_seq=" + target_user_seq + ", target_category_seq="
				+ target_category_seq + ", title=" + title + ", content=" + content + ", pic1=" + pic1 + ", reg_date="
				+ reg_date + ", last_date=" + last_date + ", category=" + category + ", name=" + name + ", profile="
				+ profile + "]";
	}





	



	
	
}
