package test;

import java.util.Base64;
import java.util.Base64.Encoder;

public class Test {

	public static void main(String[] args) {
		String id = "fuxinf";
		String name = "付新峰";
		String token = "1F9BFC55107D99ADDA44BE759C392EB4C7BA3BC6A93BFA2C2E42A67483AFFB28CC7F54D45F4B7C9DE59FD7733FA77CCC";
		String templ = "{\"userid\":\"%s\", \"username\":\"%s\", \"token\":\"%s\"}";
		String json = String.format(templ, id, name, token);
		System.out.println(json.length());
		String hex = getHex(json);
		System.out.println(hex);
		System.out.println(hex.getBytes().length);
		Encoder encoder = Base64.getEncoder();
    	String base64 = encoder.encodeToString(json.getBytes());
    	System.out.println(base64);
    	System.out.println(base64.length());
	}
	
	private static String getHex(String str) {
		StringBuilder sb = new StringBuilder();
		for (int i=0; i<str.length(); i++){
			sb.append(Integer.toHexString(str.codePointAt(i)));
//			if (i < str.length() -1) {
//				sb.append("-");
//			}
		}
		return sb.toString();
	}

}
