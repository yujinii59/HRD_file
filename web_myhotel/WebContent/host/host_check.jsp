<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String hostId = (String)session.getAttribute("hostidKey");
if(hostId == null){
	response.sendRedirect("hostlogin.jsp");
}
%>