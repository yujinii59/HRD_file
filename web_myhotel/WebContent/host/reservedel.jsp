<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="reserveMgr" class="kr.stay.reservation.ReserveMgr" />
    
<%
String flag = request.getParameter("flag");
String no = request.getParameter("no");
boolean result = false;

	result = reserveMgr.deleteReserv(no);


if(result){
%>
	<script>
		alert("정상 처리되었습니다.");
		location.href="reservationmanage.jsp";
	</script>
<%
}else{
%>
	<script>
		alert("오류 발생\n관리자에게 문의 바람");
		location.href="reservationmanage.jsp";
	</script>
<%
}
%>