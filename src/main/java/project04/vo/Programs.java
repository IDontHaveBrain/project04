package project04.vo;
import java.sql.Date;

public class Programs {
	private String pname;
	private String category;
	private String target;
	private String days;
	private int capacity;
	private Date span;
	private Date ptime;
	private String loc;
	private String contents;
	
	public Programs() {
		// TODO Auto-generated constructor stub
	}

	public Programs(String pname, String category, String target, String days, int capacity, Date span, Date ptime,
			String loc, String contents) {
		super();
		this.pname = pname;
		this.category = category;
		this.target = target;
		this.days = days;
		this.capacity = capacity;
		this.span = span;
		this.ptime = ptime;
		this.loc = loc;
		this.contents = contents;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public Date getSpan() {
		return span;
	}

	public void setSpan(Date span) {
		this.span = span;
	}

	public Date getPtime() {
		return ptime;
	}

	public void setPtime(Date ptime) {
		this.ptime = ptime;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
}
