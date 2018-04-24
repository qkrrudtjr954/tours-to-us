package www.tours2us.com.model;

import java.io.Serializable;

public class CommuAfterBbsDto implements Serializable {

	private int seq;
	private int target_planer_seq;
	private int target_user_seq;
	private String title;
	private String content;
	private String reg_date;
	private String last_updated;
	private int status;
	private String readcount;
	private String name; // Traveler 와 조인할 변수
	private String email; // Traveler 와 조인할 변수
	// search(무엇으로 검색할지 category)
	private String s_category;
	private String s_keyword;

	// paging(한페이지당 글 수)
	private int recordCountPerPage = 10;
	private int pageNumber = 0;

	private int start = 1;
	private int end = 10;

	// 추가
	private String profile;
	private int like_count;
	private int next_seq;
	private int prev_seq;
	private String next_title;
	private String prev_title;

	private int comment_count;

	public CommuAfterBbsDto() {
		// TODO Auto-generated constructor stub
	}

	public CommuAfterBbsDto(int seq, int target_planer_seq, int target_user_seq, String title, String content,
			String reg_date, String last_updated, int status, String readcount, String name, String email,
			String s_category, String s_keyword, int recordCountPerPage, int pageNumber, int start, int end,
			String profile, int like_count, int next_seq, int prev_seq, String next_title, String prev_title,
			int comment_count) {
		super();
		this.seq = seq;
		this.target_planer_seq = target_planer_seq;
		this.target_user_seq = target_user_seq;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
		this.status = status;
		this.readcount = readcount;
		this.name = name;
		this.email = email;
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.recordCountPerPage = recordCountPerPage;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
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

	public int getTarget_planer_seq() {
		return target_planer_seq;
	}

	public void setTarget_planer_seq(int target_planer_seq) {
		this.target_planer_seq = target_planer_seq;
	}

	public int getTarget_user_seq() {
		return target_user_seq;
	}

	public void setTarget_user_seq(int target_user_seq) {
		this.target_user_seq = target_user_seq;
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

	public String getReadcount() {
		return readcount;
	}

	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
		return "CommuAfterBbsDto [seq=" + seq + ", target_planer_seq=" + target_planer_seq + ", target_user_seq="
				+ target_user_seq + ", title=" + title + ", content=" + content + ", reg_date=" + reg_date
				+ ", last_updated=" + last_updated + ", status=" + status + ", name=" + name + ", email=" + email
				+ ", s_category=" + s_category + ", s_keyword=" + s_keyword + ", recordCountPerPage="
				+ recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end + ", profile="
				+ profile + ", like_count=" + like_count + ", next_seq=" + next_seq + ", prev_seq=" + prev_seq
				+ ", next_title=" + next_title + ", prev_title=" + prev_title + ", comment_count=" + comment_count
				+ "]";
	}

}
