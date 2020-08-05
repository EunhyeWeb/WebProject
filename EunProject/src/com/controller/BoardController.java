package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.BoardBIZ;
import com.vo.BoardVO;

public class BoardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.endsWith("write")) {
			BoWrite(req, resp);
		} else if (uri.endsWith("list")) {
			BoList(req, resp);
		} else if (uri.endsWith("delete")) {
			BoDelete(req, resp);
		} else if (uri.endsWith("find")) {
			BoFind(req, resp);
		} else if (uri.endsWith("update")) {
			BoUpdate(req, resp);
		} else if (uri.endsWith("read")) {
			BoRead(req, resp);
		}
	}

	protected void BoWrite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		System.out.println("write 불러");
		BoardVO board = new BoardVO();

		board.setBnum(Integer.parseInt(req.getParameter("bnum")));
		board.setBname(req.getParameter("bname"));
		board.setBtitle(req.getParameter("title"));
		board.setContent(req.getParameter("content"));
		board.setFname(req.getParameter("fname"));
		board.setFpath(req.getParameter("fpath"));
		board.setNotice(req.getParameter("notice"));
		board.setWname(req.getParameter("nickname"));

		boolean ret = new BoardBIZ().BoardWrite(board);
		if (ret) {
			System.out.println("글 작성 성공");
			resp.sendRedirect("/EunProject/list");
		} else {
			resp.getWriter().print("<html><script>alert('WRITE FAIL');history.go(-1);</script></html>");
			System.out.println("글작성 실패");
		}
	}

	protected void BoList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		List<BoardVO> blist = new BoardBIZ().BoardList();
		RequestDispatcher rd = req.getRequestDispatcher("/board/list.jsp");
		req.setAttribute("blist", blist);
		rd.forward(req, resp);
	}

	protected void BoDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardVO board = new BoardVO();
		board.setNum(Integer.parseInt(req.getParameter("num")));
		System.out.println("delete : " + req.getParameter("num"));
		boolean ret = new BoardBIZ().BoardDelete(board);
		if (ret) {
			System.out.println("삭제성공");
			resp.sendRedirect("/EunProject/list");
		} else {
			System.out.println("삭제실패");
		}
	}

	protected void BoFind(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("글 수정 타야하는뎅");
		BoardVO board = new BoardVO();
		board.setNum(Integer.parseInt(req.getParameter("num")));
		BoardVO gboard = new BoardBIZ().BoardFind(board);
		RequestDispatcher rd = req.getRequestDispatcher("/board/update.jsp");
		req.setAttribute("board", gboard);
		rd.forward(req, resp);
	}

	protected void BoRead(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardVO board = new BoardVO();
		board.setNum(Integer.parseInt(req.getParameter("num")));
		BoardVO gboard = new BoardBIZ().BoardFind(board);
		RequestDispatcher rd = req.getRequestDispatcher("/board/read.jsp");
		req.setAttribute("board", gboard);
		rd.forward(req, resp);
	}

	protected void BoUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		BoardVO binfo = new BoardVO();
		binfo.setBtitle(req.getParameter("title"));
		binfo.setContent(req.getParameter("content"));
		binfo.setFname(req.getParameter("fname"));
		binfo.setFpath(req.getParameter("fpath"));
		binfo.setNotice(req.getParameter("notice"));
		binfo.setNum(Integer.parseInt(req.getParameter("num")));

		boolean ret = new BoardBIZ().BoardUpdate(binfo);
		if (ret) {
			System.out.println("수정성공");
			resp.sendRedirect("/EunProject/list");
		} else {
			System.out.println("수정실패");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
