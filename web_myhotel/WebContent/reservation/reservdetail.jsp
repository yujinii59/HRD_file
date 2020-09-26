<%@page import="kr.stay.member.MemberDto"%>
<%@page import="kr.stay.reservation.ReserveDto"%>
<%@page import="kr.stay.hotel.HotelDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="memberMgr" class="kr.stay.member.MemberMgr" />    
<jsp:useBean id="reserveMgr" class="kr.stay.reservation.ReserveMgr" />
<jsp:useBean id="hotelMgr" class="kr.stay.hotel.HotelMgr"></jsp:useBean>

<%
request.setCharacterEncoding("utf-8");
String no = request.getParameter("no");
ReserveDto dto = reserveMgr.getReserve(no);
HotelDto hotel = hotelMgr.getHotel(dto.getHotel_no());
MemberDto member = memberMgr.getMember(dto.getGuest_id());
%>
    
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세보기</title>

<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>

</head>
<body style="margin-top: 20px">
<%@ include file="../guest/guest_top.jsp" %>
<br><br><br><br>
<table style="width: 70%; margin-left: auto; margin-right: auto;  font-size: 15px;">
	<tr style="background-color: gray; font-size: 15px;"><td style="text-align: center;"> 예 약 세 부 내 용 </td></tr>
	<tr>
		<td>
			<form action="reservproc.jsp" name = "bookingFrm" method="post">
			<table style="margin-left: auto; margin-right: auto;">
				<tr style = "text-align: center;">
					<td>호텔명</td>
					<td>
					<%=hotel.getName() %>
					</td>
				</tr>
				<tr style = "text-align: center;">
					<td>호텔위치</td>
					<td>
					<%=hotel.getHotel_address() %>
					</td>
				</tr>
				<tr style = "text-align: center;">
					<td> 가 격 </td>
					<td>
					<%=hotel.getPrice() %>
					</td>
				</tr>
				<tr style = "text-align: center;">
					<td>숙박예약날짜</td>
					<td>
						<%=dto.getStartdate() %> ~ <%=dto.getEnddate() %>
					</td>
				</tr>
				<tr style = "text-align: center;">
					<td>인원</td>
					<td><%=dto.getPersonsu() %></td>
				</tr>
				<tr style = "text-align: center;">
					<td>옵션</td>
					<td><%=dto.getOption() %></td>
				</tr>
				<tr style = "text-align: center;">
					<td>예약일자</td>
					<td><%=dto.getSdate() %></td>
				</tr>
				<tr style = "text-align: center;">
					<td>상태</td>
					<td><%=dto.getState() %></td>
				</tr>
				<tr style = "text-align: center;">
					<td>고객명</td>
					<td><%=member.getName() %></td>
				</tr>
				<tr style = "text-align: center;">
					<td>고객전화</td>
					<td><%=member.getPhone() %></td>
				</tr>
				<tr>
					<td colspan ="2" style="text-align: center;">
					<input type="button" value = "확인" onclick="javascript:reservCheck()">
					<input type = "button" value = "삭제" onclick = "javascript:reservDel('<%=dto.getNo() %>')">
					</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
</table>
<%@ include file="../guest/guest_bottom.jsp" %>
<form action="reservdel_g.jsp" name="greservdelFrm">
<input type="hidden" name="no">
</form>
</body>
</html>