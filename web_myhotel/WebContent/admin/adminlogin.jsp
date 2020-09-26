<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnAdminLogin").addEventListener("click", funcAdminLogin, false);
	document.getElementById("btnAdminHome").addEventListener("click", home, false);
}

</script>
</head>
<body style = "margin-top: 20px;">
<br>
<%@ include file="../admin/admin_top.jsp" %>
<br><br><br><br><br><br><br><br><br><br>
	<form name="adminloginForm" action="adminloginproc.jsp" method="post">
	<table style="margin-left: auto; margin-right: auto; border: 1px solid #444444;">
	  <tr align="center" style="background-color: gray;">
	  	<td style=" color:white;"  colspan="2"> 관리자 로그인 </td>
	  </tr>
	  <tr style="text-align: center;">
	  	<td style=" padding: 15px;">관리자 id </td>
	  	<td style=" padding: 15px;"><input type="text" name="adminid"></td>
	  </tr>
	  <tr style="text-align: center;">
	  	<td style=" padding: 15px;">password</td>
	  	<td><input type="text" name="adminpasswd"></td>
	  </tr>
	  <tr style="text-align: center;">
	  	<td style="text-align: center; padding: 15px;" colspan="2">
	  		<input type="button" value="관리자로그인" id="btnAdminLogin">&nbsp; 
	  		<input type="button" value="홈페이지" id="btnAdminHome">
	  	</td>
	  </tr>
	</table>
	</form>
<%	
//}
%>
<br><br><br><br><br><br><br><br><br>
<%@ include file="../admin/admin_bottom.jsp" %>
</body>
</html>