<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">

<style type="text/css">
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■모달 로그인 창 css■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		.modal_wrap { /* 회색 클릭방지화면 */
			top: 0px;
			position: fixed;
			z-index: 1000; /*높을수록 상위*/
			background-color: rgba(0, 0, 0, 0.8);
			/*overflow: auto;*/
			width: 100%;
			height: 100%;
			justify-content: center;
			align-items: center;
			display: none; /*디스 플레이 none끄기    기존flex */
		}

		.modal_content {
			padding: 30px 30px;
			position: relative; /*부모가 포지션이 있어야 하위에서 absolute 를 쓸수 있다*/
			width: 400px;
			height: 400px;
			background-color: white;
			box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.2), 0 4px 20px 0
				rgba(0, 0, 0, 0.19);
			overflow: hidden; /*모달창을 벗어나는 것들을 숨김*/
			color: black;
			border: 1px solid blue;
		}
		
		.modal_error_next_box {
			visibility: hidden;
			color: rgb(217, 83, 57);
			font-size: 13px;
			padding: 6px 6px 0;
		}



		div.header_wrap {
			width: 100%;
			background-color: black;
			
			z-index: 999;
			box-shadow: 0 0 1px -3px rgba(20, 23, 28, 0.1), 0 3px 1px 0 rgba(20,23,28,0.1);
		}
	
		div.header_content{
			/*공사 가이드라인*/
			/*border-left: 3px solid white; 
			border-right: 3px solid white;*/
			width: 1400px; /* 모니터 좌우 1400 안에서 웹을 보여주겠다*/
			margin: 0 auto;
			height: 100px;
			box-sizing: border-box;
			display: flex;
			justify-content: space-between; /*여백을 똑같이 맞추겠다*/
			align-items: center; /* 수평 가운데 정렬*/
			
		}
		.header_content_search_group {
			display: flex;  /*인라인이나 블록, 인라인블록 등을 보여주는것이 디스플레이 : flex는 정렬방법인데 */
			align-items: center;
			background-color: #f2f3f5;
			border-radius: 2px;
			
		}

/*■■■■ 로그인 버튼 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		button.btn-basic {
			background-color: #686f7a;  /*로그인 버튼 색상 (노 호버)*/
			border: 1px solid #939393;
			color: white;
		}
		button.btn-basic:hover {
			color: white;
			background-color: #2B2B2B; /*호버시 회원가입 버튼 색상*/
		}

/*■■■■ 회원가입 버튼 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		button.btn-primary { /* 나중에 자기가 정한 시그니쳐 색깔로 바꾸기 */

			background-color: #686f7a; /*회원가입 버튼 색상*/
			border: 1px solid #939393;
			color: white;
		}
		button.btn-primary:hover {
		background-color: #2B2B2B; /*호버시 회원가입 버튼 색상*/
		border: 1px solid #0f4c81; /*호버시 회원가입 버튼 테두리 색상*/
		}


		button.btn-support {
		background-color: #EBA444;
		color: white;
		}
		button.btn-support:hover {
			background-color: #CA8420;
			border-color: transparent;
		}


		
/*■■■■■■서치바,검색바■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		.header_content_search_input {
			background-color: transparent;
			border-color: transparent;
			height: 44px;
			font-size: 13px;
			border-radius: 2px;
			padding: 10px 12px;
			outline: none; /*input테그 클릭했을때 안쪽에 테두리 생기는거 지움*/
		}
		.header_content_search_btn {
			border-color: transparent; /*트렌스 페어런트는 투명색*/
			background-color: transparent; /*트렌스 페어런트는 투명색*/
			width: 44px;
			height: 44px;
			cursor: pointer;
			color: black; /*서치박스 안에 돋보기 색깔*/
			border-top-right-radius: 2px; /*테두리 오른쪽 위쪽만 둥글게*/
			border-bottom-right-radius: 2px; /*테두리 오른쪽 아랫쪽만 둥글게 둥글게*/
			outline: none;
		}
		.header_content_search_btn:hover {
			background-color: #3c3c3c;
			color: white;
			outline: none;
		}

		.header_content_nav {
		    align-items: center;
		    width: 240px;
		    display: flex;
		    justify-content: space-between;
		    
		}
		/*드랍다운 메뉴 열리는 범위*/
		.header_content_nav > div {
			padding: 20px 4px 20px;
			border: 1px solid red;

		}

		.header_content_member {
		    width: 350px;
		    height: 50px;
		    display: flex;
		    text-align: center;
		    align-items: center;
		    justify-content: space-between;
		    /* margin으로 미는것보다 flex로 미는게 더 쉽다 */
			
		}
		/*드랍다운 메뉴 열리는 범위*/
		.header_content_member > div {
			padding: 20px 4px 20px;

		}
		.header_content_dropdown_group{
			position: relative; /*기본값 위치*/
			width: 100%px;
		}
		.header_content_dropdown_wrap:hover .header_dropdown {
			display: block;
		}

		.header_content_dropdown_group > a {
			display: inline-block;
			padding: 12px 15px;
			font-weight: 400;
			border: 1px solid transparent;
			border-radius: 2px;
			height: 45px;
			color: #c7c7c7;
			line-height: 19px; /* 45px - (12px x 2) - (1px x 1) = 19px */
		}
		.header_content_dropdown_wrap:hover > div > a,
		.header_content_member_cart > a:hover {
/*			background-color: rgba(20,23,28,.05);
			border-color: rgba(20,23,28,.05);*/
			background-color: white;
		}	
		.header_content_member_cart > a {
			display: inline-block;
			width: 45px;
			height: 45px;
			border-radius: 50%;
			color: #c7c7c7;
			border: 1px solid transparent;
			text-align: center;
			padding: 12px;
			line-height: 19px;
		}

	/*-- start 밑줄효과 메뉴-----------------------------------------*/
		div.container{
			position: relative;
			transform: translate(0%, 9px);
		}
		div.container > ul > li{
			display: inline-block;
		}
		div.container > ul > li a {
			text-decoration: none;
			display: inline-block;
			font-weight: 100; /*글자두께*/
			color: #c7c7c7;  /*글자 색상 공지사항 게임후기 자유게시판 중고거래*/
			font-size: 15px;
			padding: 10px 20px;
		}

		/*밑줄 애니메이션 효과*/
		a.cool_link:after {   /*밑줄효과 after 니까 부모 뒤에 오니까 밑으로 내려가서 밑줄이 된다 //before 였으면 윗줄이 된다*/
			content: '';
			display: block;
			width: 0%; /*가로라인 0% 길이만큼 (호버했을때 길게 늘릴 예정)*/
			height: 2px;  /*두께*/
			background-color: white;
			transition: width 0.2s;  /*라인이 0.2초만에 그려짐*/
		}
		a.cool_link:hover:after { /*쿨링크에 호버했을때 효과 width 100% 까지 라인 생성*/
			width:100%;
		}
	/*▲▲▲▲▲▲▲▲▲▲ end 밑줄효과 메뉴 ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲*/




		.header_content_logo_img {
			max-width: 500px;
			height: 65px;
			vertical-align: middle;
		}
		.header_content_logo_text {
			font-size: 35px;
			font-weight: bold;
			vertical-align: middle;
		}
		
		/* 드랍다운 메뉴 */
		.header_dropdown_menu {
			position: relative; /*값을 주지 않으면 주나 안주나 똑같은것처럼 기본 위치에 고정되있음*/
			border-bottom-left-radius: 2px;
			border-bottom-right-radius: 2px;
			box-shadow: 0 4px 16px rgba(20,23,28,.25);
			background-color: white;
			padding: 10px 0; /*상하 10   좌우0*/
			
		}
		.header_dropdown_menu a {
			display: inline-block;
			font-size: 15px;
			color: #505763;
			text-align: center;
			padding: 5px 15px;
			font-weight: 400;
			width: 130px;
			position: relative;
			z-index: 100;
		}

		.header_dropdown_menu a:hover { 
			color: #007791;
			background-color: #f2f3f5;
		}
		.header_dropdown{
			position: absolute; /*부모꺼 기준으로 탑0 레프트0*/
			top:53px; /*0을 쓸때는 px를 생략해도 됨, 숫자가 들어갈때는 */
			left:0px;
			display: none; /*메뉴바를 숨김*/
		}

		.arrow {
			position: absolute;
			top: -4px;
			left: 15px;
			width: 15px;
			height: 15px;
			transform: rotate(45deg);
			background-color: white;
			border-color: transparent transparent #fff transparent;
			z-index: 99; /*포지션이 있어야 z인덱스를 적용할 수 있음*/

		}
		
		/*글자에 밑줄 애니메이션 긋는 CSS효과================-*/
		.magicline:after {   /*밑줄효과 after 니까 부모 뒤에 오니까 밑으로 내려가서 밑줄이 된다 //before 였으면 윗줄이 된다*/
			content: '';
			display: block;
			width: 0%; /*가로라인 0% 길이만큼 (호버했을때 길게 늘릴 예정)*/
			height: 3px;  /*두께*/
			background-color: #506763;
			transition: width 0.2s;  /*라인이 0.2초만에 그려짐*/
		}
		.magicline:hover:after { /*쿨링크에 호버했을때 효과 width 100% 까지 라인 생성*/
			width:100%;
		}


		#btn_login{
			font-size: 22px;
			color: white;
			text-align: center;
		}
	
	
		.modal_logo{
	       height: 81px;
		   background: url(${path}/resources/img/logos.png) 16px -3px;
		   background-size: 280px;
		   background-repeat: no-repeat;

		}
	
		.wrap_form {
			font-size: 30px;       /*글자크기*/
			font-weight: bold;	   /*글자 굵게*/
			text-align: left;
			margin: 50px 40px;
		}
		.wrap_form2{
			font-size: 12px;
			border: 1px solid red;
			padding: 20px 20px;

		}
		
		.info_user{
			font-size: 12px;
			text-align: center;
			display: flex;
			justify-content: space-between;

		}
		.inputbox {
			display: block;
			width: 80%;
			height: 30px;
			border-width: 0 0 2px 0; /*인풋박스의 경계선 폭을 조정함*/
		}
		.check_login{
			font-size: 12px;
			display: flex; /*컨텐츠를 한줄에 나오게함*/

		}
		.checkimg{
			background-image: url(${path}/resources/img/kakao.png);
			background-position: -30px -30px; /*가로0 -30   세로 */
			display: block; /*일정 공간을 가짐*/
			width: 25px;
			height: 25px;
		}
		check_login > input {  /*체크 로그인의 인풋태그에 */
			visibility: hidden;

		}

		.check_login > input:checked +label{   /*check login의 인풋이 '체크'되면, 라벨에 배경을 띄움*/
			background-image: url(${path}/resources/img/kakao.png);
			background-position: 0px -30px; /*가로0 -30   세로 */
		}

	/*■■■■모달창 안에 떴을때 X 버튼■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		.login_close{
			position: absolute;
			top: 7px;
			right: 7px;
		}
		.login_close > button{
			color: rgb(142,142,142);
			border: none;
			background: white;
			font-size: 30px;
			cursor: pointer;
			outline: none;
		}
		.login_close > button:hover {
			color: #EBA444;
		}
		
		.input_div{
			position: relative;
			display: flex;
		}
		.pw_eye{  /*------------------눈그림에 효과*/
			position: absolute;
			top: 15px;
		    right: 5px;
		    cursor: pointer;
			color: #aaa;
		/* height: 40px;    인풋창 사이즈만큼
			line-height: 40px; 인풋창 사이즈만큼
			width: 30px;
			text-align: center;
			
			font-size: 15px; */
		}


	/*■■■■폼 (아이디 비번 입력창)■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/	
		.send_info {
				position: relative;
			}
		.label_placeholder {
				position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				height: 47px;
				line-height: 47px;
				font-size: 15px;
				color: #adadad;
				cursor: pointer;
			}
		.login_input {
				width: 100%;
				height: 48px;
				padding: 10px 70px 10px 20px;
				border-width: 0 0 2px 0;
				border-color: #ebebeb;
				box-sizing: border-box;
				outline: none;
			}

	/* 로그인체크 박스(로그인상태 유지 아이콘)■■■■■■■■■■■■■■■■■■■■■■■*/
		div.login_state {  /* 로그인 상태 유지 (메인div)*/
		    height: 28px;
		    margin: 10px 0;
		    line-height: 29px;
		}
		#staySignedIn { 	/*원본 체크박스 숨김기기*/
			visibility: hidden;
			float: right;
		}
		/* 로그인 상태 유지 아이콘 gif */
		span.icon_check {
		    float: left;
		    width: 25px;
		    height: 25px;
		    margin: 1px 8px 0 0;
		    background: url(${path}/resources/img/check_off.gif)no-repeat;

		}
		div.login_state > input:checked +label > .icon_check {
			/*div login state 하위에 input을 체크하면 (+ 는 적용대상)
			하위에 있는 라벨에서 icon check 에 다음 명령어를 실행*/
			background: url(${path}/resources/img/check_on.png)no-repeat;

		}

	/* 로그인 버튼■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		.btn_confirm {
			/*color: #252525;*/
			color: white;
			background-color: #171717;
			width: 100%;
			height: 50px;
			padding: 0;
			border: 0;
			border-radius: 4px;
			font-weight: bold;
		}

	/* 로그인 footer ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		.login_footer {
			font-size: 12px;
			margin-top: 30px;
			display: flex;
			justify-content: space-between;
		}

</style>
<title>Next Turn Games</title>
</head>
<body>
	<!--■■■■■■ 모달 웹 (열기/닫기)■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<div class="modal_wrap">
		<!-- 회색 클릭방지화면 -->
		<div class="modal_content">
			<!-- 하얀색 모달창 -->

			<!-- 앱솔루트 X 버튼 -->
			<div class="login_close">
				<button>
					<i class="fas fa-times"></i>
				</button>
				<!-- X버튼 아이콘 -->
			</div>

			<!-- 로고 -->
			<div class="modal_logo"></div>


			<!-- 폼 -->
			<form action="" class="frm_login" onsubmit="return false;"> <!-- 서브밋이 자동으로 작동하지 않게 바꿔준다 -->
				<!-- ID PW state button 값 던져주기위해 form사용 -->
				<!-- 아이디 -->
				<div class="send_info">
					<label class="label_placeholder" for="login_id"><span id="id">아이디</span></label>
					<input type="text" id="login_id" class="login_input" required>
				</div>
				<!-- 비밀번호 -->
				<div class="send_info">
					<label class="label_placeholder" for="login_pw"><span
						id="pw">비밀번호</span></label> <input type="password" id="login_pw"
						class="login_input" required minlength="6" maxlength="18">
					<!-- 인풋에 리콰이어드 추가 -->
					<span class="pw_eye"> <i class="fas fa-eye-slash"></i>
					</span>
				</div>

				<div class="modal_error_next_box">에러출력박스(진주씨 교육중)</div>

				<!-- 로그인 상태 유지 -->
				<div class="login_state">
					<input type="checkbox" id="staySignedIn">
					<label for="staySignedIn"> <span class="icon_check"></span>
						<span>로그인 상태 유지</span>
					</label>
				</div>
				<!-- 로그인 버튼 -->
				<div>
					<button type="submit" class="btn_confirm" id="btn_login">로그인</button>
					<!-- 서브밋이 자동으로 작동하지 폼태그에  onsubmit="return false;" 를 넣어줘야한다 -->
				</div>
			</form>

			<!-- 회원가입 modal 하단 -->
			<div class="login_footer">
				<div>
					<a href="#" id="header_btn_join">회원가입</a>
				</div>
				<div>
					<span><a href="#">계정 찾기</a></span> <span> | </span> <span><a
						href="#">비밀번호 찾기</a></span>
				</div>
			</div>

		</div>

	</div>
	<!-- model content -->
	
	<!-- modal wrap-->




	<!--■■■■■■ 헤더 (열기/닫기)■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<header>
		<div class="header_wrap">
			<!-- warp이나 컨테이너가 가장 큰 박스를 말함 (_header 라고 쓴이유는 인클루드해서 스타일을 쓰고있음) -->
			<div class="header_content">
				<div class="header_content_logo">
					<a href="#"><img class='header_content_logo_img'
						src="${path}/resources/img/logo_white.png"></a>
				</div>



				<!-- 상단 밑줄효과있는 메뉴들  -->
				<div class="container">
				<ul>
					<li><a href="${path}/board/list_notice" class="cool_link" >공지사항</a></li>
					<li><a href="${path}/board/list_review" class="cool_link">게임후기</a></li>
					<li><a href="#" class="cool_link" id="header_menu_list">자유게시판</a></li>
					<li><a href="#" class="cool_link">중고거래</a></li>
				</ul>
				</div>


				<!-- 검색창 -->
				<div>
					<form name="frm_search" action="" method="GET">
						<div class="header_content_search_group">
							<input type="text" placeholder="무엇이든 검색하기" name="keyword" class="header_content_search_input">
							<button type="button" class="header_content_search_btn">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</form>
				</div>


				<!-- 헤더 컨텐츠 맴버 -->
				<div class="header_content_member">
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" id="header_dropdown_btn_mypage">마이페이지</a>

							<div class="header_dropdown">
								<!-- 마이페이지 드랍다운 메뉴 -->
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<c:if test="${not empty userid}">
										<li><a href="#" style="color:blue">안녕하세요!</a></li>
									</c:if>	
								
								
									<!-- 나중에 사이트에 맞게 바꾸기 -->
									<li><a href="#">쪽지 확인</a></li>
									<li><a href="#">내 게시글</a></li>
									<li><a href="#">닉네임 변경</a></li>
									<li><a href="#">고객센터</a></li>
									<li><a href="${path}/member/mypage">마이페이지</a></li>
									
									<!-- <li><a href="#" id="header_dropdown_btn_pwupdate">비밀번호 	변경</a></li>
									<li><a href="#" id="header_dropdown_btn_drop">탈퇴하기</a></li> -->
								</ul>
							</div>
						</div>
					</div>
					<div>
						<div class="header_content_member_cart">
							<a href="#"><i class="fas fa-shopping-cart"></i></a>
						</div>
					</div>

					<!-- JSTL 자바언어이며, JSP에서 쓰려면 JSTL 이 인클루드 되있어야함 (choose는 if else 문과 같음)-->
					<c:choose>
						<c:when test="${empty userid}">
							<div>
								<button type="button" class="btn btn-basic login_open">로그인</button>
							</div>
							<div>
								<button type="button" id="header_btn_join"
									class="btn btn-primary">회원가입</button>
							</div>
							<!-- 시그니쳐 색깔 -->
						</c:when>
						<c:otherwise>
							<div style="color:white">${name}님</div>
							<div>
								<button type="button" class="btn btn-basic" id="header_btn_logout">로그아웃</button>
							</div>
						</c:otherwise>
					</c:choose>



				</div>

			</div>
			<!-- header_content -->
		</div>
		<!-- header_wrap -->

	</header>
</body>
<!-- 제이쿼리 시작 -->
<script type="text/javascript">
    // $(document).ready(function() {
	// $(function(){   위에꺼랑 같은거

		
		//인터셉터로 인한 기능 (로그인 안됐을때 로그인모달 띄우기)
	$(function(){
		var message = '${message}';  //flashMap 의 값
		var uri = '${uri}';
		if(message == 'nologin'){
			$('.modal_wrap').css('display','flex');  //모달웹을 보이게한다
			$('#login_id').focus();
			$('.modal_error_next_box')
									.css('visibility','visible')
									.text('로그인이 필요한 기능입니다')
		}





//로그인 모달창 켜고/X눌러서 끄기
	jQuery(document).on('click', '.login_open', function() { //login_open을 클릭하면, 기능하라(){
		$('.modal_wrap').css('display', 'flex'); //modal_wrap의 css에서 display를 flex로 바꿔라. (보이게함)
		$('#login_id').focus(); //아이디 인풋박스에 자동으로 커서가기
	});
	$(document).on('click', '.login_close', function() {
		$('.modal_wrap').css('display', 'none'); //display none 으로 바꿔서 숨김
		$('.frm_login')[0].reset(); //택스트 입력하고, 화면을 닫았을때, 기록했던 정보를 지움
		$('.pw_eye').html('<i class="fas fa-eye-slash"></i>');
		// $('.login_input').val('');
		uri = '';
	});

//로그인 input(id,pw)에 focus 되면 테두리색 변경
	$(document).on('focus', '.inputbox', function() {
		console.log('작동중');
		$(this).parent().css('border', '2px solid green') // $(this).parent().css(  이렇게 .parent()를 넣으면 상위 태그에 효과 주는것
	});

	$(document).on('blur', '.inputbox', function() {
		$(this).parent().css('border', '1.5px solid #00000000') // $(this).parent().css(  이렇게 .parent()를 넣으면 상위 태그에 효과 주는것
	});

// 로그인 Modal창 암호 보이기 or 숨기기
	$(document).on('click', '.pw_eye', function() {
		var code = $(this).prev().attr('type'); //pw_eye의 .prev()의 타입을 가져와라

		if (code == 'password') {
			$(this).prev().attr('type', 'text'); //택스트 타입으로 암호보기
			$(this).html('<i class="fas fa-eye"></i>').css('color', '#666'); //HTML로 바꿔주세요
		} else {
			$(this).prev().attr('type', 'password'); //패스워드 타입으로 암호보기
			$(this).html('<i class="fas fa-eye-slash"></i>') //아이콘 모양 바꾸고
			.css('color', '#AAA'); //아이콘 색깔 연한색으로 바꿔라
		}
	});

	//값을 가져오는 방법
	//<span class="aaa">동토리</span>
	//<input type="text" class="dobby">동비</input>
	//
	// input태그 값 가져오는 방법
	// $('.dobby').val();     --->서버단으 보낼때 보통 val 값으로 보낸다
	// input태그 값 넣는 방법
	// $('.dobby').val('메롱');
	//
	// input 태그 이외의 값 가져오는 방법
	// $('.aaa').text();
	// input 태그 이외의 값 넣는 방법
	// $('.aaa').text('뭐시여??');

	// 태그의 옵션(attribute)을 가져오고 싶을 때
	// $('.dobby').attr('type');
	// $('.dobby').attr('class');
	$(document).on('focus', '#login_id', function() {
		$('#login_id').css('border-color', '#adadad');
		$('#id').css('display', 'none'); //span에 아이디라고 써있는걸 끔
	});
	$(document).on('blur', '#login_id', function() { //커서가 포커스에서 해지됐을때
		$('#login_id').css('border-color', '#ebebeb');
		var inputVal = $(this).val(); //디스(login_id)사용자가 입력한 값을
		if (inputVal == '') {
			$('#id').css('display', 'block');
		}
	});
	$(document).on('focus', '#login_pw', function() {
		$('#login_pw').css('border-color', '#adadad');
		$('#pw').css('display', 'none');
	});
	$(document).on('blur', '#login_pw', function() {
		$('#login_pw').css('border-color', '#ebebeb');
		var inputVal = $(this).val();
		if (inputVal == '') {
			$('#pw').css('display', 'block');
		}
	});

	
	
	// LOGIN 버튼 클릭시 AJAX 동작
	$(document).on('click', '#btn_login',function() {

		// id와 pw 값 받아와서 null이면 작동하지 않음
		var id = $('#login_id').val();
		var pw = $('#login_pw').val();
		
		// 유효성체크 (id, pw) null 체크
		if (id != '' && pw != '' && id.length != 0 && pw.length != 0) { //인풋창에 id랑 비번이 빈값이 아니면, ajax 를 실행
			/* ajax 는 return 된 데이터를 받을때 string 만 받을수 있어서, int 같은거로 반환을 했다면, int 등의 타입을 string으로 형변환 해주는 라이브러리가 필요함 */
			$.ajax({
				url : '${path}/login/in',
				type : 'POST',
				data : 'id=' + id + '&pw=' + pw,
				success : function(data) {
					console.log(data);
					if (data == 0 || data == 3) {
						$('.modal_error_next_box').css('visibility', 'visible')
												  .text('아이디 또는 비밀번호를 확인해주세요.');
						alert('아이디또는 비번을 확인해주세요');
					} else if (data == 1) {
						console.log('로그인 성공');
						if(uri == ''){  //uri가 비어있다면
							location.reload(); // 새로고침	
						}else{
							location.href = uri;  //uri를 타고 왔다면, 그 uri로 이동
						}
					} else if (data == 2) {
						$('.modal_error_next_box')
						.css('visibility', 'visible')
						.text('이메일 인증 후에 이용하실 수 있습니다.');
					}
				},
				error : function() {
					alert('System Error:/');
				}
				
			});
		}
	});
	

		/* 로그아웃 기능 */
		$(document).on('click', '#header_btn_logout', function(){
			$.ajax({
				url: '${path}/login/out',
				type: 'POST',
				success: function() {
					console.log('Logout Success:)');
					location.reload();
				},
				error: function() {
					alert('System Error:/');
				}
			});
		});
		
		
	
	
	
		//링크 이동용
		$(document).ready(function() {
			/* 로고 클릭시 index로 이동 [a href 를 대신하는 ajax] */
			$(document).on('click', '.header_content_logo_img', function() {
					location.href = "${path}/"; //컨트롤러 호출
			});
				
			/* 마이페이지로 이동 [a href 를 대신하는 ajax] */
			$(document).on('click', '#header_dropdown_btn_mypage', function() {
					location.href = "${path}/member/mypage"; //컨트롤러 호출
			});
			
			/* 게시판으로 이동 [a href 를 대신하는 ajax] */
			$(document).on('click', '#header_menu_list', function() {
					location.href = "${path}/board/list"; //컨트롤러 호출
			});
			/* [회원가입] 버튼 클릭시 동의 페이지 이동 (앵커a테그를 사용하면 경로가 유출되니까 제이쿼리로 경로를 바꿔준다) */
			$(document).on('click', '#header_btn_join', function() {
					location.href = "${path}/member/constract";
					/* 이 경로가 작동하려면 MemberController 에 셋팅이 되있어야함 */
					/* 이렇게 get post 명시를 안하면 Get 방식이다 . @GetMapping("/constract") 를 찾아서 실행해라
					   ( @Controller 애들중에서 /member 를 처리하는 애를 찾아봐)*/
			});
			/* 비번변경 버튼[a href 를 대신하는 ajax] */
			$(document).on('click', '#header_dropdown_btn_pwupdate', function() {
					location.href = "${path}/member/pwupdate";
			});

			/* 탈퇴하기 버튼[a href 를 대신하는 ajax] */
			$(document).on('click', '#header_dropdown_btn_drop', function() {
					location.href = "${path}/member/drop"; //컨트롤러 호출
				});
			});
		});//도큐먼트 레디펑션 종료		
</script>
</html>




