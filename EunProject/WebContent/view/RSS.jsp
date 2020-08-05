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
	
<!-- 	xml 파싱 -->
	<x:parse var= "wrss" xml = "${weather }"></x:parse>
	<x:out select="$wrss/rss/channel/title"/><br>
	현재날씨 <br/>
	기준시간 : <x:out select="$wrss/rss/channel/pubDate"/><br>
	기온 : <x:out select="$wrss/rss/channel/item/description/body/data/temp"/><br>
	습도 : <x:out select="$wrss/rss/channel/item/description/body/data/reh"/><br>
	강수확률 : <x:out select="$wrss/rss/channel/item/description/body/data/pop"/><br>
</c:catch>
</body>
</html>

<!-- 
https://www.weather.go.kr/w/weather/today.do#last-recent
https://www.weather.go.kr/weather/forecast/timeseries.jsp
4794033000
	동네 예보에서 원하는 지역을 찾아 좌표를 구함
	
	http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=4794033000
	에서 xml 로 데이터 추출
 -->