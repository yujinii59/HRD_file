<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOTEL RESERVATION</title>

<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>

<script type="text/javascript">

</script>

</head>
<body style = "margin-top: 20px">

<%@ include file="guest_top.jsp" %>
<table style="width: 90%; margin-left: auto; margin-right: auto;">
<% if(memid != null){%>
	<tr style = "text-align: center;">
		<td>
			<img src="../images/booking1.jpg">
		</td>
	</tr>
<%}else{%>
	<tr style="text-align: center;">
		<td>
		<img src="../images/booking2.jpg">
		</td>
	</tr>
<%} %>
	<tr style="text-align: center;">
		<td>
		<form action="../reservation/booking.jsp" method="post" name = "bookFrm">
		<b><select name="zip_narea2" style="text-align:center; width:400px; height:30px;">
			<option value="">여행가고 싶은 지역이 어디신가요?	
			<option value="종로구">종로구
			<option value="중구">중구
			<option value="용산구">용산구
			<option value="성동구">성동구
			<option value="광진구">광진구
			<option value="동대문구">동대문구
			<option value="중랑구">중랑구
			<option value="성북구">성북구
			<option value="강북구">강북구
			<option value="도봉구">도봉구
			<option value="노원구">노원구
			<option value="은평구">은평구
			<option value="서대문구">서대문구
			<option value="마포구">마포구
			<option value="양천구">양천구
			<option value="강서구">강서구
			<option value="구로구">구로구
			<option value="금천구">금천구
			<option value="영등포구">영등포구
			<option value="동작구">동작구
			<option value="관악구">관악구
			<option value="서초구">서초구
			<option value="강남구">강남구
			<option value="송파구">송파구
			<option value="강동구">강동구
		</select></b>
        <input type='date' name='startdate'>
        <input type='date' name='enddate'>
        <input type = "number" name = "personsu" value = "2" min = "1" style="text-align: center; width: 30px; height: 20px">
		<b><select name="currency" style="height: 30px;">
			<option value="1" selected>KRW
			<option value="0.089">JPY 
			<option value="0.00084">USD
			<option value="0.00071">EUR
		</select></b>
		<input type="button" value="검색" id="btnSearch" style="text-align: center; height: 30px;" onclick="javascript:funcSearchCheck()">
		</form>
		</td>
	</tr>
</table>
<%@ include file="guest_bottom.jsp" %>

</body>
</html>