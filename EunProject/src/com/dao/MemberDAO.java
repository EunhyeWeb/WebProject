package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.vo.MemberVO;
import static common.JDBCTemplate.*;

public class MemberDAO implements memberIn {
	private Connection conn;

	public MemberDAO(Connection conn) {
		this.conn = conn;
	}

	public boolean UserJoin(MemberVO userinfo) {
		PreparedStatement pstm = null;
		int qret = 0;
		boolean ret = false;
		try {
			pstm = conn.prepareStatement(mjoin);
			pstm.setString(1, userinfo.getId());
			pstm.setInt(2, userinfo.getPassword());
			pstm.setString(3, userinfo.getNickname());
			pstm.setString(4, userinfo.getBirth());
			pstm.setString(5, userinfo.getEmail());
			pstm.setString(6, userinfo.getGender());
			pstm.setString(7, userinfo.getPhonenum());
			qret = pstm.executeUpdate();
			if (qret > 0) {
				ret = true;
			} else {
				ret = false;
			}

		} catch (SQLException e) {
			Rollback(conn);
			System.out.println(e);
		} finally {
			Commit(conn);
		}
		return ret;
	}
	/*
	 * public int UserLogin(MemberVO userinfo) { PreparedStatement pstm = null;
	 * ResultSet qret = null; int ret = 0; String dbpw = "";
	 * 
	 * try { pstm = conn.prepareStatement(chpass); pstm.setString(1,
	 * userinfo.getId()); qret = pstm.executeQuery(); if (qret.next()) { // 입력된 id 에
	 * 해당하는 password 존재 dbpw = qret.getString("password"); if
	 * (Integer.parseInt(dbpw) == userinfo.getPassword()) { // id에 password 일치할때 ret
	 * = 1; } else { // 비밀번호 다를때 ret = 0; } } else { // 해당 id 존재하지 않을때 ret = -1; }
	 * 
	 * } catch (SQLException e) { System.out.println(e); Rollback(conn); } finally {
	 * Commit(conn); } return ret; }
	 */

	public int UserLogin(MemberVO userinfo) {
		PreparedStatement pstm = null;
		ResultSet qret = null;
		int ret = 0;
		String dbpw = "";

		try {
			pstm = conn.prepareStatement(chpass);
			pstm.setString(1, userinfo.getId());
			qret = pstm.executeQuery();
			if (qret.next()) { // 입력된 id 에 해당하는 password 존재
				dbpw = qret.getString("password");
				if (Integer.parseInt(dbpw) == userinfo.getPassword()) {
					// id에 password 일치할때
					ret = 1;
				} else { // 비밀번호 다를때
					ret = 0;
				}
			} else { // 해당 id 존재하지 않을때
				ret = -1;
			}

		} catch (SQLException e) {
			System.out.println(e);
			Rollback(conn);
		} finally {
			Commit(conn);
		}
		return ret;
	}

	public String UserNick(MemberVO userinfo) {
		PreparedStatement pstm = null;
		ResultSet qret = null;
		String ret = null;
		try {
			pstm = conn.prepareStatement(getnick);
			pstm.setString(1, userinfo.getId());
			qret = pstm.executeQuery();
			if (qret.next()) {
				ret = qret.getString("nickname");
			} else {
			}

		} catch (SQLException e) {
			System.out.println(e);
			Rollback(conn);
		} finally {
			Commit(conn);
		}
		return ret;
	}

	public boolean CheckID(MemberVO userinfo) {
		boolean ret = false;
		PreparedStatement pstm = null;
		ResultSet qret = null;
		try {
			pstm = conn.prepareStatement(checkid);
			pstm.setString(1, userinfo.getId());
			qret = pstm.executeQuery();
			if (qret.next()) {
				int rett = qret.getInt(1);
				if (rett == 1) {
					ret = true;
				} else {
					ret = false;
				}
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return ret;
	}

	public boolean CheckNick(MemberVO userinfo) {
		boolean ret = false;
		PreparedStatement pstm = null;
		ResultSet qret = null;
		try {
			pstm = conn.prepareStatement(checknick);
			pstm.setString(1, userinfo.getNickname());
			qret = pstm.executeQuery();
			if (qret.next()) {
				int rett = qret.getInt(1);
				if (rett == 1) {
					ret = true;
				} else {
					ret = false;
				}
			}
		} catch (SQLException e) {
			System.out.println(e);
		}

		return ret;
	}
}
