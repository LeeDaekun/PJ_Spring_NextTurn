<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>join_agree</title>
	<!-- favicon: 제목줄의 아이콘 -->
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/footer.css"><!-- 푸터 CSS추가 -->
	<link rel="icon" type="image/png" href=""><!-- 파비콘 -->
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/nt_join_agree.css">
	
	<style type="text/css">

	</style>
</head>
<body>
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
		
	<!-- ■■■■ 푸터 (열기 / 닫기) ■■■■■■■■■■■■■■■■■■■■ -->
		<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>

				<div id="address">
					<span>
						<a href="${path}/resources/html/header.html">
							<img id="addr_logo" src="${path}/resources/img/logos.png">
						</a>
					</span>
					&nbsp;
					<span>Copyright</span>
					<span>ⓒ</span>
					<span><strong><a href="#">NEXT TURN Corp.</a></strong></span>
					<span>All Rights Reserved.</span>
				</div>
			</div>
		</footer>
	</div>
</body>


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
				
				  
				
				/* a 태그 기능 구현   Header 가입하기 버튼 클릭시 동의 페이지 이동 (앵커a테그를 사용하면 경로가 유출되니까 제이쿼리로 경로를 바꿔준다) */
				$(document).on('click', '#cons_btn_cancel', function() {
					location.href = "${path}/"; /* 이 경로가 작동하려면 MemberController 에 셋팅이 되있어야함 */
				});
				
				/* a 태그 기능 구현   Header 가입하기 버튼 클릭시 동의 페이지 이동 (앵커a테그를 사용하면 경로가 유출되니까 제이쿼리로 경로를 바꿔준다) */
				$(document).on('click', '#cons_btn_agree', function() {

					var agree_one = $('#cons_box1').is(':checked');
					var agree_two = $('#cons_box2').is(':checked');
					var agree_three = $('#cons_box3').is(':checked');
					var agree_four = $('#cons_box4').is(':checked');

					if (agree_one == false || agree_two == false) {
						$('.err_check').css('visibility', 'visible');
						return false;
					}
					
					// 유효성체크 통과시 회원가입 페이지로 이동
					/* 이 경로가 작동하려면 MemberController 에 셋팅이 되있어야함 */
					/* */
					location.href = "${path}/member/join?useon="+ agree_one 
												 + "&primaryon=" + agree_two
												     + "&locon=" + agree_three 
												   + "&eventon=" + agree_four 
												 	             + "&flag=1";

							
				});

						
				
				
				
				
				
				
	}); /* 펑션종료 */
</script>
</html>