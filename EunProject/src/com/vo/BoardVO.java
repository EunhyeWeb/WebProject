package com.vo;

public class BoardVO {
	private int num;
	private int bnum;
	private String bname;
	private String btitle;
	private String content;
	private String fname;
	private String fpath;
	private String wdate;
	private String notice;
	private int view;
	private String wname;

	public BoardVO() {
	}

	public BoardVO(int num, int bnum, String bname, String btitle, String content, String fname, String fpath,
			String wdate, String notice, int view, String wname) {
		super();
		this.num = num;
		this.bnum = bnum;
		this.bname = bname;
		this.btitle = btitle;
		this.content = content;
		this.fname = fname;
		this.fpath = fpath;
		this.wdate = wdate;
		this.notice = notice;
		this.view = view;
		this.wname = wname;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFpath() {
		return fpath;
	}

	public void setFpath(String fpath) {
		this.fpath = fpath;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

}