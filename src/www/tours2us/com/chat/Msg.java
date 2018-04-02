package www.tours2us.com.chat;

import java.util.HashMap;

public class Msg {
	public int room;
	public String msg;
	public boolean isFirst;
	public static HashMap<String , Integer> roomSet = new HashMap<String, Integer>();
	@Override
	public String toString() {
		return this.room + ", " + this.msg  + ", " + this.isFirst;
	}
}
