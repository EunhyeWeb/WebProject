package common;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//// Connection & Close & Commit & rollback
public class JDBCTemplate {
	public static Connection getConnection() {
		Connection con = null;
		Context initContext = null;

		try {
			initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle02");
			con = ds.getConnection();
			con.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return con;
	}

	// server.xml 전역에 선언해둔 db 연결
	public static Connection getConnection02() {
		Connection con = null;
		Context initContext = null;

		try {
			initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle02");
			System.out.println("DS 호출" + ds);
			con = ds.getConnection();
			con.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return con;
	}

	// 연결 객체를 받아서 close(); 하겠다.
	public static void Close(Connection con) {
		try {
			if (!con.isClosed() && con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void Close(Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void Close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void Commit(Connection con) {
		try {
			if (!con.isClosed() && con != null) {
				con.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void Rollback(Connection con) {
		try {
			if (!con.isClosed() && con != null) {
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}