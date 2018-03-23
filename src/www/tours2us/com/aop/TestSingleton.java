package www.tours2us.com.aop;

import java.util.HashSet;
import java.util.Set;

public class TestSingleton {
	private static TestSingleton instance = null;
	
	private TestSingleton() {
		
	}
	
	public static TestSingleton getInstance() {
		if(instance == null) {
			instance = new TestSingleton();
		}
		return instance;
	}
	// 로그인된 유저들의 아이디를 저장한다.
	public static Set<String> logined = new HashSet<>();
}
