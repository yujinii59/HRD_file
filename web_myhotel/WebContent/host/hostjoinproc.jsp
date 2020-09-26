<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="hostBean" class="kr.stay.host.HostBean" />
<jsp:setProperty property="*" name="hostBean" />
<jsp:useBean id="hostMgr" class="kr.stay.host.HostMgr" />

<%
boolean b = hostMgr.hostInsert(hostBean); 
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트등록여부</title>
</head>
<body style = "margin-top: 20px;">
<br>
<%
if(b){	
	response.sendRedirect("hostlogin.jsp");
}else{
%>
	<script>
	alert("호스트 등록 실패...");
	location.href = "hostlogin.jsp";
	</script>
<%
}
%>

</body>
</html>