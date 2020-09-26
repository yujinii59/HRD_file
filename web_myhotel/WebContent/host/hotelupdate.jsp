<%@page import="kr.stay.hotel.HotelDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="hotelMgr" class="kr.stay.hotel.HotelMgr"></jsp:useBean>

<%
HotelDto dto = hotelMgr.getHotel(request.getParameter("no"));
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 : 호텔 수정</title>

<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>
<script type="text/javascript">
function readURL(input){
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
		$('#img').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>

</head>
<body style="margin-top: 20px;">
<%@include file="host_check.jsp" %>
<%@include file="host_top.jsp" %>

<form action="hotelproc.jsp?flag=update" enctype="multipart/form-data" method="post">
<table style="width: 70%; margin-left: auto; margin-right: auto;">
	<tr><th colspan="2">호텔정보수정</th></tr>
	<tr>
		<td>호스트id</td>
		<td>
			<%=dto.getHost_id() %>
		</td>
	</tr>
	<tr>
		<td>호텔명</td>
		<td>
			<input type="text" name="name" value="<%=dto.getName() %>">
		</td>
	</tr>
	<tr>
		<td>호텔주소</td>
		<td>
			<input type="text" name="hotel_address" value="<%=dto.getHotel_address() %>">
		</td>
	</tr>
	<tr>
		<td>이미지</td>
	  <td>
        <div id = "image_container" style="width: 30px"></div>
        <input type="file" id="image"  accept="image/*" name="image" size="30" onchange="setThumbnail(event)">
        <script> 
 			function setThumbnail(event) { 
    			var reader = new FileReader(); 
			    reader.onload = function(event) {
			    	var img = document.createElement("img"); 
			    	img.setAttribute("src", event.target.result);
			    	document.querySelector("div#image_container").appendChild(img); 
			    }; 
			    reader.readAsDataURL(event.target.files[0]);
			} 
 		</script>
 		</td>

	</tr>
	<tr>
		<td>최소 인원</td>
		<td>
			<input type="text" name="min_person" value="<%=dto.getMin_person() %>">
		</td>
	</tr>
	<tr>
		<td>최대 인원</td>
		<td>
			<input type="text" name="max_person" value="<%=dto.getMax_person() %>">
		</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>
			<input type="text" name="price" value="<%=dto.getPrice() %>">
		</td>
	</tr>
	<tr>
		<td>설명</td>
		<td>
			<textarea rows="5" cols="60" name="detail"><%=dto.getDetail() %></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="hidden" name="no" value="<%=dto.getNo() %>">
			<input type="submit" value="수정">
			<input type="button" value="취소" onclick="history.back()">
		</td>
	</tr>
</table>
</form>

<%@include file="host_bottom.jsp" %>
</body>
</html>