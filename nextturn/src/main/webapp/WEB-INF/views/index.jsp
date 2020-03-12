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
<%@ include file="include/modal.jsp"%>




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
			

	</script>
</html>