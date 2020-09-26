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
<title>호텔 예약</title>

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
			<form action="reservproc.jsp?flag=insert" name = "bookingFrm" method="post">
			<table style="margin-left: auto; margin-right: auto;">
				<tr style = "text-align: center;">
					<td><input type = "hidden" name = "hotel_no" value="<%=dto.getNo() %>"></td>
					<td><input type = "hidden" name = "host_id" value="<%=dto.getHost_id() %>"></td>
					<td>호텔명</td>
					<td>
					<%=dto.getName() %>
					<input type = "hidden" name = "name" value="<%=dto.getName() %>">
					</td>
				</tr>
				<tr style = "text-align: center;">
					<td>호텔위치</td>
					<td>
					<%=dto.getHotel_address() %>
					<input type = "hidden" name = "hotel_address" value="<%=dto.getHotel_address() %>">
					</td>
				</tr>
				
				<%
				if(personsu.equals("null")){
				%>
				
				<tr style = "text-align: center;">
					<td> 가 격 </td>
					<td>
					<%=dto.getPrice() %>
					<input type = "hidden" name = "price" value="<%=dto.getPrice() %>">
					</td>
				</tr>
				<tr style = "text-align: center;">
					<td>예약날짜</td>
					<td>
						<table style = "text-align: center; margin-left: auto; margin-right: auto;">
							<tr style = "text-align: center;">
								<td>체크인</td><td>체크아웃</td>
							</tr>
							<tr style = "text-align: center;">
								<td><input type="date" name = "startdate"></td>
								<td><input type="date" name = "enddate"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr style = "text-align: center;">
					<td>인원</td>
					<td><input type="number" name = "personsu" value="2" min="<%=dto.getMin_person() %>" max="<%=dto.getMax_person() %>"></td>
				</tr>
				
				<%}else{ %>
				
				<tr style = "text-align: center;">
					<td> 가 격 </td>
					<td>
					<%=dto.getPrice() %> * <%=currency %>
					<input type = "hidden" name = "price" value="<%=dto.getPrice() %> * <%=currency %>">
					</td>
				</tr>
				<tr style = "text-align: center;">
					<td>예약날짜</td>
					<td>
						<table style = "text-align: center; margin-left: auto; margin-right: auto;">
							<tr style = "text-align: center;">
								<td>체크인</td><td>체크아웃</td>
							</tr>
							<tr style = "text-align: center;">
								<td>
								<%=startdate %>
								<input type = "hidden" name = "startdate" value="<%=startdate %>">
								</td>
								<td>
								<%=enddate %>
								<input type = "hidden" name = "enddate" value="<%=enddate %>">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr style = "text-align: center;">
					<td>인원</td>
					<td>
					<%=personsu %>
					<input type = "hidden" name = "personsu" value="<%=personsu %>">
					</td>
				</tr>
				<%}%>
				<tr style = "text-align: center;">
					<td>세부 옵션</td>
					<td>
					<ol>객실 시설</ol>
					<input type="checkbox" name = "option" value="싱글 침대">싱글 침대
					<input type="checkbox" name = "option" value="더블 침대">더블 침대	<br><br>
					<input type="checkbox" name = "option" value="오리/거위털 이불">오리/거위털 이불
					<input type="checkbox" name = "option" value="극세사 이불">극세사 이불
					<input type="checkbox" name = "option" value="차렵 이불">차렵 이불<br>
					<input type="checkbox" name = "option" value="뱀부 이불">뱀부 이불
					<input type="checkbox" name = "option" value="모달 이불">모달 이불<br>
					<input type="checkbox" name = "option" value="린넨이불">린넨이불
					<input type="checkbox" name = "option" value="면이불">면이불
					<input type="checkbox" name = "option" value="레이온 이불">레이온 이불<br><br>
					<input type="checkbox" name = "option" value="메모리폼베개">메모리폼베개
					<input type="checkbox" name = "option" value="라텍스베개">라텍스베개
					<input type="checkbox" name = "option" value="솜베개">솜베개<br>
					<input type="checkbox" name = "option" value="거위털 베개">거위털 베개
					<input type="checkbox" name = "option" value="메밀베개">메밀베개<br><br>
					<input type="checkbox" name = "option" value="전신 욕조">전신 욕조
					<input type="checkbox" name = "option" value="비데">비데<br>
					<input type="checkbox" name = "option" value="42인치 LCD TV">42인치 LCD TV
					<input type="checkbox" name = "option" value="50인치 OLED TV">50인치 OLED TV
					<input type="checkbox" name = "option" value="46인치 UHD OLED TV">46인치 UHD OLED TV<br><br>
					<input type="checkbox" name = "option" value="객실 금고">객실 금고
					<input type="checkbox" name = "option" value="책상">책상
					<input type="checkbox" name = "option" value="냉장고">냉장고<br><br>
					<ol>호텔 서비스</ol>
					<input type="checkbox" name = "option" value="조식 신청">조식(오전 8시 부터 오전 10시 까지)
					<input type="checkbox" name = "option" value="주차 시설 이용">주차(퇴실시간까지만 가능)
					<input type="checkbox" name = "option" value="발렛 이용 ">발렛(현장결제 40000원)<br>
					<input type="checkbox" name = "option" value="장애인 지원 객실">장애인 지원 객실
					<input type="checkbox" name = "option" value="영어 전용 객실">영어 전용 객실
					<input type="checkbox" name = "option" value="가족 객실">가족 객실(만 6세이하 어린이 동반시)<br>
					<input type="checkbox" name = "option" value="실내 수영장">실내 수영장
					<input type="checkbox" name = "option" value="피트니스시설">피트니스시설
					<input type="checkbox" name = "option" value="풀서비스 스파">풀서비스 스파<br>
					<input type="checkbox" name = "option" value="회의실">회의실
					<input type="checkbox" name = "option" value="컨퍼런스 센터">컨퍼런스 센터
					<input type="checkbox" name = "option" value="컴퓨터 스테이션">컴퓨터 스테이션<br>
					<input type="checkbox" name = "option" value="피트니스 강습">피트니스 강습
					<input type="checkbox" name = "option" value="골프 강습">골프 강습
					<input type="checkbox" name = "option" value="필라테스 강습">필라테스 강습
					<input type="checkbox" name = "option" value="요가 강습">요가 강습<br><br><br>
					
					</td>
				</tr>
				<tr>
					<td colspan ="2" style="text-align: center;">
					<input type="submit" value = "예약">
					<input type = "button" value = "취소" onclick="history.back()">
					</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
</table>
<%@ include file="../guest/guest_bottom.jsp" %>
</body>
</html>