<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.stay.hotel.HotelDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="hotelMgr" class="kr.stay.hotel.HotelMgr" />
    
<%
request.setCharacterEncoding("utf-8");
String zip_narea2 = request.getParameter("zip_narea2");
String startdate = request.getParameter("startdate");
String enddate = request.getParameter("enddate");
String personsu = request.getParameter("personsu");
String currency = request.getParameter("currency");

//out.println(zip_narea2 + " / " + startdate + "~" + enddate + " / " + personsu + "명 / " + currency);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약진행</title>

<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>


</head>
<body style="margin-top: 20px;">
<%@ include file="../guest/guest_top.jsp" %>
	
<%
if(zip_narea2 == null){
	ArrayList<HotelDto> list = hotelMgr.getHotelAll();
	for(HotelDto p:list){
		%>
	<table style="width: 70%; margin-left: auto; margin-right: auto;">
		<tr>
			<td rowspan="3">
			<img src="../upload/<%=p.getImage() %>" style="width: 280px">
			</td>
			<td>
				<table style="margin-left: auto; margin-right: auto; text-align: center;">
					<tr><td><%=p.getName() %></td></tr>
					<tr><td><%=p.getHotel_address() %></td></tr>
					<tr><td><%=p.getMin_person() %>명 - <%=p.getMax_person() %>명</td></tr> 
				</table>
			</td>		
			<td rowspan="3"><%=p.getPrice() %></td>
			<td rowspan="3" width="30"><input type="button" value="선택" onclick="javascript:ghotelDetail('<%=p.getNo() %>','<%=startdate %>','<%=enddate %>','<%=personsu %>','<%=currency %>')"></td>
		</tr>
	</table>
		<%	
		}
		%>
		
		<%
}else{
	ArrayList<HotelDto> list = hotelMgr.getHotelGu(zip_narea2,personsu);
	for(HotelDto p:list){
	%>
<table style="width: 90%; margin-left: auto; margin-right: auto;">
	<tr>
		<td rowspan="3">
		<img src="../upload/<%=p.getImage() %>" size="50">
		</td>
		<td>
			<table>
				<tr><td><%=p.getName() %></td></tr>
				<tr><td><%=p.getHotel_address() %></td></tr>
				<tr><td><%=p.getMin_person() %>명 - <%=p.getMax_person() %>명</td></tr> 
			</table>
		</td>		
		<td rowspan="3"><%=p.getPrice() %></td>
		<td rowspan="3" width="30"><input type="button" value="선택" onclick="javascript:ghotelDetail('<%=p.getNo() %>','<%=startdate %>','<%=enddate %>','<%=personsu %>','<%=currency %>')"></td>
	</tr>
</table>
	<%	
	}
}
	%>
	
<%@ include file="../guest/guest_bottom.jsp" %>

<form action="hoteldetail.jsp" name = "detailFrm" method="post">
<input type="hidden" name = "no">
<input type="hidden" name = "startdate">
<input type="hidden" name = "enddate">
<input type="hidden" name = "personsu">
<input type="hidden" name = "currency">
</form>
</body>
</html>