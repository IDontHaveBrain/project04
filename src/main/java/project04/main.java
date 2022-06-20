package project04;

import project04.vo.Account;

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// test dgdfgsdgsgsdgdsf testss
		DAO dao = new DAO();
		Account a1 = dao.getAccount(1);
		System.out.println(a1.getBirthday());
	}
}
