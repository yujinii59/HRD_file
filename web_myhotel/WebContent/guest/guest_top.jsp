<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String memid = (String)session.getAttribute("idKey");
String log = "";
String mem = "";
String wel = "";

if(memid == null){ 
	log = "<a href = '../member/login.jsp'><b>로그인</b></a>";
	mem = "<a href = '../member/register.jsp'><b>회원가입</b></a>";
	wel = "<b style='color: red;'>로그인</b><b> 후 이용바랍니다.</b>";
	
}else{
	log = "<a href = '../member/logout.jsp'><b>로그아웃</b></a>";	
	mem = "<a href = '../member/memberupdate.jsp'><b>회원수정</b></a>";
	wel = "<b style='color:blue;'>" + memid + "</b><b>님! 방문을 환영합니다.</b>";

}	
%>
<table style="width: 90%; margin-left: auto; margin-right: auto;">
	<tr>
		<td>
		<a href = "../guest/guest_index.jsp"><img src="../images/reservationlogo1.png" width = "250" height = "70" ></a>
		</td>
		<td>
			<table style="width: 90%; margin-left: auto; margin-right: auto;">
				<tr style="text-align: right; font-size: 30px;">
					<td><%=wel %>&nbsp;</td>
					<td><%=log %>&nbsp;</td>
					<td><%=mem %>&nbsp;</td>
					<td><a href="../reservation/booking.jsp"><b>예약하기</b></a>&nbsp;</td>
					<td><a href="../board/boardlist.jsp"><b>고객센터</b></a>&nbsp;</td>
					<td><a href="../reservation/booklist.jsp"><b>예약확인</b></a>&nbsp;</td>
					
				</tr>
			</table>
		</td>	
	</tr>
</table>
<hr style="width: 90%; float: center;">