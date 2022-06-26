package project04.vo;

public class Rez {
	private int rezid;
	private int accno;
	private String pname;
	public Rez() {
		// TODO Auto-generated constructor stub
	}
	public Rez(int rezid, int accno, String pname) {
		super();
		this.rezid = rezid;
		this.accno = accno;
		this.pname = pname;
	}
	public int getRezid() {
		return rezid;
	}
	public void setRezid(int rezid) {
		this.rezid = rezid;
	}
	public int getAccno() {
		return accno;
	}
	public void setAccno(int accno) {
		this.accno = accno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}

}
