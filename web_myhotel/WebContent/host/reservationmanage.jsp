<%@page import="kr.stay.hotel.HotelDto"%>
<%@page import="kr.stay.reservation.ReserveDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="reserveMgr" class="kr.stay.reservation.ReserveMgr" scope="session" />
<jsp:useBean id="hotelMgr" class="kr.stay.hotel.HotelMgr" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리 - 호스트</title>

<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>

</head>
<body style="margin-top: 20px;">
<%@ include file="host_check.jsp" %>
<%@ include file="host_top.jsp" %>
<table style="width: 70%; margin-left: auto; margin-right: auto;  font-size: 15px;">
	<tr style="background-color: gray; font-size: 15px; color: white;">
	<th>주문번호</th><th>호텔명</th><th>예약일</th><th>인원수</th><th>상태</th><th>상세보기</th>
	</tr>
	<%
	String hostid = (String)session.getAttribute("hostidKey");
	ArrayList<ReserveDto> list = reserveMgr.getReserveHostid(hostid);
	
	if(list.size() == 0){
	%> 
	<tr>
		<td colspan="6">예약된 호텔이 없습니다.</td>
	</tr>
	<%	
	}else{
		for(ReserveDto reserv:list){
			HotelDto hotel = hotelMgr.getHotel(reserv.getHotel_no());
	%>
	<tr style="text-align: center;">
		<td><%=reserv.getNo() %></td>
		<td><%=hotel.getName() %></td>
		<td><%=reserv.getSdate() %></td>
		<td><%=reserv.getPersonsu() %></td>
		
		<td>
		<%
			switch(reserv.getState()){
			case "1" : out.println("접수"); break;
			case "2" : out.println("입금 확인"); break;
			case "3" : out.println("예약 진행중"); break;
			case "4" : out.println("예약 완료"); break;
			case "5" : out.println("예약 취소"); break;
			default: out.println("대기 중");
			}
		%>
		</td>
		<td><a href = "javascript:reservationDetail('<%=reserv.getNo() %>')">상세보기</a></td>
	</tr>
	<%	
		}
	}
	%>
</table>
<%@ include file="host_bottom.jsp" %>

<form action="reservdetail.jsp" name="resdetailFrm">
<input type="hidden" name="no">
</form>

</body>
</html>