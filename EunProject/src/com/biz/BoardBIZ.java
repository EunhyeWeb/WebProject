package com.biz;

import java.sql.Connection;
import java.util.List;

import static common.JDBCTemplate.*;
import com.dao.BoardDAO;
import com.vo.BoardVO;

public class BoardBIZ {
	public boolean BoardWrite(BoardVO board) {
		Connection con = getConnection();
		boolean ret = new BoardDAO(con).BoardWrite(board);
		Close(con);
		return ret;
	}

	public List<BoardVO> BoardList() {
		Connection con = getConnection();
		List<BoardVO> ret = new BoardDAO(con).BoardList();
		Close(con);
		return ret;
	}

	public boolean BoardDelete(BoardVO board) {
		Connection con = getConnection();
		boolean ret = new BoardDAO(con).BoardDelete(board);
		Close(con);
		return ret;
	}

	public BoardVO BoardFind(BoardVO board) {
		Connection con = getConnection();
		BoardVO ret = new BoardDAO(con).BoardFind(board);
		Close(con);
		return ret;
	}

	public boolean BoardUpdate(BoardVO board) {
		Connection con = getConnection();
		boolean ret = new BoardDAO(con).BoardUpdate(board);
		Close(con);
		return ret;
	}
}
