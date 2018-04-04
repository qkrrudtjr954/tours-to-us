package www.tours2us.com.model;

public class Korea {
	public String name;
	public String keyword;
	
	public Korea() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Korea(String name, String keyword) {
		super();
		this.name = name;
		this.keyword = keyword;
	}



	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "Korea [name=" + name + ", keyword=" + keyword + "]";
	}
	
	
}
