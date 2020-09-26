<%@page import="kr.stay.hotel.HotelDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="hotelMgr" class="kr.stay.hotel.HotelMgr" />

<%
String hostid = (String)session.getAttribute("hostidKey");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 관리-호스트</title>

<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>

</head>
<body style="margin-top: 20px;">
<%@include file = "host_check.jsp" %><!-- 로그인안하면 상품데이터 볼 수 없다. -->
<%@include file = "host_top.jsp" %>
<table style="width: 70%; margin-left: auto; margin-right: auto;">
	
	<%
	ArrayList<HotelDto> list = hotelMgr.getHotelHostAll(hostid);
	if(list.size() == 0){
	%>
	<tr>
		<td colspan="8">
		등록된 상품이 없습니다.
		</td>
	</tr>
	
	<%	
	}else{
		for(HotelDto p:list){
	%>
			<tr style="text-align: center;">
			
				<td rowspan="3" style="width: 30%">
				<img src="../upload/<%=p.getImage() %>" width=100 />
				</td>
				<td style="width: 50%">
					<table style="width: 100%;margin-left: auto; margin-right: auto;">
						<tr><td><%=p.getName() %></td></tr>
						<tr><td><%=p.getHotel_address() %></td></tr>
						<tr><td><%=p.getMin_person() %>명 ~ <%=p.getMax_person() %>명</td></tr>
					</table>
				</td>
				<td rowspan="3" style="width: 10%">
				1박 : <%=p.getPrice() %>원
				</td>
				<td rowspan="3" style="width: 10%">
				<input type="button" value="수정" onclick="javascript:hotelUpdate('<%=p.getNo() %>')"><p/>
				<input type="button" value="삭제" onclick="javascript:hotelDel('<%=p.getNo() %>')">
				</td>				
			</tr>
	<%		
		}
	%>
	<%	
	}
	%>
</table>
<%@include file = "host_bottom.jsp" %>

<form action="hotelupdate.jsp" name="updateForm" method="post">
	<input type="hidden" name="no">
</form>

<!-- 수정은 화면을 띄워야하므로 update.jsp로 가고 삭제는 그냥 진행하면 되므로 proc.jsp를 부른다. -->

<form action="hotelproc.jsp?flag=delete" name="delForm" method="post">
	<input type="hidden" name="no">
</form>
</body>
</html>