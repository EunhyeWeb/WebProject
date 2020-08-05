package com.biz;

import java.sql.Connection;
import static common.JDBCTemplate.*;

import com.dao.MemberDAO;
import com.vo.MemberVO;

public class MemberBIZ {
	public boolean UserJoin(MemberVO userinfo) {
		Connection con = getConnection();
		boolean ret = new MemberDAO(con).UserJoin(userinfo);
		Close(con);
		return ret;
	}

	public int UserLogin(MemberVO userinfo) {
		Connection con = getConnection();
		int ret = new MemberDAO(con).UserLogin(userinfo);
		Close(con);
		return ret;
	}

	public String UserNick(MemberVO userinfo) {
		Connection con = getConnection();
		String ret = new MemberDAO(con).UserNick(userinfo);
		Close(con);
		return ret;
	}

	public boolean CheckID(MemberVO userinfo) {
		Connection con = getConnection();
		boolean ret = new MemberDAO(con).CheckID(userinfo);
		Close(con);
		return ret;
	}
	
	public boolean CheckNick(MemberVO userinfo) {
		Connection con = getConnection();
		boolean ret = new MemberDAO(con).CheckNick(userinfo);
		Close(con);
		return ret;
	}
}
