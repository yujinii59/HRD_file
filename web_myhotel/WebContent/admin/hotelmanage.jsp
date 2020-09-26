<%@page import="kr.stay.hotel.HotelDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="hotelMgr" class="kr.stay.hotel.HotelMgr" />
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리(관리자)</title>

<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>


</head>
<body style="margin-top: 20px;">
<%@ include file="admin_check.jsp" %>
<%@ include file="admin_top.jsp" %>
	
	<%
	ArrayList<HotelDto> list = hotelMgr.getHotelAll();
	for(HotelDto p:list){
	%>
<table style="width: 70%; margin-left: auto; margin-right: auto;">
	<tr>
		<td rowspan="3">
		<img src="../upload/<%=p.getImage() %>" width="200px">
		</td>
		<td>
			<table>
				<tr><td><%=p.getName() %></td></tr>
				<tr><td><%=p.getHotel_address() %></td></tr>
				<tr><td><%=p.getMin_person() %>명 - <%=p.getMax_person() %>명</td></tr> 
			</table>
		</td>		
		<td rowspan="3"><%=p.getPrice() %></td>
		<td rowspan="3" width="30"><input type="button" value="삭제" onclick="javascript:adhotelDel('<%=p.getNo() %>')"></td>
	</tr>
</table>
	<%	
	}
	%>
<%@ include file="admin_bottom.jsp" %>

<form action="hotelproc_admin.jsp?flag=delete" name = "hoteldelFrm" method="post">
<input type="hidden" name = "no">
</form>
</body>
</html>