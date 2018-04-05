package www.tours2us.com.model;

import java.io.Serializable;
import java.util.Date;

public class PagingVo implements Serializable {
	
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
	 	
  //search 
	private String s_category;
	private String s_keyword;
	
	//paging 
	private int recordCountPerPage = 9;
	private int pageNumber=0;
	
	private int start=1;
	private int end=9;
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
	public String getPic1() {
		return pic1;
	}
	public void setPic1(String pic1) {
		this.pic1 = pic1;
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
	public String getS_category() {
		return s_category;
	}
	public void setS_category(String s_category) {
		this.s_category = s_category;
	}
	public String getS_keyword() {
		return s_keyword;
	}
	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

	

		
}
