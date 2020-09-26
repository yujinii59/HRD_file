<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="hostMgr" class="kr.stay.host.HostMgr" />
     
<%
String hostid = (String)session.getAttribute("hostidKey");
HostDto dto = hostMgr.getInfo(hostid);
 
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 등록</title>

<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>

<script type="text/javascript">
window.onload = function(){
	hotFrm.name.focus();
	document.getElementById("btnZip").onclick = hotelZipCheck;
}
</script>

</head>
<body style="margin-top: 20px">
<%@include file="host_check.jsp" %>
<%@include file="host_top.jsp" %>

<form action="hotelproc.jsp?flag=insert&hostid=<%=hostid %>" name = "hotFrm" enctype="multipart/form-data" method="post">
<table style="width: 90%;  margin-left: auto; margin-right: auto;" >
	<tr><td><table style="width: 70%;  margin-left: auto; margin-right: auto;">
	<tr>
		<th colspan="2" style="background-color: gray;  font-size: 13px; color: white;"> 호텔 등록 </th>
	</tr>
	<tr>
		<td>호스트 id</td>
		<td><%=dto.getHostid() %></td>
	</tr>
	<tr>
		<td>호텔명</td>
		<td><input type = "text" name = "name"></td>
	</tr>
	<tr>
		<td>위치</td>
		<td>
		<input type="text" name="hotel_address" size="60"> 
		<input type="button" value="주소찾기" id="btnZip">
		</td>		
	</tr>
	<tr>
		<td>이미지</td>
		<td><input type = "file" name = "image"></td>
	</tr>
	<tr>
		<td>상세설명</td>
		<td><textarea rows="5" cols="60" name="detail"></textarea></td>
	</tr>
	<tr>
		<td>최소인원</td>
		<td><input type = "text" name = "min_person"></td>
	</tr>
	<tr>
		<td>최대인원</td>
		<td><input type = "text" name = "max_person"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type = "text" name = "price"></td>
	</tr>
	<tr>
		<td colspan="2" style = "text-align: center;">
		<br><br>
		<input type = "submit" value = "호텔 추가">
		<input type = "reset" value = "새로 입력">
		<input type = "button" value = "뒤로가기" onclick="history.back()">
		</td>
	</tr>
	</table></td></tr>
</table>
</form>

<%@include file="host_bottom.jsp" %>
</body>
</html>