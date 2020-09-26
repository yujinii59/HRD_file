<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="hostMgr" class="kr.stay.host.HostMgr" scope="page" />
<%
request.setCharacterEncoding("utf-8");
String hostid = request.getParameter("hostid");
boolean b = hostMgr.checkHostId(hostid); 
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트id 중복 검사</title>

<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>

</head>
<body style="text-align: center; margin-top: 30px;">
<b><%=hostid %> : </b>
<%
if(b){
%>
	이미 사용 중인 id입니다.<p/>
	<a href="#" onclick="opener.document.hostjoinForm.hostid.focus(); window.close()">닫기</a>
<% }else{%>
	사용 가능합니다.<p/>
	<a href="#" onclick="opener.document.hostjoinForm.hostpasswd.focus(); window.close()">닫기</a>
<%
}
%>
</body>
</html>