<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="hostMgr" class="kr.stay.host.HostMgr" />

<%
request.setCharacterEncoding("utf-8");
String hostid = request.getParameter("hostid");
String hostpasswd = request.getParameter("hostpasswd");

boolean b = hostMgr.loginCheck(hostid, hostpasswd); 

if(b){
	session.setAttribute("hostidKey", hostid);
	response.sendRedirect("host_index.jsp");
}else{
%>
	<script>
	alert("호스트 로그인 입력 오류!!!");
	location.href = "hostlogin.jsp";
	</script>
<%	
}
%>