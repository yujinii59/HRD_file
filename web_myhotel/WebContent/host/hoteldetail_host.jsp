<%@page import="kr.stay.hotel.HotelDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="hotelMgr" class="kr.stay.hotel.HotelMgr" />
<jsp:useBean id="hostMgr" class="kr.stay.host.HostMgr"></jsp:useBean>

<%
String hostid = (String)session.getAttribute("hostidKey");
String no = request.getParameter("no");
HotelDto dto = hotelMgr.getHotel(no);
HostDto host = hostMgr.getInfo(hostid);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 상세보기</title>

<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>

</head>
<body style="margin-top: 20px;">
<%@ include file="host_check.jsp" %>
<%@ include file="host_top.jsp" %>
<table style="width: 70%; margin-left:auto; margin-right: auto;">
	<tr style="vertical-align: top;">
		<td style="padding: 15px;">
			<img src="../upload/<%=dto.getImage() %>" width="150">
		</td>
		<td style="padding: 15px;">
			<table style = "text-align: center; width: 100%">
				<tr>
					<td>호텔 이름</td><td><%=dto.getName() %></td>
				</tr>
				<tr>
					<td> 위 치 </td><td><%=dto.getHotel_address() %></td>
				</tr>
				<tr>
					<td> 가 격 </td><td>1박 : <%=dto.getPrice() %>원</td>
				</tr>
				<tr>
					<td>수용 인원</td><td><%=dto.getMin_person() %>명 ~ <%=dto.getMax_person() %>명</td>
				</tr>
			</table>
			<hr>
			<table style = "width: 100%">
				<tr>
					<td>
						호텔 설명<br>
						<%=dto.getDetail() %>
					</td>
				</tr>
			</table>
			<hr>
			<table style = "width: 100%; text-align: center;">
				<tr>
					<td>
			<%=dto.getName() %> <%=dto.getHost_id() %> <%=host.getHosttel() %><br>
					</td>
				</tr>
				<tr>
					<td>
			<input type="button" value = "확인" onclick="history.back()">
					</td>
				</tr>
			</table>
	</tr>
</table>
<%@ include file="host_bottom.jsp" %>
<form action="hotelupdate.jsp" name="updateForm" method="post">
	<input type="hidden" name="no">
</form>

<!-- 수정은 화면을 띄워야하므로 update.jsp로 가고 삭제는 그냥 진행하면 되므로 proc.jsp를 부른다. -->

<form action="hotelproc.jsp?flag=delete" name="delForm" method="post">
	<input type="hidden" name="no">
</form>
</body>
</html>