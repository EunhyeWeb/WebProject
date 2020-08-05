package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.biz.BoardBIZ;
import com.vo.BoardVO;
import static common.JDBCTemplate.*;

public class BoardDAO implements boardIn {
	private Connection conn;

	public BoardDAO(Connection conn) {
		this.conn = conn;
	}

	public boolean BoardWrite(BoardVO board) {
		PreparedStatement pstm = null;
		int qret = 0;
		boolean ret = false;

		try {
			pstm = conn.prepareStatement(bwrite);
			pstm.setInt(1, board.getBnum());
			pstm.setString(2, board.getBname());
			pstm.setString(3, board.getBtitle());
			pstm.setString(4, board.getContent());
			pstm.setString(5, board.getFname());
			pstm.setString(6, board.getFpath());
			pstm.setString(7, board.getNotice());
			pstm.setString(8, board.getWname());
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

	public List<BoardVO> BoardList() {
		PreparedStatement pstm = null;
		ResultSet ret = null;
		BoardVO cont = null;
		List<BoardVO> bolist = new ArrayList<BoardVO>();

		try {
			pstm = conn.prepareStatement(blist);
			ret = pstm.executeQuery();
			while (ret.next()) {
				cont = new BoardVO(ret.getInt("NUM"), ret.getInt("BNUM"), ret.getString("BNAME"),
						ret.getString("BTITLE"), ret.getString("BCONTENT"), ret.getString("FNAME"),
						ret.getString("FPATH"), ret.getString("WDATE"), ret.getString("NOTICE"), ret.getInt("BVIEW"),
						ret.getString("WNAME"));
				bolist.add(cont);
			}
		} catch (SQLException e) {
			Rollback(conn);
			System.out.println(e);
		} finally {
			Commit(conn);
		}
		return bolist;
	}

	public boolean BoardDelete(BoardVO board) {
		PreparedStatement pstm = null;
		boolean ret = false;
		try {
			pstm = conn.prepareStatement(bdelete);
			pstm.setInt(1, board.getNum());
			int qret = pstm.executeUpdate();
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

	public BoardVO BoardFind(BoardVO board) {
		PreparedStatement pstm = null;
		ResultSet ret = null;
		BoardVO binfo = null;

		try {
			pstm = conn.prepareStatement(bfind);
			pstm.setInt(1, board.getNum());
			ret = pstm.executeQuery();
			while (ret.next()) {
				binfo = new BoardVO(ret.getInt("NUM"), ret.getInt("BNUM"), ret.getString("BNAME"),
						ret.getString("BTITLE"), ret.getString("BCONTENT"), ret.getString("FNAME"),
						ret.getString("FPATH"), ret.getString("WDATE"), ret.getString("NOTICE"), ret.getInt("BVIEW"),
						ret.getString("WNAME"));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return binfo;
	}

	public boolean BoardUpdate(BoardVO board) {
		PreparedStatement pstm = null;
		boolean ret = false;
		try {
			pstm = conn.prepareStatement(bupdate);
			pstm.setString(1, board.getBtitle());
			pstm.setString(2, board.getContent());
			pstm.setString(3, board.getFname());
			pstm.setString(4, board.getFpath());
			pstm.setString(5, board.getNotice());
			pstm.setInt(6, board.getNum());
			int qret = pstm.executeUpdate();
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
}