package project04;

import project04.util.inputCheck;
import project04.vo.Account;

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// test dgdfgsdgsgsdgdsf testssssss
		DAO dao = new DAO();
		Account a1 = dao.getAccountNo(1);
		System.out.println(a1.getBirthday());
		System.out.println(dao.login("asdasd123", "123123"));
		String str1 = "";
		String str2 = null;
		System.out.println(inputCheck.isEmpty(str1));
		System.out.println(inputCheck.isEmpty(str2));
	}
}
