package www.tours2us.com.model;

import java.io.Serializable;

public class TotoGuideDto implements Serializable{

	private int seq;
	private String title;
	private String content;
	private String filename;
	private int readcount;
	private int downcount;
	private String reg_date;
	
	public TotoGuideDto() {
		// TODO Auto-generated constructor stub
	}

	public TotoGuideDto(int seq, String title, String content, String filename, int readcount, int downcount,
			String reg_date) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.readcount = readcount;
		this.downcount = downcount;
		this.reg_date = reg_date;
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

	@Override
	public String toString() {
		return "TotoGuideDto [seq=" + seq + ", title=" + title + ", content=" + content + ", filename=" + filename
				+ ", readcount=" + readcount + ", downcount=" + downcount + ", reg_date=" + reg_date + "]";
	}
	
	
}
