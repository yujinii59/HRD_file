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
<title>예약 상세보기(호스트)</title>

<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>

</head>
<body style="margin-top: 20px">
<%@ include file="host_check.jsp" %>
<%@ include file="host_top.jsp" %>
<br><br><br><br>
<table style="width: 70%; margin-left: auto; margin-right: auto;  font-size: 15px;">
	<tr style="background-color: gray; font-size: 15px;"><td style="text-align: center;"> 예 약 세 부 내 용 </td></tr>
	<tr>
		<td>
			<form action="reservup_host.jsp" name="hresupFrm" method="post">
			<table style="margin-left: auto; margin-right: auto;">
				<tr style = "text-align: center;">
					<td>번호</td>
					<td>
					<%=dto.getNo() %>
					<input type="hidden" name = "no" value="<%=dto.getNo() %>">
					</td>
				</tr>
				<tr style = "text-align: center;">
					<td>호텔등록번호</td>
					<td>
					<%=dto.getHotel_no() %>
					<input type="hidden" name = "hotel_no" value="<%=dto.getHotel_no() %>">
					</td>
				</tr>
				<tr style = "text-align: center;">
					<td>숙박예약날짜</td>
					<td>
						<%=dto.getStartdate() %> ~ <%=dto.getEnddate() %>
						<input type="hidden" name="startdate" value="<%=dto.getStartdate() %>">
						<input type="hidden" name="enddate" value="<%=dto.getEnddate() %>">
					</td>
				</tr>
				<tr style = "text-align: center;">
					<td>인원</td>
					<td><%=dto.getPersonsu() %>
					<input type="hidden" name="personsu" value="<%=dto.getPersonsu() %>"></td>
				</tr>
				<tr style = "text-align: center;">
					<td>옵션</td>
					<td><%=dto.getOption() %>
					<input type="hidden" name="option" value="<%=dto.getOption() %>"></td>
				</tr>
				<tr style = "text-align: center;">
					<td>예약일자</td>
					<td><%=dto.getSdate() %>
					<input type="hidden" name="sdate" value="<%=dto.getSdate() %>"></td>
				</tr>
				<tr style = "text-align: center;">
					<td>상태</td>
					<td>
					<select name="state">
						<option value="1">접수
						<option value="2">입금 확인 
						<option value="3">예약 진행중
						<option value="4">예약 완료
						<option value="5">예약 취소
					</select>
					</td>
				</tr>
				<tr style = "text-align: center;">
					<td>고객id</td>
					<td><%=dto.getGuest_id() %>
					<input type="hidden" name="guest_id" value="<%=dto.getGuest_id() %>">
					<input type="hidden" name="host_id" value="<%=dto.getHost_id() %>"></td>
				</tr>
				<tr>
					<td colspan ="2" style="text-align: center;">
					<input type="button" value = "수정" onclick="javascript:hreservUp()">
					<input type="button" value = "취소" onclick="history.back()">
					</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
</table>
<%@ include file="host_bottom.jsp" %>

</body>
</html>