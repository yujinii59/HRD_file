<%@page import="kr.stay.host.HostDto"%>
<%@page import="kr.stay.hotel.HotelDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="hotelMgr" class="kr.stay.hotel.HotelMgr" />

<%
request.setCharacterEncoding("utf-8");
String no = request.getParameter("no");
HotelDto dto = hotelMgr.getHotel(no);
String startdate = request.getParameter("startdate");
String enddate = request.getParameter("enddate");
String personsu = request.getParameter("personsu");
String currency = request.getParameter("currency");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 상세보기</title>

<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>

<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnBack").onclick = back;
}
</script>

</head>
<body style="margin-top: 20px;">
<%@ include file="../guest/guest_top.jsp" %>
<table style="width: 70%; margin-left:auto; margin-right: auto;">
	<tr>	
		<td style="text-align: left; padding: 20px">
			<img src="../upload/<%=dto.getImage() %>" style="width: 300px">
		</td>
		<td>
			<table>
				<tr>
					<td>호텔 이름</td><td><%=dto.getName() %></td>
				</tr>
				<tr>
					<td> 위 치 </td><td><%=dto.getHotel_address() %></td>
				</tr>
				<tr>
					<td> 가 격 </td><td><%=dto.getPrice() %></td>
				</tr>
				<tr>
					<td>수용 인원</td><td><%=dto.getMin_person() %>명 ~ <%=dto.getMax_person() %>명</td>
				</tr>
			</table>
			<hr>
			<table style = "width: 100%; text-align: center;">
				<tr>
					<td>
						호텔 설명<br>
						<%=dto.getDetail() %>
					</td>
				</tr>
				<tr>
					<td>
						<hr>
						<input type="button" value=" 예 약 진 행" onclick = "javascript: hotelProgress('<%=dto.getNo() %>','<%=startdate %>','<%=enddate %>','<%=personsu %>','<%=currency %>')">
						<input type = "button" value = " 뒤 로 가 기 " id="btnBack">
					</td>
				</tr>
			</table>
			<hr>
			<%=dto.getName() %> <%=dto.getHost_id() %>
		</td>
	</tr>
</table>
<%@ include file="../guest/guest_bottom.jsp" %>
<form action="hotelreserv.jsp" name = "reservFrm" method="post">
<input type = "hidden" name = "no">
<input type="hidden" name = "startdate">
<input type="hidden" name = "enddate">
<input type="hidden" name = "personsu">
<input type="hidden" name = "currency">
</form>
</body>
</html>