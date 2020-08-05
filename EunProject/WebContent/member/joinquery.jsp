<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
	<%
// 		String id = URLDecoder.decode(request.getParameter("id"), "utf-8");
	%>
	<sql:query var="idcheck" dataSource="jdbc/myoracle02">
<%-- 		SELECT COUNT(id) FROM EMEMBER WHERE ID ='<%=id %>'; --%>
		SELECT count(*) FROM EMEMBER 
	</sql:query>
	<%-- <c:set var="idcount" value="${idcheck}"></c:set>  --%>
<%-- 	<c:out value="${idcount}"></c:out> --%>
<hr>
	<c:out value="${idcheck.rowCount}"></c:out>
	<%
// 		int cnt = '${idcout}';
	%>
<%-- 	<%=idcheck %> --%>
<%-- 	<%if(${idcount}){ --%>
		
<%-- 	} %> --%>
	<
</body>
</html>