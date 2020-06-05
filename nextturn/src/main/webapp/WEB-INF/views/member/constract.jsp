<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>join_agree</title>
	<!-- favicon: 제목줄의 아이콘 -->
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<link rel="icon" type="image/png" href=""><!-- 파비콘 -->
	
	<style type="text/css">
	
		.wrap {
			width: 768px;
			margin: 0 auto;
		}

		/* Header */
		#header {
		    height: 105px;
		    padding-top: 15px;
		    position: relative;
		}
		#container {
			position: relative;
		}


		.naver_logo {
			font-size: 2em; /*글자크기 2배 32px 정도 (3em은 3배)*/
		}
		.n_logo {
			display: block;
			width: 300px;
			height: 80px;
			/*width: 240px;*/
			/*height: 44px;*/
			background: url(../resources/img/logos.png) 100% 50% no-repeat;
			background-size: 300px;
			margin: 0 210px;
		}
		.lang {
			position: absolute;
			top: 14px;
			right: 0px;
		}
		.langselect {
			font-size: 12px;
			font-weight: 400;
			height: 30px;
			padding: 6px 8px 5px 7px;
			min-width: 98px;
			color: #333;
			border: 1px solid #ccc;
		}
		.lang > select {
			background: url(../resources/img/sel_arr.gif) 100% 50% no-repeat;
			-webkit-appearance: none; /* 삼각형을 지워라 */
			background-color: white;
		}

		/* Container */
		.join_content {
			width: 460px;
			margin: 0 auto;
		}
		.terms {
			margin-bottom: 20px;
			background-color: white;
			border: 1px solid #dadada;
		}
		.terms_span > input {
			position: absolute;
			right: 1px;
			top: 50%;
			width: 22px;
			margin-top: -11px;
			visibility: hidden;
		}
		.terms_p {
			display: block;
			padding: 15px;
			margin: 0px;
			position: relative;
		}
		.terms_span > label {
			background: url('../resources/img/naver/check_off.gif') 100% 50% no-repeat;
			display: block;
			line-height: 20px;
			height: 58px;
			top: -1px;
			font-style: 14px;
			font-weight: 700;
		}
		.terms_span {
			position: relative;
			display: block;
			height: 58px;
		}
		.terms_span > input:checked +label {
			background-image: url('../resources/img/naver/check_on.gif');
		}
		.terms_ul {
			padding-bottom: 7px;
		}
		.terms_ul_li1 {
			border-top: 1px solid #f0f0f0;
		}
		ul.terms_ul > li {
			display: block;
			padding: 13px 15px 7px;
		}
		.ul_li_span {
			position: relative;
			display: block;
			height: 24px;
		}
		.label1 {
			height: 24px;
			font-size: 14px;
			font-weight: 700;
			line-height: 24px;
			position: absolute;
			color: #333;
			top: 0px;
			left: 0px;
			width: 100%;
		}




	/* 로그인 상태 유지 아이콘 */
		.icon_check {
			overflow: hidden;
			float: left;
			width: 25px;
			height: 25px;
			margin: 1px 8px 0 0;
			background: url(../resources/img/check_off.gif) no-repeat;
						
		}
		.ul_li_span > input:checked +label > .icon_check {
			/*background-position: 0 -30px;*/
			background: url(../resources/img/check_on.png)no-repeat;
		}
		.terms_span > input:checked +label > .icon_check {
			/*background-position: 0 -30px;*/
			background: url(../resources/img/check_on.png)no-repeat;
		}
		.terms_span > label > span {
			display: inline-block;
		}
		.terms_span > label > .icon_check {
			margin: 19px 8px 0 0;
		}




		.span_only {
			color: blue;
			font-size: 12px;
			font-weight: 400;
		}
		.ul_li_span > input {
			visibility: hidden;
			position: absolute;
			right: 1px;
			width: 22px;
			height: 22px;
			margin-top: -11px;
			top: 50%;
		}
		.ul_li_span > label {
			background: url('../resources/img/naver/check_off.gif') 100% 50% no-repeat;
			display: block;
		}
		.ul_li_span > input:checked +label {
			background-image: url('../resources/img/naver/check_on.gif');
		}
		.terms_box {
			position: relative;
			box-sizing: border-box;
			height: 88px;
			margin-top: 11px;
			padding: 8px 10px;
			border: 1px solid #f0f0f0;
			background-color: #f7f7f7;
			overflow: auto;
		}
		h3.article_title {
			font-size: 12px;
			font-weight: 700;
			line-height: 16px;
			color: #666;
		}
		.article > p {
			display: block;
			font-size: 12px;
			line-height: 16px;
			color: #666;
		}
		.span_select {
			color: #969696;
			font-size: 12px;
			font-weight: 400;
		}
		.err_check_msg {
			height: 24px;
			font-size: 12px;
			line-height: 14px;
			color: #f46665;
			display: block;
		}
		.err_check {
			display: none;
		}
		.btn_double_area {
			margin: 30px -5px 0px;
			overflow: hidden;
		}
		.btn_double_area > span {
			display: block;
			float: left;
			width: 50%;
		}
		.btn_type {
		    width: 225px;
		    margin: 0px auto;
		    font-size: 20px;
		    font-weight: 600;
		    line-height: 61px;
		    display: block;
		    box-sizing: border-box;
		    height: 61px;
		    padding-top: 1px;
		    text-align: center;
		}
		.btn_default {
			color: #333;
			border: 1px solid #e7e7e7;
			background-color: #fff;
		}
		.btn_agree {
			color: #fff;
			background-color: #121212;
		}
		.group_join {
			margin: 10px 0px 5px;
		    text-align: center;
		    color: #666;
		    font-size: 12px;
		}
		.group_join > a {
			text-decoration: underline;
			color: #333;
		}

		/*푸터 CSS*/
		div.footer_content{
			/*공사 가이드라인*/
			/*border-left: 3px solid white; 
			border-right: 3px solid white;*/
			width: 1400px; /* 모니터 좌우 1400 안에서 웹을 보여주겠다*/

			margin: 0 auto;
			height: 65px;
			box-sizing: border-box;
			display: flex;
			justify-content: space-between; /*여백을 똑같이 맞추겠다*/
			align-items: center; /* 수평 가운데 정렬*/
			background-color: #000000; /*헤더 전체 색상*/
			color: #c3c3c3;
			text-align: center;
			}

		.footer_wrap {
			background-color: #000000;
			height: 75px;
			}

		
	</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="wrap">
		<header>
			<div id="header">
				<h1 class="naver_logo">
					<a href="${path}/resources/html/header.html" class="n_logo"><!-- <img src="${path}/resources/${path}/resources/img/tumbland_logo_transparent_crop.png"> --></a>
				</h1>
				<div class="lang">
					<select class="langselect"> <!-- select태그 크롬:삼각형 다른웹브라우저 다른걸로 나옴 -->
						<option>한국어</option>
						<option>English</option>
						<option>中文(简体)</option>
						<option>中文(台灣)</option>
					</select>
				</div>
			</div>
		</header>
		<section>
			<div id="container">
				<form class="join_content"
				      name=""
				      action=""
				      method="">
					<div class="terms">
						<p class="terms_p">
							<span class="terms_span">
								<input type="checkbox" id="cbox">
								<label for="cbox">
									<span class="icon_check"></span>
									<span>
										이용약관, 개인정보 수집 및 이용,<br>
										위치정보 이용약관(선택), 프로모션 안내<br>
										메일 수신(선택)에 모두 동의합니다.
									</span>
								</label>
							</span>
						</p>
						<ul class="terms_ul">
							<li class="terms_ul_li1">
								<span class="ul_li_span">
									<input type="checkbox" id="cons_box1" class="ckboxs">
									<label for="cons_box1" class="label1">
										<span class="icon_check"></span>
										넥스트턴 이용약관 동의<span class="span_only">(필수)</span>
									</label>
								</span>
								<div class="terms_box">
									<div class="article">
										<h3 class="article_title">여러분을 환영합니다.</h3>
										<p>네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본<br>
										 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공<br>
										 하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스<br>
										 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의<br>
										 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</p>
									</div>
								</div>
							</li>

							<li class="terms_ul_li2">
								<span class="ul_li_span">
									<input type="checkbox" id="cons_box2" class="ckboxs">
									<label for="cons_box2" class="label1">
										<span class="icon_check"></span>
										개인정보 수집 및 이용에 대한 안내<span class="span_only">(필수)</span>
									</label>
								</span>
								<div class="terms_box">
									<div class="article">
										<p>정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
										<h3 class="article_title">1. 수집하는 개인정보</h3>
									</div>
								</div>
							</li>

							<li class="terms_ul_li3">
								<span class="ul_li_span">
									<input type="checkbox" id="cons_box3" class="ckboxs">
									<label for="cons_box3" class="label1">
										<span class="icon_check"></span>
										위치정보 이용약관 동의<span class="span_select">(선택)</span>
									</label>
								</span>
								<div class="terms_box">
									<div class="article">
										<p>위치정보 이용약관에 동의하시면, <strong>위치를 활용한 광고 정보 수신</strong> 등을 포함하는 네이버 위치기반 서비스를 이용할 수 있습니다.</p>
										<h3 class="article_title">제 1 조 (목적)</h3>
									</div>
								</div>
							</li>

							<li class="terms_ul_li4">
								<span class="ul_li_span">
									<input type="checkbox" id="cons_box4" class="ckboxs">
									<label for="cons_box4" class="label1">
										<span class="icon_check"></span>
										이벤트 등 프로모션 알림 메일 수신<span class="span_select">(선택)</span>
									</label>
								</span>
							</li>
						</ul>
					</div>
					<div class="err_check">
						<span class="err_check_msg">네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
					</div>
					
					
				<!-- 필수부분을 체크하지 않았을때 출력에러 -->			
					<div class="err_check">
						<span class="err_check_msg">PAIK'S RECIPE 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
					</div>
					
					<div class="btn_double_area">
						<span>
							<button type="button" id="cons_btn_cancel" class="btn_type btn_default">취소</button>
						</span> 
						<span>
							<button type="button" id="cons_btn_agree" class="btn_type btn_agree">확인</button>
						</span>						
					

					</div>
				</form>

				<div class="group_join">
					회사, 동아리 등 단체에서 사용할 ID가 필요하세요? <a href="#">단체 회원 가입</a>
				</div>
			</div>
		</section>
		

	</div>
</body>
<%@ include file="../include/footer.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
				/* 전체선택 체크시 전체 체크 or 전체 체크 해제 */
				$('#cbox').on('click', function() {
					var flag = $(this).is(':checked');
					if (flag == true) {
						$('.ckboxs').prop('checked', true);
					} else {
						$('.ckboxs').prop('checked', false);
					}
				});

				/* 선택체크가 모두 체크되면 전체체크버튼 true
					선택체크가 하나라도 체크해제되면 전체체크버튼 false */

				$('.ckboxs').on('click', function() {
					var ckLen = $('.ckboxs:checkbox:checked').length;
					if (ckLen != 4) {
						$('#cbox').prop('checked', false);
					} else {
						$('#cbox').prop('checked', true);
					}
				});
				
				  
				
				/* a 태그 기능 구현  -- 약관등의 페이지에서 '취소'버튼 클릭시 'index'로 이동*/
				$(document).on('click', '#cons_btn_cancel', function() {
					location.href = "${path}/"; /* 이 경로가 작동하려면 MemberController 에 셋팅이 되있어야함 */
				});
				
				/* a 태그 기능 구현 -- 약관동의 페이지에서'확인'버튼 클릭시 '기능 처리후 'join'으로 이동 */
				$(document).on('click', '#cons_btn_agree', function() {

					/* 체크한거에 따라 트루인지 펄스인지 값받기 */
					var agree_one = $('#cons_box1').is(':checked');  //ture
					var agree_two = $('#cons_box2').is(':checked');	 //ture
					var agree_three = $('#cons_box3').is(':checked');
					var agree_four = $('#cons_box4').is(':checked');

					if (agree_one == false || agree_two == false) {
						$('.err_check').css('visibility', 'visible');
						return false; //false 되면 강제로 멈춤
					}
					
					// 유효성체크 통과시 회원가입 페이지로 이동
					/* 이 경로가 작동하려면 MemberController 에 셋팅이 되있어야함 */
					location.href = "${path}/member/join?useon="+ agree_one    //@겟방식의 join 을 타라
												 + "&primaryon=" + agree_two
												     + "&locon=" + agree_three 
												   + "&eventon=" + agree_four
												   + "&flag=1";  //맴버 컨트롤러 @GetMapping /join 으로 이동

							
				});

	}); /* 펑션종료 */
</script>
</html>