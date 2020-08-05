package com.dao;

public interface memberIn {
	String mjoin = "INSERT INTO EMEMBER(NUM, ID, PASSWORD, NICKNAME, BIRTH, EMAIL, GENDER, PHONE)"
			+ " VALUES(USER_SEQ.NEXTVAL, ?, ?, ?, ? ,? ,?, ? )";

	String chpass = "SELECT PASSWORD FROM EMEMBER WHERE ID=?";

	String getnick = "SELECT NICKNAME FROM EMEMBER WHERE ID = ?";

	String checkid = "SELECT COUNT(id) FROM EMEMBER WHERE ID =?";
	
	String checknick = "SELECT COUNT(NICKNAME) FROM EMEMBER WHERE NICKNAME =?";

}
