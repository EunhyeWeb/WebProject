package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.biz.MemberBIZ;
import com.sun.glass.ui.Application;
import com.vo.MemberVO;

public class MemberController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.endsWith("join")) {
			MJoin(req, resp);
		} else if (uri.endsWith("login")) {
			MLogin(req, resp);
		} else if (uri.endsWith("idcheck")) {
			MCheck(req, resp);
		} else if (uri.endsWith("nickcheck")) {
			NickCheck(req, resp);
		} else if (uri.endsWith("logout")) {
			MLogout(req, resp);
		}
	}

	protected void MJoin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		MemberVO user = new MemberVO();
		user.setId(req.getParameter("id"));
		user.setPassword(Integer.parseInt(req.getParameter("pw")));
		user.setNickname(req.getParameter("nickname"));
		user.setBirth(req.getParameter("birth"));
		user.setEmail(req.getParameter("email"));
		user.setGender(req.getParameter("gender"));
		user.setPhonenum(req.getParameter("phone"));

		// Application.set
		boolean ret = new MemberBIZ().UserJoin(user);
		if (ret) {
			// ȸ������ ���������� session �� ���
			HttpSession session = req.getSession();
			session.setAttribute("nick", req.getParameter("nickname"));
			session.setAttribute("id", req.getParameter("id"));
//			RequestDispatcher rd = req.getRequestDispatcher("/member/success.jsp");
			RequestDispatcher rd = req.getRequestDispatcher("/list");
			req.setAttribute("uinfo", user);
			rd.forward(req, resp);
		} else {
			resp.getWriter().print("<html><script>alert('JOIN FAIL');history.go(-1);</script></html>");
			System.out.println("���ν���");
		}
	}

	protected void MLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		MemberVO user = new MemberVO();
		user.setId(req.getParameter("id"));
		user.setPassword(Integer.parseInt(req.getParameter("pw")));

		int mexit = new MemberBIZ().UserLogin(user);
		if (mexit == 1) {
			resp.getWriter().append("1");
			String nickname = new MemberBIZ().UserNick(user);
			HttpSession session = req.getSession();
			session.setAttribute("id", req.getParameter("id"));
			session.setAttribute("nick", nickname);
//			RequestDispatcher rd = req.getRequestDispatcher("/member/success.jsp");
			RequestDispatcher rd = req.getRequestDispatcher("/list");
			rd.forward(req, resp);
			// �Է��� id, nickname �� ���ǿ� �ֱ�
		} else if (mexit == 0) {

			System.out.println("id, pw �޶�޶�޶�");
			// ��й�ȣ �ٸ���
			// �α��� ���� ajax�� ����
		} else if (mexit == -1) {
			resp.getWriter().append("-1");
			System.out.println("id ���� ����");
			// �ش� id �������� ������
		} else {
			System.out.println("��¡");
		}
	}

	protected void MLogout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.invalidate();
		System.out.println("�α׾ƿ�");
		resp.getWriter().append("SESSION OUT");
		resp.sendRedirect("/EunProject");

	}

	protected void MCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVO user = new MemberVO();
		user.setId(req.getParameter("id"));
		System.out.println("CON"+req.getParameter("id"));
		boolean ret = new MemberBIZ().CheckID(user);
		if (ret) {
			//id�� �̹� �����Ҷ�
			resp.getWriter().append("1");
		} else {
			//��� ������ id �϶�
			resp.getWriter().append("-1");
		}
	}

	protected void NickCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVO user = new MemberVO();
		user.setNickname(req.getParameter("nick"));
		boolean ret = new MemberBIZ().CheckNick(user);
		if (ret) {
			resp.getWriter().append("1");
		} else {
			resp.getWriter().append("-1");
		}
	}

	protected void MList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
