<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bean" class="kr.stay.member.MemberBean" />
<jsp:setProperty property="*" name="bean" />
<jsp:useBean id="memberMgr" class="kr.stay.member.MemberMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정 (관리자)</title>
</head>
<body>
<%
boolean b = memberMgr.memberUpdate(bean, bean.getId());

if(b){
%>
	<script type="text/javascript">
	alert("수정 성공");
	location.href = "membermanage.jsp";
	</script>
<%}else{%>
	<script type="text/javascript">
	alert("수정 실패");
	history.back();
	</script>
<%	
}
%>
</body>
</html>





