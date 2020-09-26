<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="boardMgr" class="kr.stay.board.BoardMgr" />
<jsp:useBean id="dto" class="kr.stay.board.BoardDto" />

<%
String num = request.getParameter("num");
String spage = request.getParameter("page");
dto = boardMgr.getData(num);		//수정 대상 자료 읽기
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type = "text/css" href="../css/board.css">
<script type="text/javascript">
function check(){
	if(frm.pass.value == ""){
		frm.pass.focus();
		alert("암호를 반드시 입력해주세요!!!");
		return;
	}
	
	if(confirm("정말 수정할까요?")){
		frm.submit();
	}
}
</script>
</head>
<body style="margin-top: 20px">
<%@ include file="../guest/guest_top.jsp" %>
<h2 style="text-align: center;">** 글 수정 **</h2>
<form action="editsave.jsp" name = "frm" method="post">
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="page" value="<%=spage %>">
<table style="width: 70%; margin-left: auto; margin-right: auto;" border="1">
	<tr>
		<td>이름</td>
		<td>
			<input type="text" name="name" value="<%=dto.getName() %>">
		</td>
	</tr>
	<tr>
		<td>암호</td>
		<td>
			<input type="text" name="pass">
		</td>
	</tr>
	<tr>
		<td>메일</td>
		<td>
			<input type="text" name="mail" value="<%=dto.getMail() %>">
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
			<input type="text" name="title" value="<%=dto.getTitle() %>">
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea rows="10" style="width: 97%" name = "cont"><%=dto.getCont() %></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="button" value="수정완료" onclick="check()">&nbsp;
			<input type="button" value="목록보기" onclick="location.href='boardlist.jsp?page=<%=spage %>'">
		</td>
	</tr>
</table>
</form>
<%@ include file="../guest/guest_bottom.jsp" %>
</body>
</html>