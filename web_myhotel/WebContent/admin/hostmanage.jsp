<%@page import="kr.stay.host.HostDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="hostMgr" class="kr.stay.host.HostMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-호스트관리</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
</head>
<body style="margin-top: 20px;">
<%@ include file="admin_check.jsp" %>
<%@ include file="admin_top.jsp" %>

<table style="width: 70%;  margin-left: auto; margin-right: auto;">
  <tr style="background-color: #cc66ff; color: white;">
  	<th>아이디</th><th>전화번호</th><th>삭제</th>
  </tr>
  <%
  ArrayList<HostDto> list = hostMgr.getHostAll(); 
  for(HostDto h:list){
  %>
  <tr style="text-align: center;">
  	<td><%=h.getHostid() %></td>
  	<td><%=h.getHosttel() %></td>
  	<td><a href="javascript:hostDelete('<%=h.getHostid()%>')">삭제하기</a></td>
  </tr>
  <%	  
  }
  %>
</table>

<%@ include file="admin_bottom.jsp" %>

<form action="hostproc_admin.jsp?flag=delete" name="hostdeleteFrm" method="post">
<input type="hidden" name="hostid">
</form>
</body>
</html>
