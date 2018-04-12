package www.tours2us.com.model;

import java.io.Serializable;

public class TotoGuideDto implements Serializable{

	private int seq;
	private String title;
	private String content;
	private String pic;
	private String location;
	private String filename;
	private int readcount;
	private int downcount;
	private String reg_date;
	private String last_updated;
	
	private String total_downcount;
	
	public TotoGuideDto() {
		// TODO Auto-generated constructor stub
	}

	
	public TotoGuideDto(int seq, String title, String content, String pic, String location, String filename,
			int readcount, int downcount, String reg_date, String last_updated) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.pic = pic;
		this.location = location;
		this.filename = filename;
		this.readcount = readcount;
		this.downcount = downcount;
		this.reg_date = reg_date;
		this.last_updated = last_updated;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getDowncount() {
		return downcount;
	}

	public void setDowncount(int downcount) {
		this.downcount = downcount;
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
	


	@Override
	public String toString() {
		return "TotoGuideDto [seq=" + seq + ", title=" + title + ", content=" + content + ", pic=" + pic + ", location="
				+ location + ", filename=" + filename + ", readcount=" + readcount + ", downcount=" + downcount
				+ ", reg_date=" + reg_date + ", last_updated=" + last_updated + "]";
	}


	
	
}
