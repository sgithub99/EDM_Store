package test;

import org.mindrot.jbcrypt.BCrypt;

public class Main {
	public static void main(String[] args) {
		String password = "123456";
		String hash = BCrypt.hashpw(password, BCrypt.gensalt(12));
		
		boolean checkPass = BCrypt.checkpw(password, "$2a$12$F6oavvumKj5HzgFLHeS9tOsTTUjYYGItNCDhnJK8thwwC9gke3iZe");
		System.out.println(checkPass);
//		System.out.println(hash);
	}

}
