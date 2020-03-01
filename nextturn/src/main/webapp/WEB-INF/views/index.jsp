<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<title>header</title>
		<!-- 서치박스 스크립트 -->
		<script src="https://kit.fontawesome.com/1aa6bb9bc2.js" crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/body_section.css">
	
	<!-- foreach 문으로 만든 태그에서 외부CSS를 인식하지 못하여 여기에 꺼내놨어요 -->
	<style type="text/css">
	/* 작은 이미지박스가 있는 li박스들 */
		.small_img{
			width: 250px;
		    height: 250px;

		    background-color: white;
		    border: solid black 1px;
			    border-radius: 10px;
		} 
</style>
</head>
<body>
<!--■■■■■■ 모달 웹 (열기/닫기)■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<div class="modal_wrap"> <!-- 회색 클릭방지화면 -->
		<div class="modal_content"> <!-- 하얀색 모달창 -->
			
		<!-- 앱솔루트 X 버튼 -->
			<div class="login_close"> 
				<button><i class="fas fa-times"></i></button> <!-- X버튼 아이콘 -->
			</div>

		<!-- 로고 -->
			<div class="modal_logo"></div>


		<!-- 폼 -->
			<form action="" class="frm_login"><!-- ID PW state button 값 던져주기위해 form사용 -->
				<!-- 아이디 -->
				<div class="send_info">
					<label class="label_placeholder" for="login_id">
						<span id="id">아이디</span>
					</label>
					<input type="email" id="login_id" class="login_input" required>
				</div>
				<!-- 비밀번호 -->
				<div class="send_info">
					<label class="label_placeholder" for="login_pw"><span id="pw">비밀번호</span></label>
					<input type="password" id="login_pw" class="login_input" required minlength="6" maxlength="18"><!-- 인풋에 리콰이어드 추가 -->
					<span class="pw_eye">
						<i class="fas fa-eye-slash"></i>
					</span>
				</div>
				<!-- 로그인 상태 유지 -->
				<div class="login_state">
					<input type="checkbox" id="staySignedIn">
					<label for="staySignedIn">
						<span class="icon_check"></span>
						<span>로그인 상태 유지</span>
					</label>
				</div>
				<!-- 로그인 버튼 -->
				<div>
					<button type="submit" class="btn_confirm">로그인</button> 
				</div>
			</form>






				<!-- footer -->
			<div class="login_footer">
				<div>
					<a href="nt_join_agree.html">회원가입</a>
				</div>
				<div>
					<span><a href="#">계정 찾기</a></span>
					<span> | </span>
					<span><a href="#">비밀번호 찾기</a></span>
				</div>
			</div>

			
 		</div>


			

		 </div> <!-- model content -->
	</div><!-- modal wrap-->


<!--■■■■■■ 섹션(주내용) ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<section>
		<div class="section_wrap">
	
		<!-- 메인 이미지 박스 -->
			<div class="main_image">
			<span style="font-size: 50px;"></span>
			</div>
		<!-- 최근 플레이한 게임 -->
			<div>
				<div><h1>최근 플레이한 게임</h1><div>
				<ul class="Recently_played_games_box">
					
					<!-- JSTL 자바 코드를 쓴다 -->
					<c:forEach items="${NewPdt}" var="pdt">
						<li>
							<a class="product_list"> 
								<img class="small_img" src="${path}/resources/img/game/${pdt.p_img}">   <!-- pdt는 바로위에 var pdt를 말함 -->
							</a>
						</li>
					</c:forEach>
				
					<!-- <li style="background: url(${path}/resources/img/game/gm001.jpg);background-size: cover"></li> -->
					
				</ul>
			</div>
		</div> <!-- header_wrap -->
		
	</section>

<!--■■■■■■ 푸터(하단부)■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<footer>
		<div class="footer_wrap">
			<div class="footer_content">
				Copyright © Next Turn Corp. All rights reserved.
			</div>
		</div>
	</footer>
</body>

<!-- jQuery 문법
$('선택자').옵션();
$('#test').css('color','green');
$=jQuery  (Q는 꼭 대문자로 써야한다)
('#test') = 선택자(id가 test
.css() = 옵션(글자색을 녹색);

jQuery 이벤트문법(클릭, 포커스) -->


<!-- 제이쿼리 (열기/끄기) ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> <!-- 제이쿼리 동작하게 해주는 코드 -->
	<script type="text/javascript">
			

			
	//로그인 모달창 켜고/X눌러서 끄기
			jQuery(document).on('click','.login_open', function(){	//login_open을 클릭하면, 기능하라(){
				$('.modal_wrap').css('display','flex');			//modal_wrap의 css에서 display를 flex로 바꿔라. (보이게함)
				$('#login_id').focus();  //아이디 인풋박스에 자동으로 커서가기
					});
			$(document).on('click','.login_close', function(){
			$('.modal_wrap').css('display','none'); //display none 으로 바꿔서 숨김
			$('.frm_login')[0].reset();   //택스트 입력하고, 화면을 닫았을때, 기록했던 정보를 지움
			$('.pw_eye').html('<i class="fas fa-eye-slash"></i>')
			// $('.login_input').val('');
		});
		

	//로그인 input(id,pw)에 focus 되면 테두리색 변경
			$(document).on('focus', '.inputbox', function(){
				console.log('작동중');
				$(this).parent().css('border','2px solid green')  // $(this).parent().css(  이렇게 .parent()를 넣으면 상위 태그에 효과 주는것
			});

			$(document).on('blur', '.inputbox', function(){
			$(this).parent().css('border','1.5px solid #00000000')  // $(this).parent().css(  이렇게 .parent()를 넣으면 상위 태그에 효과 주는것
			});

	// 로그인 Modal창 암호 보이기 or 숨기기
		$(document).on('click','.pw_eye',function(){
			var code = $(this).prev().attr('type');    //pw_eye의 .prev()의 타입을 가져와라
			
			if(code == 'password') {
				$(this).prev().attr('type','text');   //택스트 타입으로 암호보기
				$(this).html('<i class="fas fa-eye"></i>')
					   .css('color', '#666');  //HTML로 바꿔주세요
			}else{
				$(this).prev().attr('type','password');  //패스워드 타입으로 암호보기
				$(this).html('<i class="fas fa-eye-slash"></i>')  //아이콘 모양 바꾸고
				.css('color', '#AAA');  //아이콘 색깔 연한색으로 바꿔라
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
		$(document).on('focus', '#login_id', function(){
			$('#login_id').css('border-color', '#adadad');
			$('#id').css('display', 'none');   //span에 아이디라고 써있는걸 끔
		});
		$(document).on('blur', '#login_id', function(){   //커서가 포커스에서 해지됐을때
			$('#login_id').css('border-color', '#ebebeb');
			var inputVal = $(this).val();       //디스(login_id)사용자가 입력한 값을
			if(inputVal == '') { 
				$('#id').css('display', 'block');
			}
		});
		$(document).on('focus', '#login_pw', function(){
			$('#login_pw').css('border-color', '#adadad');
			$('#pw').css('display', 'none');
		});
		$(document).on('blur', '#login_pw', function(){
			$('#login_pw').css('border-color', '#ebebeb');
			var inputVal = $(this).val();
			if(inputVal == '') { 
				$('#pw').css('display', 'block');
			}
		});


	</script>
</html>