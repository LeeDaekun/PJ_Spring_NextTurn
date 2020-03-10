<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/header.css">
<title>Insert title here</title>
</head>
<body>
<!--■■■■■■ 헤더 (열기/닫기)■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<header>
		<div class="header_wrap"> <!-- warp이나 컨테이너가 가장 큰 박스를 말함 (_header 라고 쓴이유는 인클루드해서 스타일을 쓰고있음) -->
			<div class="header_content">
				<div class="header_content_logo">
					<a href="#"><img class='header_content_logo_img' src="${path}/resources/img/logo_white.png"></a>
				</div>
				
	

			<!-- 상단 밑줄효과있는 메뉴들  -->
				<div class="container"> 
					<li><a href="#" class="cool_link">공지사항</a></li>
					<li><a href="#" class="cool_link">게임후기</a></li>
					<li><a href="#" class="cool_link">자유게시판</a></li>
					<li><a href="#" class="cool_link">중고거래</a></li>
				</div>
	
				
			<!-- 검색창 -->
				<div class="header_content_search">
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
							<a href="#">마이페이지</a>
					
								<div class="header_dropdown"><!-- 마이페이지 드랍다운 메뉴 -->
									<div class="arrow"></div>
										<ul class="header_dropdown_menu"> <!-- 나중에 사이트에 맞게 바꾸기 -->
											<li><a href="#">쪽지 확인</a></li>
											<li><a href="#">내 게시글</a></li>
											<li><a href="#">닉네임 변경</a></li>
											<li><button type="button" id="header_btn_pwupdate">비밀번호 변경</button></li>
											<li><a href="#">고객센터</a></li>
											<li><span a href="${path}/resources/html/nt_secession.html">탈퇴하기</a></li>
										</ul>
									</div>
								</div>
					</div>
					<div>
						<div class="header_content_member_cart">
								<a href="#"><i class="fas fa-shopping-cart"></i></a>
						</div>
					</div>
					<div><button type="button" class="btn btn-basic login_open">로그인</button></div>
					<div><button type="button" id="header_btn_join" class="btn btn-primary">회원가입</button></div> <!-- 시그니쳐 색깔 -->
				</div>
			
			</div><!-- header_content -->
		</div><!-- header_wrap -->

	</header>
	
</body>
</html>

<!-- 제이쿼리 시작 -->
<script type="text/javascript">
	$(document).ready(function() {
		
		/* Header 가입하기 버튼 클릭시 동의 페이지 이동 (앵커a테그를 사용하면 경로가 유출되니까 제이쿼리로 경로를 바꿔준다) */
		$(document).on('click', '#header_btn_join', function() {
			location.href = "${path}/member/constract";
			/* 이 경로가 작동하려면 MemberController 에 셋팅이 되있어야함 */
			/* 이렇게 get post 명시를 안하면 Get 방식이다 . @GetMapping("/constract") 를 찾아서 실행해라
			   ( @Controller 애들중에서 /member 를 처리하는 애를 찾아봐)*/
		});
	});

	
	
	$(document).ready(function() {
		
		/* Header 가입하기 버튼 클릭시 동의 페이지 이동 (앵커a테그를 사용하면 경로가 유출되니까 제이쿼리로 경로를 바꿔준다) */
		$(document).on('click', '#header_btn_pwupdate', function() {
			location.href = "${path}/member/pwupdate";
			/* 이 경로가 작동하려면 MemberController 에 셋팅이 되있어야함 */
			/* 이렇게 get post 명시를 안하면 Get 방식이다 . @GetMapping("/constract") 를 찾아서 실행해라
			   ( @Controller 애들중에서 /member 를 처리하는 애를 찾아봐)*/
		});
	});
	
</script>