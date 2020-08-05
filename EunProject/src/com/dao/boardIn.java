package com.dao;

public interface boardIn {
	String bwrite = "INSERT INTO EBOARD(NUM, BNUM ,BNAME, BTITLE, BCONTENT, FNAME, FPATH, NOTICE ,WNAME)\r\n"
			+ "VALUES(BOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ? ,? ,?)";

	String blist = "SELECT * FROM EBOARD";

	String bdelete = "DELETE EBOARD where NUM = ?";

	String bfind = "SELECT * FROM EBOARD WHERE NUM=?";

	String bupdate = "UPDATE EBOARD SET BTITLE=?, BCONTENT=?, FNAME=?, FPATH=? , NOTICE=? WHERE NUM = ?";
}
