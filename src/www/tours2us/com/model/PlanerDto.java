package www.tours2us.com.model;

import java.io.Serializable;

public class PlanerDto implements Serializable {

	private int seq;
	private int target_user_seq;
	private String title;
	private String location;
	private int status;
	private String to_date;
	private String from_date;
	private int range;
	private long total_cost;
	private String reg_date;
	private String last_updated;
	
	private String name;

	// 표지 url
	private String paper;
	
	//search(무엇으로 검색할지 category)
   private String s_category;    
   private String s_keyword; 
   
   //paging(한페이지당 글 수)
   private int recordCountPerPage = 10;
   private int pageNumber=0;
   
   private int start=1;
   private int end=10;

	public PlanerDto() {
		// TODO Auto-generated constructor stub
	}


	public PlanerDto(int seq, int target_user_seq, String title, String location, int status, String to_date,
			String from_date, int range, long total_cost, String reg_date, String last_updated, String paper,String name
			) {
		super();
		this.seq = seq;
		this.target_user_seq = target_user_seq;
		this.title = title;
		this.location = location;
		this.status = status;
		this.to_date = to_date;
		this.from_date = from_date;
		this.range = range;
		this.total_cost = total_cost;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
		this.paper = paper;
		this.name = name;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTo_date() {
		return to_date;
	}

	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}

	public String getFrom_date() {
		return from_date;
	}

	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public long getTotal_cost() {
		return total_cost;
	}

	public void setTotal_cost(long total_cost) {
		this.total_cost = total_cost;
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

	public String getPaper() {
		return paper;
	}

	public void setPaper(String paper) {
		this.paper = paper;
	}
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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


	@Override
	public String toString() {
		return "PlanerDto [seq=" + seq + ", target_user_seq=" + target_user_seq + ", title=" + title + ", location="
				+ location + ", status=" + status + ", to_date=" + to_date + ", from_date=" + from_date + ", range="
				+ range + ", total_cost=" + total_cost + ", reg_date=" + reg_date + ", last_updated=" + last_updated
				+ ", target_user_name=" + name + ", paper=" + paper + "]";
	}

	


}
