<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="hotelMgr" class="kr.stay.hotel.HotelMgr" />
    
<%
String flag = request.getParameter("flag");
String no = request.getParameter("no");
boolean result = false;

if(flag.equals("delete")){
	//System.out.println("delete");
	result = hotelMgr.deleteHotel(no);
	
}else{
	response.sendRedirect("hotelmanage.jsp");
}

if(result){
%>
	<script>
		alert("정상 처리되었습니다.");
		location.href="hotelmanage.jsp";
	</script>
<%
}else{
%>
	<script>
		alert("오류 발생\n관리자에게 문의 바람");
		location.href="hotelmanage.jsp";
	</script>
<%
}
%>