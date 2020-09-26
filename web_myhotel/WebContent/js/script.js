function zipCheck(){
	url = "zipcheck.jsp?check=y"; 
	window.open(url,"post","toolbar=no,width=350,height=300,top=200,left=300,status=yes,scrollbars=yes,menubar=no");
}

function idCheck(){
	if(regForm.id.value === ""){
		alert("id를 입력하시오");
		regForm.id.focus();
	//}else if(regForm.id.value !== /^[a-zA-Z]*[_0-9A-Za-z]*[0-9a-zA-Z]$/){
		//alert("아이디를 형식에 맞춰 작성해주세요.");
	}else{
		url = "idcheck.jsp?id=" + regForm.id.value;
		window.open(url,"","width=300,height=150,left=150,top=150");
	}
}

function inputCheck(){
	if(regForm.id.value == ""){
		alert("아이디 입력!");
		regForm.id.focus();
		return;
	}
	
	if(regForm.passwd.value == ""){
		alert("비밀번호 입력!");
		regForm.passwd.focus();
		return;
	}
	if(regForm.passwd.value !== regForm.repasswd.value){
		alert("비밀번호 불일치!");
		regForm.passwd.focus();
		return;
	}
	
	if(regForm.name.value == ""){
		alert("이름 입력!");
		regForm.name.focus();
		return;
	}
	
	if(regForm.email.value == ""){
		alert("이메일 입력!");
		regForm.email.focus();
		return;
	}
	
	if(regForm.phone.value == ""){
		alert("전화번호 입력!");
		regForm.phone.focus();
		return;
	}
	
	if(regForm.zipcode.value == ""){
		alert("우편번호 입력!");
		regForm.zipsearch.focus();
		return;
	}

	
	if(regForm.job.value === "0"){
		alert("직업을 선택하시오");
		regForm.job.focus();
		return;
	}
	
	regForm.submit();
}

function home() {
	location.href="../index.jsp";
	
}

function funcLogin(){
	//alert("a");
	if(loginForm.id.value === ""){
		alert("id 입력");
		loginForm.id.focus();
	}else if(loginForm.passwd.value === ""){
		alert("passwd 입력");
		loginForm.passwd.focus();
	}else{
		loginForm.action = "loginproc.jsp";
		loginForm.method="post";
		loginForm.submit();
	}
}

function funcNew(){
	location.href="register.jsp";
}

function funcHome(){
	location.href="../guest/guest_index.jsp";
}

function funcHostLogin(){
	if(hostloginForm.hostid.value === ""){
		alert("id를 입력하시오");
		hostloginForm.hostid.focus();
		return;
	}

	if(hostloginForm.hostpasswd.value === ""){
		alert("passwd를 입력하시오");
		hostloginForm.hostpasswd.focus();
		return;
	}
	hostloginForm.submit();
}

function funcMain(){
	location.href = "../index.jsp";
}

function hostIdCheck(){
	if(hostjoinForm.hostid.value === ""){
		alert("id를 입력하시오");
		hostjoinForm.hostid.focus();

	}else{
		url = "hostidcheck.jsp?hostid=" + hostjoinForm.hostid.value;
		window.open(url,"","width=300,height=150,left=150,top=150");
	}
}

function joinCheck(){
	if(hostjoinForm.hostid.value == ""){
		alert("아이디 입력!");
		hostjoinForm.hostid.focus();
		return;
	}
	
	if(hostjoinForm.hostpasswd.value == ""){
		alert("비밀번호 입력!");
		hostjoinForm.hostpasswd.focus();
		return;
	}
	if(hostjoinForm.hostpasswd.value !== hostjoinForm.hostrepasswd.value){
		alert("비밀번호 불일치!");
		hostjoinForm.hostpasswd.focus();
		return;
	}

	if(hostjoinForm.hosttel.value == ""){
		alert("전화번호 입력!");
		hostjoinForm.hosttel.focus();
		return;
	}
	hostjoinForm.submit();
}

function funcSearchCheck(){
	if(bookFrm.zip_narea2.value == ""){
		alert("지역을 입력하세요!")
		return;
	}
	if(bookFrm.startdate.value == ""){
		alert("입실일을 입력하세요!")
		return;
	}
	if(bookFrm.enddate.value == ""){
		alert("퇴실일을 입력하세요!")
		return;
	}
	if(bookFrm.personsu.value == ""){
		alert("인원수를 입력하세요!")
		return;
	}
	if(bookFrm.currency.value == ""){
		alert("화폐를 입력하세요!")
		return;
	}
	bookFrm.submit();
}

function hotelAdd(){
	location.href="hotelinsert.jsp";
}

function hotelUpdate(no){
	document.updateForm.no.value = no;
	document.updateForm.submit();
}

function hotelDel(no){
	if(confirm("정말 삭제할까요?")){
		document.delForm.no.value = no;
		document.delForm.submit();		
	}
}

function hotelDetail(no){
	document.hoteldetailForm.no.value = no;
	document.hoteldetailForm.submit();
}

function hotelZipCheck(){
	url = "hotelzipcheck.jsp?check=y"; 
	window.open(url,"post","toolbar=no,width=350,height=300,top=200,left=300,status=yes,scrollbars=yes,menubar=no");
}

function hotelProgress(no, startdate, enddate, personsu, currency){
	document.reservFrm.no.value = no;
	document.reservFrm.startdate.value = startdate;
	document.reservFrm.enddate.value = enddate;
	document.reservFrm.personsu.value = personsu;
	document.reservFrm.currency.value = currency;
	document.reservFrm.submit();
}

function funcAdminLogin(){
	if(adminloginForm.adminid.value === ""){
		alert("id를 입력하시오");
		adminloginForm.adminid.focus();
		return;
	}

	if(adminloginForm.adminpasswd.value === ""){
		alert("passwd를 입력하시오");
		adminloginForm.adminpasswd.focus();
		return;
	}
	adminloginForm.submit();
}

function memUpdate(id) {
	//alert(id);
	document.updateFrm.id.value = id;
	document.updateFrm.submit();
}

function memDel(id) {
	if(confirm("정말 삭제할까요?")){
		document.mdelFrm.id.value = id;
		document.mdelFrm.submit();		
	}
}

function memberUpdateAdmin(){
	document.updateFormAdmin.submit();
}

function memberUpdateCancelAdmin(){
	location.href = "membermanage.jsp";
}

function ghotelDetail(no, startdate, enddate, personsu, currency){
	document.detailFrm.no.value = no;
	document.detailFrm.startdate.value = startdate;
	document.detailFrm.enddate.value = enddate;
	document.detailFrm.personsu.value = personsu;
	document.detailFrm.currency.value = currency;
	document.detailFrm.submit();
}

function reservationDetail(no){
	document.resdetailFrm.no.value = no;
	document.resdetailFrm.submit();
}

function reservDetail(no){
	document.reservedetailFrm.no.value = no;
	document.reservedetailFrm.submit();
}

function memberUpdate(){ 
	//입력자료 오류검사 생략
	document.updateForm.submit();
}
function memberUpdateCancel(){
	location.href="../guest/guest_index.jsp";
}
function memberDelete(){
	alert("회원탈퇴는 곧 죽음!!!");
}

function hostDelete(hostid){
	if(confirm("정말 삭제할까요?")){
		document.hostdeleteFrm.hostid.value = hostid;
		document.hostdeleteFrm.submit();		
	}
}

function adhotelDel(no){
	if(confirm("정말 삭제할까요?")){
		document.hoteldelFrm.no.value = no;
		document.hoteldelFrm.submit();		
	}
}

function reservCheck(){
	location.href="booklist.jsp";
}

function reservDel(no){
	if(confirm("정말 삭제할까요?")){
		document.greservdelFrm.no.value = no;
		document.greservdelFrm.submit();
	}
}

function reserveCheck(){
	location.href="reservmanage.jsp";
}

function reserveDel(no){
	if(confirm("정말 삭제할까요?")){
		document.reservedelFrm.no.value = no;
		document.reservedelFrm.submit();
	}
}
function reserveUp(no){
	document.reserveupFrm.no.value = no;
	document.reserveupFrm.submit();
}

function hreservUp(){ 
	document.hresupFrm.submit();
}