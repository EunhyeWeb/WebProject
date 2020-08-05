<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body style="margin: 100px 100px 100px 100px">
	<c:catch var="err">
		<c:import
			url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=5011025600"
			var="weather"></c:import>
	
<!-- 	xml �Ľ� -->
	<x:parse var= "wrss" xml = "${weather }"></x:parse>
	<x:out select="$wrss/rss/channel/title"/><br>
	���糯�� <br/>
	���ؽð� : <x:out select="$wrss/rss/channel/pubDate"/><br>
	��� : <x:out select="$wrss/rss/channel/item/description/body/data/temp"/><br>
	���� : <x:out select="$wrss/rss/channel/item/description/body/data/reh"/><br>
	����Ȯ�� : <x:out select="$wrss/rss/channel/item/description/body/data/pop"/><br>
</c:catch>
</body>
</html>

<!-- 
https://www.weather.go.kr/w/weather/today.do#last-recent
https://www.weather.go.kr/weather/forecast/timeseries.jsp
4794033000
	���� �������� ���ϴ� ������ ã�� ��ǥ�� ����
	
	http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=4794033000
	���� xml �� ������ ����
 -->