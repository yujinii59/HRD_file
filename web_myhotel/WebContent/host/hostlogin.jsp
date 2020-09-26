<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 로그인</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	hostloginForm.hostid.focus();
	document.getElementById("btnHostLogin").onclick = funcHostLogin;
	document.getElementById("btnMain").onclick = funcMain;
	document.getElementById("btnHostId").onclick = hostIdCheck;
	document.getElementById("btnHostJoin").onclick = joinCheck;
}
</script>

</head>
<body style="margin-top: 20px;">
<%@ include file="../host/host_top.jsp" %>
<br><br><br><br><br><br><br><br><br><br>
	<table style="width: 90%; margin-left: auto; margin-right: auto;">
		<tr>
			<td>
				<form name="hostloginForm" method = "post" action = "hostloginproc.jsp">
				<table style="margin-left: auto; margin-right: auto; border: 1px solid #444444;">
				  <tr style="background-color: gray;">
				  	<td style="text-align: center; color:white; padding: 15px;"  colspan="2"> 로그인 </td>
				  </tr>
				  <tr style="margin-left: 10px">
				  	<td style="padding: 15px;"><br><b> 아 이 디 </b><br></td>
				  	<td style=" padding: 15px;">
				  	<br><input type="text" name="hostid"><br>
				  	</td>
				  </tr>
				  <tr>
				  	<td style="padding: 15px;"><br><b>비밀번호</b><br></td>
				  	<td style=" padding: 15px;">
				  	<br><input type="text" name="hostpasswd"><br>
				  	</td>
				  </tr>
				  <tr>
				  	<td style="text-align: center; padding: 15px;" colspan="2">
				  		<br><input type="button" value="host_login" id="btnHostLogin"> 
				  	</td>
				  </tr>
				  <tr>
				  	<td style="text-align: center; padding: 15px;" colspan="2">
				  		<input type="button" value="main" id="btnMain"><br>
				  	</td>
				  </tr>
				</table>
				</form>
			</td>
			<td style="border-left: 1px solid black; padding: 15px;">
				<form name="hostjoinForm" method="post" action="hostjoinproc.jsp">
				<table style="margin-left: auto; margin-right: auto; border: 1px solid #444444;">
				  <tr style="background-color: gray;">
				  	<td style="text-align: center; color:white; padding: 15px;"  colspan="3"> 호스트 등록 </td>
				  </tr>
				  <tr>
				  	<td style="text-align: center; padding: 15px;"><br><b>  아 이 디   </b><br></td>
				  	<td style=" padding: 15px;">
				  	<br><input type="text" name="hostid" size = "15"><br>
				  	</td>
				  	<td style="text-align: center; padding: 15px;">
				  	<br><input type = "button" value="hostID중복확인" id = "btnHostId"><br>
				  	</td>
				  </tr>
				  <tr>
				  	<td style="text-align: center; padding: 15px;"><br><b> 비 밀 번 호 </b><br></td>
				  	<td colspan="2">
				  	<br><input type="password" name="hostpasswd" size = "29"><br>
				  	</td>
				  </tr>
				  <tr>
				  	<td style="text-align: center; padding: 15px;"><br><b>비밀번호 확인</b><br></td>
				  	<td colspan="2">
				  	<br><input type="password" name="hostrepasswd" size = "29"><br>
				  	</td>
				  </tr>
				  <tr>
				  	<td style="text-align: center; padding: 15px;"><br><b> 전 화 번 호 </b><br></td>
				  	<td colspan="2">
				  	<br><input type="text" name="hosttel" size = "29"><br>
				  	</td>
				  </tr>
				  <tr>
				  	<td style="text-align: center; padding: 15px;" colspan="3">
				  		<br><input type="button" value="호스트 등록" id="btnHostJoin"><br> 
				  	</td>
				  </tr>
				 
				</table>
				</form>
			</td>
		</tr>
	</table>
<br><br><br><br><br><br><br><br><br>
<%@ include file="host_bottom.jsp" %>
</body>
</html>