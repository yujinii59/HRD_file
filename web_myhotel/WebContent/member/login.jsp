<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("idKey"); //세션 읽기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 로그인</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnLogin").addEventListener("click", funcLogin, false);
	document.getElementById("btnNewMember").addEventListener("click", funcNew, false);
	document.getElementById("btnHome").addEventListener("click", funcHome, false);
}

</script>
</head>
<body style = "margin-top: 20px;">
<br>
<%@ include file="../guest/guest_top.jsp" %>
<br><br><br><br><br><br><br><br><br><br>
<%
//if(id != null){
%>
<%-- 
	<b><%=id %>님 환영합니다</b>
	준비된 기능을 사용할 수 있어요<br>
	<a href="logout.jsp">로그아웃</a>
--%>
<%// }else{%>

	<form name="loginForm">
	<table style="margin-left: auto; margin-right: auto; border: 1px solid #444444;">
	  <tr align="center" style="background-color: gray;">
	  	<td style=" color:white;"  colspan="2"> 로그인 </td>
	  </tr>
	  <tr style="text-align: center;">
	  	<td style=" padding: 15px;">아이디 </td>
	  	<td style=" padding: 15px;"><input type="text" name="id"></td>
	  </tr>
	  <tr style="text-align: center;">
	  	<td style=" padding: 15px;">비밀번호</td>
	  	<td style=" padding: 15px;"><input type="password" name="passwd"></td>
	  </tr>
	  <tr style="text-align: center;">
	  	<td style="text-align: center; padding: 15px;" colspan = "2">
	  		<input type="button" value="로 그 인" id="btnLogin">&nbsp; 
	  		<input type="button" value="회원가입" id="btnNewMember">
	  	</td>
	  </tr>
	  <tr style="text-align: center;">
	  	<td style="text-align: center; padding: 15px;" colspan = "2">
	  		<input type="button" value="홈페이지" id="btnHome">
	  	</td>
	  </tr>
	</table>
	</form>
<%	
//}
%>
<br><br><br><br><br><br><br><br><br>
<%@ include file="../guest/guest_bottom.jsp" %>
</body>
</html>