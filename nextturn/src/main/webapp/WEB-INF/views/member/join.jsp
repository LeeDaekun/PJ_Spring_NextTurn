<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>join_input</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/footer.css">
<!-- 푸터 CSS추가 -->

<link rel="icon" type="image/png" href="..">
<!-- 파비콘 -->
<script src="https://kit.fontawesome.com/fc5ae9294d.js"
	crossorigin="anonymous"></script>
<!-- 폰트어썸 아이콘 사용 스크립트 -->
<link rel="stylesheet" type="text/css" href="">

<style type="text/css">
.wrap {
	width: 768px;
	margin: 0 auto;
	/*		border: 1px solid black;*/
}

.header {
	padding: 40px 0px 0px;
	position: relative;
	/* 		border: 1px solid red; */
}

.n_logo {
	display: block;
	/*인라인블럭 또는 블럭으로 쓸수 있다  인라인블럭은 가로다 내꺼가 아니다/ 블럭은 한줄에 빈공간을 마진으로 채우고, 인라인블럭은 마진이 없다*/
	width: 420px;
	height: 85px;
	background: url("../resources/img/logos.png") 0 0px;
	/*통합된 이미지소스를 사용하므로 백그라운드로 넣어서 위치를 바꿔서 사용함 block 을 써야함*/
	background-size: 420px;
	margin: auto;
}

.join_content { /*div 는 기본적으로 block 속성이 되있다. (가로 다 내꺼 마진 포함됨)*/
	width: 460px;
	margin: 0 auto;
}

.row_group {
	overflow: hidden;
	width: 100%;
}

.join_title {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
	/* bold를 수치로 주는것 100~900까지 숫자로 조절 (기본은 400)(bold = 700 )  100 400 */
	color: black;
}

.ps_box {
	display: flex; /*얼라인 아이템과 세트*/
	align-items: center;
	position: relative; /*기본 위치*/
	width: 100%; /*가로 영역은 최대로*/
	height: 51px; /*세로 51픽셀*/
	border: 1px solid #dadada;
	padding: 10px 14px 10px 14px;
	background: #fff;
	vertical-align: top; /*네이버에서 줘놔서 넣은것, 상단정렬*/
}

.int_id {
	padding-right: 110px; /*글자 작성란 오른쪽에 패딩을 줘서 공간을 만듬*/
}

.int_pass {
	padding-right: 40px; /*글자 작성란 오른쪽에 패딩을 줘서 공간을 만듬*/
}

.int {
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	padding-right: 25px;
	line-height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
	z-index: 10;
}

.step_url { /*인풋태그 옆에 @naver.com */
	position: absolute;
	right: 13px;
	font-size: 15px;
	color: #8e8e8e;
}

.join_err_msg { /*필수 정보입니다  입력안했을때 나오게 할것*/
	display: block;
	margin: 9px 0 -2px;
	font-size: 12px;
	line-height: 14px;
	color: red;
	height: 15px;
	/*display: none;*/ /*none으로 하면 공간까지 사라지니.hidden 으로*/
	visibility: hidden;
}

.pw_lock { /*비밀번호 입력부분 아이콘*/
	background-image:
		url("https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png");
	background-repeat: no-repeat; /*이미지 반복하지 않음*/
	background-size: 125px 75px; /*배경 이미지 크기를 바꿈*/
	cursor: pointer;
	width: 24px;
	height: 24px;
	display: inline-block; /*마진이 없는 블록*/
}

.repw_lock { /*비밀번호 입력부분 아이콘*/
	background-image:
		url("https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png");
	background-repeat: no-repeat; /*이미지 반복하지 않음*/
	background-size: 125px 75px; /*배경 이미지 크기를 바꿈*/
	cursor: pointer;
	width: 24px;
	height: 24px;
	display: inline-block; /*마진이 없는 블록*/
	background-position: -27px 0; /*배경 이미지 위치를 바꿈*/
}

.bir_wrap {
	display: table; /*display flex를 써서 div div div 가 나란히 오게도 할수 있다/ */
	width: 100%; /*테이블 속성을 줘서, table 태그로 만들기*/
}

.bir_mm, .bir_dd {
	padding-left: 10px; /*왼쪽 패딩을 줘서 table-cell간의 간격을 주겠다*/
}

.bir_yy, .bir_mm, .bir_dd {
	display: table-cell;
	table-layout: fixed;
	width: 147px;
	vertical-align: middle;
}

.sel {
	background: #fff
		url('https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif') 100%
		50% no-repeat;
	background-size: 20px 8px; /*이밎 사이즈 지정*/
	width: 100%;
	height: 29px;
	font-size: 15px;
	line-height: 18px;
	color: #000;
	border: none;
	-webkit-appearance: none; /* 기본적으로 제공하는 꺾쇠를 지우겠다 */
}

.choice { /*본인 확인 이메일의 (선택) 글자*/
	font-size: 12px;
	font-weight: 400;
	color: #828282;
}

/*가입하기 버튼*/
.btn_double_area {
	margin: 30px 0 9px;
}

.btn_type {
	display: block;
	width: 100%;
	padding: 21px 0 17px;
	font-size: 20px;
	font-weight: 700;
	text-align: center;
	color: white;
	background-color: #d8d8d8;
	cursor: no-drop;
	/* 	마우스가	X	표시로	시작함 */
}

/*true 일때 추가될 클래스 (제이쿼리에서 추가함)*/
.jq_btn_true {
	background-color: #121212;
}

/* 로딩바 */
#back {
	position: fixed;
	z-index: 1200;
	background-color: rgba(0, 0, 0, 0.4);
	overflow: auto;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	display: none;
	align-items: center;
	justify-content: center;
}

.loading_img {
	animation: ani_loading 1.5s infinite linear;
	font-size: 70px;
	color: #EBA444;
}

@keyframes ani_loading {
	from {-webkit-transform: rotate(0deg);
}

to {
	-webkit-transform: rotate(359deg);
}
/*===================================================================*/
</style>

</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="wrap">
		<header>
			<div class="header">
				<h1 class="naver_logo">
					<a href="header.html" class="n_logo"></a>
				</h1>
			</div>
		</header>

		<section>
			<!-- Spring 폼태그 형식의 Form, 세션 어트리뷰트에 자료를 담을때는 스프링폼태그를 써야함 -->
			<!-- 폼태그 안에 name 값들이 변수로 담길꺼야 -->
			<form:form id="frm_member" modelAttribute="memberDTO" autocomplete="on">

				<div class="container">
					<div class="join_content">

						<div class="row_group">

							<div class="join_row">
								<h3 class="join_title">
									<label for="uid">아이디</label>
								</h3>
								<span class="ps_box int_id join_info_box_content"> <input
									type="text" id="uid" name="id" class="int jq_eff" value="${user.id}"> <span
									class="step_url">@naver.com</span>
								</span> <span class="join_err_msg">필수 정보입니다.</span>
							</div>

							<div class="join_row">
								<h3 class="join_title">
									<label for="upw">비밀번호</label>
								</h3>
								<span class="ps_box int_pass join_info_box_content"> <input
									type="text" id="upw" name="pw" class="int jq_eff"> <span
									class="step_url"><span class="pw_lock"></span></span>
								</span> <span class="join_err_msg">필수 정보입니다.</span>
								<h3 class="join_title">
									<label for="urpw">비밀번호 재확인</label>
								</h3>
								<span class="ps_box int_pass join_info_box_content"> <input
									type="text" id="urpw" name="rpw" class="int jq_eff"> <span
									class="step_url"><span class="repw_lock"></span></span>
								</span> <span class="join_err_msg">필수 정보입니다.</span>
							</div>
						</div>




						<div class="row_group">
							<div class="join_row">
								<h3 class="join_title">
									<label for="uname">이름</label>
								</h3>
								<span class="ps_box join_info_box_content"> 
									<input type="text" id="uname" name="name" class="int jq_eff" value="${user.name}">
								</span> <span class="join_err_msg">필수 정보입니다.</span>
							</div>
<!-- 
							<div class="join_row join_birthday">
								<h3 class="join_title">
									<label for="yy">생년월일</label>
								</h3>
								<div class="bir_wrap">

									<div class="bir_yy">
										<span class="ps_box join_info_box_content"> <input
											type="text" id="yy" name="yy" class="int jq_eff"
											placeholder="년 (4자)">
										</span>
									</div>
									<div class="bir_mm">
										<span class="ps_box join_info_box_content"> <select
											id="mm" class="sel">
												<option>월</option>
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
										</select>
										</span>
									</div>

									<div class="bir_dd">
										<span class="ps_box join_info_box_content"> <input
											type="text" id="dd" placeholder="일" class="int jq_eff">
										</span>
									</div>
									<input type="hidden" name="birth" id="birth">
								</div>
								<span class="join_err_msg">태어난 년도를 4자리 입력하세요</span>
							</div>

							<div class="join_row">
								<h3 class="join_title">
									<label for="male">성별</label>
								</h3>
								<span class="ps_box join_info_box_content"> <select
									class="sel" id="male" name="male">
										<option>성별</option>
										<option value="m">남성</option>
										<option value="w">여성</option>
								</select>
								</span> <span class="join_err_msg">필수 정보입니다.</span>
							</div> 
-->

							<div class="join_row">
								<h3 class="join_title">
									<label for="uemail">본인 확인 이메일<span class="choice">(선택)</span></label>
								</h3>
								<span class="ps_box join_info_box_content"> 
									<input type="text" id="uemail" name="email" class="int jq_eff" placeholder="선택입력" value="${user.email}">
								</span> <span class="join_err_msg">필수 정보입니다.</span>
							</div>

							<div class="join_row">
								<h3 class="join_title">
									<label for="uphone">휴대전화</label>
								</h3>
								<span class="ps_box join_info_box_content"> 
									<input type="text" id="uphone" name="phone" class="int jq_eff" placeholder="-없이 입력 예)01077779999" value="${user.phone}">
								</span> 
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>



							<div class="join_row">
								<h3 class="join_title">
									<label for="uaddr">주소<span class="highlight">*</span></label>
								</h3>
								<div class="addr_wrap">
									<div class="postcode" style="display: flex;">
										<span class="join_info_box_content ps_box addr_poc"> 
											<input type="text" id="sample6_postcode" class="int jq_eff addr_only" name="postcode" placeholder="우편번호" value="520831" value="${user.postcode}" readonly>
										</span> 
										<input type="button" id='btn_post' class="addr_poc_button jq_eff" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									</div>
									<span class="join_info_box_content ps_box"> 
										<input type="text" id="sample6_address" class="int addr_only jq_eff" name="addr1" placeholder="주소" value="${user.addr1}" readonly><br>
									</span> 
									<span class="join_info_box_content ps_box"> 
										<input type="text" id="sample6_detailAddress" class="int jq_eff" name="addr2" value="${user.addr2}" placeholder="상세주소">
									</span>
								</div>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>



						</div>

						<div class="btn_double_area">
							<span><a href="#" id="btn_join" class="btn_type">가입하기</a></span>
						</div>

					</div>
				</div>
			</form:form>
			<!-- 스프링전용 폼태그 닫음  -->
		</section>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>












<!-- 제이쿼리 -->
<script type="../../js/daum_post.js"></script>
<!-- daum 주소입력 관련 스크립트 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<!-- 유효성체크 모아둔것 -->
<script type="text/javascript">
	//$(document).ready(function(){  });
	// $(function(){	});              둘이 똑같은 코드이다

	$(function() {
		//비밀번호가 유효한 값인지 체크해주는 Flag값
		var pwFlag = false; //유효성검사 5번까지 통과하c면 true로 바꾸세요, (checkId: function(id) 유효성검사기)

		// 유효성체크 여부를 알려주는 배열
		var checkArr = new Array(6).fill(false); //트루 펄스 상황을 체크해주는 변수
		printCheckArr(checkArr); //하단에 기능 만들어둔것을 호출함(checkArr 값을 보냄)

		//유효성체크 모두 통과 or 불통 여부를 알려주는 변수
		var checkAll = true; //checkArr이 7개 전부 트루값일때 트루로 바꿔줄것
		
		if('${user}' != ''){
			// 회원정보수정 디자인 변경
			// 버튼 텍스트 수정하기
			$('#btn_join').text('수정하기');
			// 비밀번호, 비밀번호 재설정 제거
			$('.join_row:eq(1)').css('visibility', 'hidden')
								.css('height', '0px');
			// id에 readonly효과를 줘서 입력이 불가능
			// id=#id를 제거해서 우리가 입력한 유효성체크 동작 불가능
			$('#uid').attr('readonly', 'true')
					 .removeAttr('id');
			
			var name = '${user.name}';
			var phone = '${user.phone}';
			var email = '${user.email}';
			var postcode = '${user.postcode}';
			var addr1 = '${user.addr1}';
			var addr2 = '${user.addr2}';
			//키보드를 안눌러도 즉시 유효성체크 시작
			ckName(name);
			ckPhone(phone);
			ckEmail(email);
			ckAddr(postcode, addr2);
			checkArr[0] = true;  //아이디는 항상 true면 유효성검사 항상 통과
			checkArr[1] = true;  //비밀번호는 항상 true면 유효성검사 항상 통과
			ckColorBtn();  //function ckColorBtn(){ 기능
			printCheckArr(checkArr);
			
		}

		//전체 열기/닫기
		// 아이디 유효성체크■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		// >> #uid인 input태그의 값을 가져와서 체크
		$('#uid').keyup(function() { //uid 사용자가 입력하는 input 창
			var id = $(this).val().trim(); //트림을 넣으면 좌공백 우공백을 지워준다, 가운데 껴있는건 못지움

			//joinValidate.js 에서 checkID로 유효성 체크를 실행하고,
			//결과를 result에 담음 (code, desc)
			var result = joinValidate.checkId(id); //상단에 path 해둔 validation.js에서  heckID메서드를 실행

			if (result.code == 0) {
				checkArr[0] = 'true';
			} else {
				checkArr[0] = 'false';
			}
			printCheckArr(checkArr);

			//유효성체크 결과로 테두리색과 err메시지를 출력하는 함수 실행
			ckDesign(result.code, result.desc, 0, 0); //코드가0 이면?
		});

		//비밀번호 유효성체크■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$('#upw').keyup(
				function() { //upw 에서 키보드를 누르면
					//▶1. 사용자가 입력한 값 받기
					var pw = $.trim($(this).val()); //upw에서 
					var rpw = $.trim($('#urpw').val());

					//▶2. 비밀번호(1) 유효성* 체크하기
					var result = joinValidate.checkPw("",pw, rpw);
					console.log(result.code + ',' + result.desc);

					if (result.code == 0 || result.code == 10
							|| result.code == 6) { //비밀번호가 일치하면 플레이그 트루
						pwFlag = true;
					} else {
						pwFlag = false;
					}

					if (result.code == 10) { //비밀번호가 일치하면 css 테두리
						checkArr[1] = true;
						$('.join_info_box_content:eq(2)').css('border-bottom',
								'2px solid #3885CA');

					} else if (result.code == 6) {
						checkArr[1] = false;
						$('.join_info_box_content:eq(2)').css('border-bottom',
								'2px solid #3885CA');
					} else {
						checkArr[1] = false;
					}
					printCheckArr(checkArr); //상태로고 띄우는 기능 (하단에 만들어둠)

					//▶3. 체크 결과에 따라 디자인 하기■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
					ckDesign(result.code, result.desc, 1, 1);
					//코드1은 필수정보 입력을 말함
				}); //pw keyup

		//urpw비밀번호 재확인(2) 유효성체크■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$('#urpw').keyup(
				function() {
					var pw = $.trim($('#upw').val());
					var rpw = $.trim($('#urpw').val());

					var result = joinValidate.checkRpw(pw, rpw, pwFlag); //메서드 실행

					if (result.code == 10) { //10.사용가능한 비밀번호입니다
						checkArr[1] = true; //비번은1번
						//1번(비번 입력창에도) join_info_box_content 에 css 적용
						$('.join_info_box_content:eq(1)').css('border-bottom',
								'2px solid #3885CA');
					} else if (result.code == 6) { //3.비밀번호가 일치하지 않습니다
						checkArr[1] = false;
						$('.join_info_box_content:eq(1)').css('border-bottom',
								'2px solid #3885CA');
					} else {
						checkArr[1] = false;
					}
					printCheckArr(checkArr); //상태로고 띄우는 기능 (하단에 만들어둠)
					//(code,    desc,  line,  msg)
					ckDesign(result.code, result.desc, 2, 2); //3번째줄에 입력하면 3번째줄에 에러출력함
					//에러클래스 :code desc는 val=result에서 받아옴,
					//라인:join_info_box_content의 순서 2,1 순서를 말함 
					//테두리 색깔바꿀 줄번호
					//에러메시지 출력할 줄번호

				}); //urpw keyup

		// 이름 유효성체크■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$('#uname').keyup(function() {
			var name = $.trim($(this).val()); 
			ckName(name);
		});

		function ckName(name) {
			var result = joinValidate.checkName(name);
			ckDesign(result.code, result.desc, 3, 3); //3번째에 라인, 2번째에 메시지 띄움

			//기능테스트기 (나중에 삭제)
			if (result.code == 0) {
				checkArr[2] = true;
			} else {
				checkArr[2] = false;
			}
			printCheckArr(checkArr); //상태로고 띄우는 기능 (하단에 만들어둠)}
		}//function name 종료

		// 전화번호 유효성체크■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$('#uphone').keyup(function() {
			var phone = $.trim($(this).val()); //변수 phone
			ckPhone(phone);
		});

		function ckPhone(phone) {
			var result = joinValidate.checkPhone(phone);
			ckDesign(result.code, result.desc, 5, 5); //3번째에 라인, 2번째에 메시지 띄움

			//기능테스트기 (나중에 삭제)
			if (result.code == 0) {
				checkArr[4] = true;
			} else {
				checkArr[4] = false;
			}
			printCheckArr(checkArr); //상태로고 띄우는 기능 (하단에 만들어둠)
		}//function phone 종료

		// 이메일 유효성체크■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$('#uemail').keyup(function() {
			var email = $.trim($(this).val()); //변수 email
			ckEmail(email);
		});

		function ckEmail(email) {
			var result = joinValidate.checkEmail(email);
			// alert('test');
			ckDesign(result.code, result.desc, 4, 4); // 쌤꺼는 

			//기능테스트기 (나중에 삭제)
			if (result.code == 0) {
				checkArr[3] = true;
			} else {
				checkArr[3] = false;
			}
			printCheckArr(checkArr); //상태로고 띄우는 기능 (하단에 만들어둠)
		}//function phone 종료

		
		
		//daum 주소창 관력 클릭시 동작펑션■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$('.addr_only').click(function() { //우편번호, 주소를 클릭했을때 동작

			$('#btn_post').click(); //우편번호 찾기 버튼을 클릭했을때 동작
		});

		//daum 상세주소를 클릭했을때 동작기능 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$('#sample6_detailAddress').click(function() { //상세주소 클릭시 동작한다
			var addrPost = $('#sample6_postcode').val(); //우편번호 란에 입력된 input을 받아서 addrPost 에 저장
			if (addrPost == '' || addrPost.length == 0) { //addrPost에 우편번호가 없거나, 글자수가 0이라면
				// $('#btn_post').click();  //우편번호 찾기를 누름
				//여기의 전체 기능은 사용되지 않고있음
			}
		});

		// 주소 유효성체크 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$('#sample6_detailAddress').keyup(function() { //id=sample6_detailAddress 에서 키를 눌렀을때 동작
			var addrPost = $('#sample6_postcode').val();//우편번호 란에 입력된 input을 받아서 addrPost 에 저장
			var addrDetail = $.trim($(this).val()); //this = sample6_detailAddress  (trim은 문자열에 들어오는 공백값을 무시하는 기능)
			ckAddr(addrPost, addrDetail); //function ckAddr 호출
		});

		function ckAddr(addrPost, addrDetail) { //상세주소랑 우편번호를 받아서
			var result = joinValidate.checkAddr(addrDetail, addrPost); //validation.js에서 checkAddr(주소유효성체크) 호출
			// console.log(result.code + ', ' + result.desc);

			if (result.code == 3) { // 우편번호 & 주소 X
				ckDesign(result.code, result.desc, 6, 6);
				ckDesign(result.code, result.desc, 7, 6);
			} else if (result.code == 0) { // 성공
				ckDesign(result.code, result.desc, 6, 6);
				ckDesign(result.code, result.desc, 7, 6);
				ckDesign(result.code, result.desc, 8, 6);
			} else { // 상세주소 X
				ckDesign(result.code, result.desc, 8, 6);
			}

			//기능테스트기 (나중에 삭제)
			if (result.code == 0) {
				checkArr[5] = true;
			} else {
				checkArr[5] = false;
			}
			printCheckArr(checkArr); //상태로고 띄우는 기능 (하단에 만들어둠)
		}

		//버튼 활성화!
		$('.jq_eff').keyup(function() {
			ckColorBtn();
		});//$('.join_info_box_input').blur(function(){

		function ckColorBtn(){
			var checkAll = true;

			for (var i = 0; i < checkArr.length; i++) {
				if (!checkArr[i]) { //checkArr을 반복을 돌려서 하나라도 false 이면 
					checkAll = false; //checkAll을 false로 바꿈
				}//if
			}//for

			if (checkAll) { //checkAll 이 트루인경우
				$('#btn_join').addClass('jq_btn_true'); //btn-primary 클래스를 추가함
				// $('#btn_join').prop('disabled', false);
				$('.btn_type').css('cursor', 'pointer'); //커서는 포인터로 바꿈

			} else { //checkAll이 false 인 경우.
				$('#btn_join').removeClass('jq_btn_true'); //btn-primary클래스를 제거함
				// $('#btn_join').prop('disabled', true);
				$('.btn_type').css('cursor', 'no-drop'); //커서는 노드롭으로 바꿈
			}
		}
			
		// 회원가입 버튼 클릭! ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$('#btn_join').click(
				function() {
					// alert('클릭 테스트');
					printCheckArr(checkArr);
					var invalidAll = true; //모든 유효성 검사가 완료되면, 여기에 트루가 들어온다.
					for (var i = 0; i < checkArr.length; i++) {
						if (!checkArr[i]) { //false 라면 패스
							invalidAll = false; //유효성 검사가 하나라도 통과못하면 false 가 됨

							$('.join_err_msg:eq(' + i + ')').css('visibility',
									'visible').css('color', '#d95339');
						} //갯수가 모자라서 아래까지 안뜸. 어레이 목록을 더 작업해야함
					}//for

					console.log(invalidAll); //트루인지 펄스인지 콘솔로 확인

					//생년월일 데이터 하나의 변수로 합치기 birth
					var yy = $('#yy').val();
					var mm = $('#mm').val();
					var dd = $('#dd').val();
					var birth = $('#birth').val(yy + mm + dd);

					if (invalidAll) { //트루라면 모든유효성체크가 트루인것이다.
						FunLoadingBarStart(); //빙글빙글 로딩바 함수(하단에 참조)

						alert('회원가입 성공!');
						// submit : form태그 안에 있는 데이터들을 서버단으로 전송
						// action : 목적지(MemberController '/join')
						// method : 방법(POST : 숨겨서)
						$('#frm_member').submit(); //서브밋은 컨트롤러로 값을 넘겨줌(스프링 폼태그의 기본값은 post 로 전송)
					} else {
						alert('유효성체크를 진행해주세요');
					}
					//유효성체크가 전부 true이면
					//유효성체크가 하나라도 false 이면
				});//$('#btn_join').click(function(){

	}); //function end

	//function ckDesign(code, desc, line, msg) {■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	function ckDesign(code, desc, line, msg) { //???
		if (code == 0 || code == 10) { // 유효성검사 통과 O

			$('.join_info_box_content:eq(' + line + ')').css('border-bottom',
					'2px solid #3885CA');
			//몇번째(line) join_info_box_content 인지 확인
			//실패하면, CSS로 주황색으로 테두리색상이 되도록 변경 

			$('.join_err_msg:eq(' + msg + ')').css('visibility', 'visible') //에러메시지 출력
			.text(desc).css('color', '#3885CA');
			return true;

			//
		} else { // 유효성검사통과 X
			//테두리 색상 변경
			$('.join_info_box_content:eq(' + line + ')').css('border-bottom',
					'2px solid #d95339');

			$('.join_err_msg:eq(' + msg + ')').css('visibility', 'visible')//에러메시지 출력
			.text(desc).css('color', '#d95339');
			return false;
		}
	
	}//function ckDesign(code, desc, line, msg)
	
	// ■■■■■■■■■ 개발시 사용: 유효성 체크 전체여부를 출력해주는 함수 (true, false) (웹에서 F12 눌러서 확인할 수 있음) ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	function printCheckArr(checkArr) {
		// 유효성체크 여부를 알려주는 배열
		// for(var i=0; i < checkArr.length; i++){  //체크Arr 갯수만큼 반복돌림
		// 	console.log(i+'번지:'+checkArr[i]);	 //콘솔 로그 찍음
		// }
		console.log('1아이디▶▶▶' + checkArr[0]);
		console.log('2PW/rPW▶▶▶' + checkArr[1]);
		console.log('3 이름 ▶▶▶' + checkArr[2]);
		console.log('4이메일▶▶▶' + checkArr[3]);
		console.log('5휴대폰▶▶▶' + checkArr[4]);
		console.log('6 주소 ▶▶▶' + checkArr[5]);
		console.log('■■■■■■■■■■■■■■■■■■■■■');
	}//  function printCheckArr(checkArr){ 

	// 로딩바 출력
	function FunLoadingBarStart() {
		var loadingBarImage = ''; // 가운데 띄워줄 이미지
		loadingBarImage += "<div id='back'>";
		loadingBarImage += "<div id='loadingBar'>";
		loadingBarImage += "<i class='fas fa-spinner loading_img'></i>";
		loadingBarImage += "</div></div>";
		$('body').append(loadingBarImage); //append 는 HTML에 소스를 추가해주는 기능 
		$('#back').css('display', 'flex');
		$('.loading_img').show();
	}

	// 로딩바 제거
	function FunLoadingBarEnd() {
		$('#back, #loadingBar').hide();
		$('#back, #loadingBar').remove();
	}
</script>






<!-- daum address -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//■■■■■■■■ daum 주소입력창
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr
								+ extraAddr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}

</script>
</html>