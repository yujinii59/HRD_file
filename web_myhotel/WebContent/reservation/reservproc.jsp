<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>    
<jsp:useBean id="reserveMgr" class="kr.stay.reservation.ReserveMgr" />
<jsp:useBean id="reserv" class="kr.stay.reservation.ReserveBean" />
<jsp:setProperty property="*" name="reserv"/>
    
<%
//컨트롤러 역할 : flag - 구매목록 보기("insert"), 수정("update"), 삭제("delete") 판단
String flag = request.getParameter("flag");
String id = (String)session.getAttribute("idKey");
String option = "";
String[] items = request.getParameterValues("option");
try{
   // 선택한 값이 없으면 back.
   if(items == null || items.length <= 0){
     //out.println("<script>alert(''선택한 항목이 없습니다.'');history.back();</script>");
     return;
   }
   for(int i=0; i<items.length; i++){
     //out.println("선택한 값 : " + items[i] + "<br>");
     if(i == items.length - 1){
    	 option += items[i];
     }else{
     	option += items[i] + " / ";
     }
   }
   out.println(option);
   //out.println("<a href=''javascript:history.back();''>뒤로</a>");
}catch(Exception e){
   System.out.println(e);
}
//out.println(option);

if(id == null){
	response.sendRedirect("../member/login.jsp");		// 로그인 안하고 온 경우
}else{
	if(flag.equals("insert")){					//구매 목록 보기 - 카트에 담기 작업 필요
		reserv.setGuest_id(id);
		reserveMgr.insertReservation(reserv, option);			//id, product_no, quantity를 들고 addCart 호출
%>
		<script>
			alert("호텔예약이 완료되었습니다.");
			location.href="booklist.jsp";
		</script>

<%	
	}else if(flag.equals("update")){			// 장바구니 수정
		reserv.setGuest_id(id);
		//reserveMgr.updateCart(reserv);
%>
		<script>
			alert("장바구니 내의 상품 수정 성공");
			location.href="cartlist.jsp";
		</script>
<%
		
	}else if(flag.equals("del")){			// 장바구니에서 삭제
		//reserveMgr.deleteCart(reserv);
%>
		<script>
			alert("장바구니 내의 상품 삭제 성공");
			location.href="cartlist.jsp";
		</script>
<%
	}
}
%>