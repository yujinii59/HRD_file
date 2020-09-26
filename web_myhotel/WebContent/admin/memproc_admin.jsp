<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="memberMgr" class="kr.stay.member.MemberMgr" />
    
<%
String flag = request.getParameter("flag");
String id = request.getParameter("id");
boolean result = false;

if(flag.equals("delete")){
	//System.out.println("delete");
	result = memberMgr.deleteMem(id);
	
}else{
	response.sendRedirect("membermanage.jsp");
}

if(result){
%>
	<script>
		alert("정상 처리되었습니다.");
		location.href="membermanage.jsp";
	</script>
<%
}else{
%>
	<script>
		alert("오류 발생\n관리자에게 문의 바람");
		location.href="membermanage.jsp";
	</script>
<%
}
%>