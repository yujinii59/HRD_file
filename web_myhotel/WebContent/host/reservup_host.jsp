<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="reservBean" class="kr.stay.reservation.ReserveBean" scope="page" />
<jsp:setProperty property="*" name="reservBean" />
<jsp:useBean id="reserveMgr" class="kr.stay.reservation.ReserveMgr" />

<%
boolean b = reserveMgr.reserveUpdate(reservBean, reservBean.getNo());  

if(b){
%>
	<script>
	alert("수정 성공");
	location.href="reservationmanage.jsp";
	</script>
<%}else{%>
	<script>
	alert("수정 실패\n관리자에게 문의 바람");
	history.back();
	</script>
<%	
}
%>