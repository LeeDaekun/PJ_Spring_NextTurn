<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>내 정보 확인</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css">

<style type="text/css">

/* ■■■■■■■■■■■■■■■■■■■■■■■섹션 부분 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
.section_wrap {
	margin: 100px auto;
	padding: 50px 100px;
	border: solid #dcdcdc 1px;
	width: 800px;
	background-color: white;
}

.myinfo {
	border-bottom: 3px solid black;
}

.flex {
	display: flex;
	margin: 20px 10px;
	padding: 20px 10px;
	height: 300px;
}

.photo {
	border: 1px solid black;
	display: block;
	width: 150px;
	height: 150px;
	background: url(../../img/game/azul.jpg) 0px 0px no-repeat;
	/*가로 세로 이미지 위치 이동 */
	background-size: 250px; /* 배경화면 사이즈(가로) */
	background-repeat: no-repeat; /*반복 패턴 안함*/
	background-position: center;
}

/* 테이블 부분 */
.info_table {
	margin: 0px 10px 10px 30px;
	width: 360px;
}

.info_table div {
	display: flex;
	padding: 7px 0px;
}

.list1 {
	width: 70px;
}

.list2 {
	border-bottom: 1px solid #c3c3c3;
	width: 100%;
}

/*하단 버튼 속성*/
.all_button {
	text-align: center;
	border: 0;
	padding: 15px 0;
	margin: 15px 0;
}

.all_button button {
	background-color: black;
	color: white;
	width: 195px;
	height: 40px;
}
</style>
</head>

<body>
	<%@ include file="../include/header.jsp"%>

	<header>
	
	</header>



	<section>
		<div class="section_wrap">
			<div class="myinfo">
				<h1>내 정보
			</div>
			<div class="flex">
				<div class="photo">사진</div>
				<div class="info_table">
					<div>
						<div class="list1">아이디</div>
						<div class="list2">kenisia</div>
					</div>

					<div>
						<div class="list1">이름</div>
						<div class="list2">이대군</div>
					</div>

					<div>
						<div class="list1">전화</div>
						<div class="list2">010-3161-1234</div>
					</div>

					<div>
						<div class="list1">메일</div>
						<div class="list2">nextturn.games01@gmail.com</div>
					</div>

					<div>
						<div class="list1">주소</div>
						<div class="list2">전남 나주시 빛가람동</div>
					</div>
				</div>
			</div>

			<div class="all_button">
				<div>
					<a href="${path}/member/update">회원정보 수정</a>
					<a href="${path}/member/pwupdate">비밀번호 변경</a>
					<a href="${path}/member/drop">회원탈퇴</a>
				</div>
			</div>
		</div>
		<!-- section_wrap -->

	</section>


</body>
</html>