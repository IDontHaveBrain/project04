package project04.vo;

import java.util.Date;

public class Search {
	private int postid;
	private int accno;
	private String title;
	private Date uploaddate;
	private String uploaddate_s;
	private String content;
	public Search(int postid, int accno, String title, Date uploaddate, String content) {
		super();
		this.postid = postid;
		this.accno = accno;
		this.title = title;
		this.uploaddate = uploaddate;
		this.content = content;
	}
	public Search(int postid, int accno, String title, Date uploaddate, String uploaddate_s, String content) {
		super();
		this.postid = postid;
		this.accno = accno;
		this.title = title;
		this.uploaddate = uploaddate;
		this.uploaddate_s = uploaddate_s;
		this.content = content;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public int getAccno() {
		return accno;
	}
	public void setAccno(int accno) {
		this.accno = accno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(Date uploaddate) {
		this.uploaddate = uploaddate;
	}
	public String getUploaddate_s() {
		return uploaddate_s;
	}
	public void setUploaddate_s(String uploaddate_s) {
		this.uploaddate_s = uploaddate_s;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
