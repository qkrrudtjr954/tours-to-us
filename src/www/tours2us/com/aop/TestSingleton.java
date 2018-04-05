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

	
}
