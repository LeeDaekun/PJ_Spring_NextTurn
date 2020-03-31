<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/header.css">

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
			<form action="" class="frm_login">
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
					<li><a href="#" class="cool_link">공지사항</a></li>
					<li><a href="#" class="cool_link">게임후기</a></li>
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
		if(message == 'nologin'){
			$('.modal_wrap').css('display','flex');  //모달웹을 보이게한다
			$('#login_id').focus();
			$('.modal_error_next_box')
									/* .css('dispaly','block') */
									.css('visibility','visible')
									.text('로그인이 필요한 기능입니다')
		}




		
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

//로그인 모달창 켜고/X눌러서 끄기
	jQuery(document).on('click', '.login_open', function() { //login_open을 클릭하면, 기능하라(){
		$('.modal_wrap').css('display', 'flex'); //modal_wrap의 css에서 display를 flex로 바꿔라. (보이게함)
		$('#login_id').focus(); //아이디 인풋박스에 자동으로 커서가기
	});
	$(document).on('click', '.login_close', function() {
		$('.modal_wrap').css('display', 'none'); //display none 으로 바꿔서 숨김
		$('.frm_login')[0].reset(); //택스트 입력하고, 화면을 닫았을때, 기록했던 정보를 지움
		$('.pw_eye').html('<i class="fas fa-eye-slash"></i>')
		// $('.login_input').val('');
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

		// id와 pw 값 받아와서 null이면 작동X
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
						$('.modal_error_next_box')
						.css('visibility', 'visible')
						.text('아이디 또는 비밀번호를 확인해주세요.');
					} else if (data == 1) {
						console.log('로그인 성공');
						location.reload(); // 새로고침
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
		
		
		
</script>
</html>




