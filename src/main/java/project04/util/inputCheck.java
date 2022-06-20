package project04.util;

public class inputCheck {

	private inputCheck() {
		super();
	}
	
	public static boolean isEmpty(String str) {
		return str==null||str.isBlank();
	}
}
