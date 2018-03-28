package www.tours2us.com.model;

import java.io.Serializable;

public class TravelerinfoDto implements Serializable {

/*	CREATE SEQUENCE TRAVELERINFO_SEQ START WITH 1 INCREMENT BY 1;
	CREATE TABLE  TRAVELERINFO(
	SEQ NUMBER(8) PRIMARY KEY,
	TARGET_USER_SEQ NUMBER(8),
	FOREIGN KEY(TARGET_USER_SEQ)REFERENCES TRAVELER(SEQ),
	DISPOSITION1 VARCHAR2(200),
	DISPOSITION2 VARCHAR2(200),
	DISPOSITION3 VARCHAR2(200),
	LIKE1 VARCHAR2(200),
	LIKE2 VARCHAR2(200),
	LIKE3 VARCHAR2(200),
	PROFILE VARCHAR2(200)
	);
*/
	
	private int seq;
	private int target_user_seq;
	private String dispositon1;
	private String dispositon2;
	private String dispositon3;
	private String like1;
	private String like2;
	private String like3;
	private String profile; 
	
	public TravelerinfoDto() {
		// TODO Auto-generated constructor stub
	}

	public TravelerinfoDto(int seq, int target_user_seq, String dispositon1, String dispositon2, String dispositon3,
			String like1, String like2, String like3, String profile) {
		super();
		this.seq = seq;
		this.target_user_seq = target_user_seq;
		this.dispositon1 = dispositon1;
		this.dispositon2 = dispositon2;
		this.dispositon3 = dispositon3;
		this.like1 = like1;
		this.like2 = like2;
		this.like3 = like3;
		this.profile = profile;
	}
	
	//확인용
	

	public TravelerinfoDto(int seq, int target_user_seq, String dispositon1, String dispositon2, String dispositon3) {
		super();
		this.seq = seq;
		this.target_user_seq = target_user_seq;
		this.dispositon1 = dispositon1;
		this.dispositon2 = dispositon2;
		this.dispositon3 = dispositon3;
	}

	public TravelerinfoDto(String dispositon1, String dispositon2, String dispositon3) {
		super();
		this.dispositon1 = dispositon1;
		this.dispositon2 = dispositon2;
		this.dispositon3 = dispositon3;
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

	public String getDispositon1() {
		return dispositon1;
	}

	public void setDispositon1(String dispositon1) {
		this.dispositon1 = dispositon1;
	}

	public String getDispositon2() {
		return dispositon2;
	}

	public void setDispositon2(String dispositon2) {
		this.dispositon2 = dispositon2;
	}

	public String getDispositon3() {
		return dispositon3;
	}

	public void setDispositon3(String dispositon3) {
		this.dispositon3 = dispositon3;
	}

	public String getLike1() {
		return like1;
	}

	public void setLike1(String like1) {
		this.like1 = like1;
	}

	public String getLike2() {
		return like2;
	}

	public void setLike2(String like2) {
		this.like2 = like2;
	}

	public String getLike3() {
		return like3;
	}

	public void setLike3(String like3) {
		this.like3 = like3;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "TravelerinfoDto [seq=" + seq + ", target_user_seq=" + target_user_seq + ", dispositon1=" + dispositon1
				+ ", dispositon2=" + dispositon2 + ", dispositon3=" + dispositon3 + ", like1=" + like1 + ", like2="
				+ like2 + ", like3=" + like3 + ", profile=" + profile + "]";
	}

	
	
}
