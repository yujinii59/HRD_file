<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memberBean" class="kr.stay.member.MemberBean" />
<jsp:setProperty property="*" name="memberBean" />
<jsp:useBean id="memberMgr" class="kr.stay.member.MemberMgr" />

<%
boolean b = memberMgr.memberInsert(memberBean); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<%
if(b){
	response.sendRedirect("login.jsp");
}else{
%>
	<script>
	alert('회원가입 실패');
	location.href='register.jsp';
	</script>
<%
}
%>
</body>
</html>




