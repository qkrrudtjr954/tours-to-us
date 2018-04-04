package www.tours2us.com.model;

import java.io.Serializable;
import java.util.Date;

public class ToditorCategoryDto implements Serializable {

	
/*	CREATE SEQUENCE EDITORCATEGORY_SEQ START WITH 1 INCREMENT BY 1;
	CREATE TABLE EDITORCATEGORY(
	SEQ NUMBER(8) PRIMARY KEY,
	TITLE VARCHAR2(100),
	DISCRIPTION VARCHAR2(500),
	REG_DATE DATE,
	LAST_UPDATED DATE
	);*/
	
	private int seq;
	private String title;
	private String discription;
	private Date reg_date;
	private Date last_update;
	
	public ToditorCategoryDto() {
		// TODO Auto-generated constructor stub
	}

	public ToditorCategoryDto(int seq, String title, String discription, Date reg_date, Date last_update) {
		super();
		this.seq = seq;
		this.title = title;
		this.discription = discription;
		this.reg_date = reg_date;
		this.last_update = last_update;
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

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getLast_update() {
		return last_update;
	}

	public void setLast_update(Date last_update) {
		this.last_update = last_update;
	}

	@Override
	public String toString() {
		return "ToditorCategoryDto [seq=" + seq + ", title=" + title + ", discription=" + discription + ", reg_date="
				+ reg_date + ", last_update=" + last_update + "]";
	}
	
	
	
}
