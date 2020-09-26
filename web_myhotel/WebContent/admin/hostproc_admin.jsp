<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="hostMgr" class="kr.stay.host.HostMgr" />
    
<%
String flag = request.getParameter("flag");
String hostid = request.getParameter("hostid");
boolean result = false;

if(flag.equals("delete")){
	//System.out.println("delete");
	result = hostMgr.deleteHost(hostid); 
	
}else{
	response.sendRedirect("hostmanage.jsp");
}

if(result){
%>
	<script>
		alert("정상 처리되었습니다.");
		location.href="hostmanage.jsp";
	</script>
<%
}else{
%>
	<script>
		alert("오류 발생\n관리자에게 문의 바람");
		location.href="hostmanage.jsp";
	</script>
<%
}
%>