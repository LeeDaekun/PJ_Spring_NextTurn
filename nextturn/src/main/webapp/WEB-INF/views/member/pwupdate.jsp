<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="../include/header.jsp"%>
       <%@ include file="../include/include.jsp"%>
       <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> <!-- 스프링폼테그를 사용할 수 있습니다 -->
<!DOCTYPE html>
<html>
<head>
	<title>nt_secssion</title>
	
	<link rel="stylesheet" type="text/css" href="../../css/common.css">

	

	<style type="text/css">
/* 탈퇴페이지 CSS 닫기 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  */
		

	/* [계정.도움말,문의] 있는 상단바 */
		.width {
		    width: 768px;
		    margin: 0px auto; /*div 가운데 정렬*/
		}

		.top_menu {
			width: 100%;
		    height: 50px;
		    /*border: solid red 1px;*/
		    font-size: 15px;
		    font-weight: 500;
		    display: flex;
		    align-items: center;
		    justify-content: space-between;
		    padding: 0px 20px;
		    background-color: #d7d5d3;
		    color: #504646;
		}
		/*계정 도움말 문의 간격*/
		.top_menu span {
			padding: 0 10px; 
		}


	/* 제목: Nextturn 비밀번호 변경*/	
		div.title {
			margin: 30px 0;
		    padding: 30px 0 0px;
		    text-align: center;
		    font-size: 50px;
		    font-weight: 900;
		    background-position: 84px 22px;
		    background-size: 368px;

		}


	/* 안내맨트 : 누가 뒤에서 보고있는지 주의하세요 */
		.section {background-color: #fbfbfb;}
	
		.section_box {
		    margin: 20px 40px;
		    padding: 30px 30px;
		    border: 1px solid #dfdfdf;
		    background-color: #fff;
		   
		}


	/* 비밀번호는 소문자 대문자를 포함하여 .... */
		.content{
			font-size: 12px;
		}
		.red{
			color: red;
		}
		.content table {
			padding-top: 15px;
			text-align: left;
		}

		
	/* 사용자 입력창 3개 =============*/
		.join_title{
				margin: 19px 0 8px;
				font-size: 14px;
				font-weight: 700; /* bold를 수치로 주는것 100~900까지 숫자로 조절 (기본은 400)(bold = 700 )  100 400 */
				color: black;
			}
			.ps_box{
				display: flex; /*얼라인 아이템과 세트*/
				align-items: center;

				position: relative; /*기본 위치*/
				width: 100%; /*가로 영역은 최대로*/
				height: 51px;	/*세로 51픽셀*/

				border: 1px solid #dadada;
				padding: 10px 14px 10px 14px;
				background: #fff;
				vertical-align: top; /*네이버에서 줘놔서 넣은것, 상단정렬*/
			}
			.int_id{
				padding-right: 110px; /*글자 작성란 오른쪽에 패딩을 줘서 공간을 만듬*/
			}
			.int_pass{
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

			.join_err_msg {
			    display: block;
			    margin: 9px 0 -2px;
			    font-size: 12px;
			    line-height: 14px;
			    color: red;
			    height: 15px;
			    /* display: none; */
			    /* visibility: hidden;*/
			    }


	/* 하단에 [변경취소] [변경완료] 버튼 */
		.wrap_btn  {
			padding: 20px 0;
			text-align: center;
		}
		.wrap_btn button {
			width: 200px;
			height: 50px;
			background-color: #3c3838;
			color: white;
			font-size: 15px;
		}
		

		.input_password{  /* 인풋박스 3개 */
			margin: 50px 100px;
	
		}	
	

	</style>
</head>
<body>
	

	<div class="wrap">
		<div class="width">
		<!--■■■■■■■■ 헤더 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
			<header>
				<div class="top_menu">
					<div>
						<span><a href="#">계정</a></span>
					</div>

					<div>
						<span><a href="#">도움말</a></span>
						<span><a href="#">문의하기</a></span>
					</div>
				</div>
			</header>

		<!--■■■■■■■■ 섹션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
			<section class="section">

				<div class="title">NEXT TERN 비밀번호 변경</div>
				
		
				<div class="section_box">
					<div class="content_title">
						<label for="ckbox2">
							<strong>누가 뒤에서 보고있는지 주의하세요</strong>
						</label>
					</div>
					
					<div class="content"><p>비밀번호는 소문자 대문자 특수문사 숫자를 넣어서 10글자 이상으로 만들어주세요
					</div>
				</div><!-- section_box -->

					
				
			<!-- 사용자 입력칸 -->
			<form:form id="frm_member" modelAttribute="memberDTO" autocomplete="on">  <!-- post가 기본인 스프링폼태그, 상단에 인클루드 선언필요 -->
				<div class="input_password">
					<div>
						<h3 class="join_title">
							<label for="uid">현재 비밀번호</label>
						</h3>
						<span class="ps_box int_id join_info_box_content">
							<input type="text" class="int pw_input">
						</span>
						<span class="join_err_msg">에러 출력(.join_err_msg)</span>
					</div>

					<div>
						<h3 class="join_title">
							<label for="upw">새로운 비밀번호</label>
						</h3>
						<span class="ps_box int_pass join_info_box_content" >
							<input type="text" name="pw" class="int next_pw_input">
							<span class="step_url"><span class="pw_lock"></span></span>
						</span>
						<span class="join_err_msg">에러 출력(.join_err_msg)</span>
					</div>

					<div>
						<h3 class="join_title">
							<label for="urpw">새로운 비밀번호 재확인</label>
						</h3>
						<span class="ps_box int_pass join_info_box_content">
							<input type="text" name="rpw" class="int next_repw_input">
							<span class="step_url"><span class="repw_lock"></span></span>
						</span>
						<span class="join_err_msg">에러 출력(.join_err_msg)</span>
					</div>
				</div>
			

				<div class="wrap_btn">
            	 	<a href="#" class="btn"><button><strong>변경 취소</strong></button></a>
            	 	<a href="#" class="btn btn_join"><button><strong>변경 완료</strong></button></a>
            	 </div>
			</form:form>
			
			</section>




		<!--■■■■■■■■ 푸터 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
			<footer>
				
			</footer>
		</div>
	</div>
</body>

<!-- 제이쿼리 (열기/끄기) ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> <!-- 제이쿼리 동작하게 해주는 코드 -->
<script src="${path}/resources/js/validation.js"></script> <!-- joinvalidate 를 인클루드 한다 -->
<script type="text/javascript">

	// 단독으로 사용할 경우
	// $(document).on('keyup', '.pw_input', function() {
	// });

	$(function() {
		//비밀번호가 유효한 값인지 체크해주는 Flag값
		var pwFlag = false;

		// 유효성체크 여부를 알려주는 배열
		var checkArr = new Array(2).fill(false);
		// printCheckArr(checkArr);

		// 유효성 체크 모두 통과 or 불통 여부
		var checkAll = true;

		// 공유하여 쓸 경우(전역변수를 쓸 것인지의 유무/메서드 호출 유무X)
		// 반드시 (document).ready(function(){}); 안에서만 사용 가능
		$('.pw_input').keyup(function() {
			var nowpw = $(this).val();
			
			var result = joinValidate.checkNowpw(nowpw);
			
			console.log("code: " + result.code);
			ckDesign(result.code, result.desc, 0, 0);
			
			if(result.code == 100) {
				checkArr[0] = true;
			} else {
				checkArr[0] = false;
			}
		});
		
		// pw 유효성체크
		$('.next_pw_input').keyup(function() {
			// 현재 비밀번호
			var nowpw = $.trim($('.pw_input').val());
			// 1. 사용자가 입력한 값 받기
			var pw = $.trim($(this).val());
			var rpw = $.trim($('.next_repw_input').val());

			// 2. 유효성 체크하기
			var result = joinValidate.checkPw(nowpw, pw, rpw);
			if (result.code == 0 || result.code == 10 || result.code == 6) {
				pwFlag = true;
			} else {
				pwFlag = false;
			}

			// 3. 체크 결과에 따라 디자인하기
			ckDesign(result.code, result.desc, 1, 1);

			if (result.code == 10) {
				checkArr[1] = true;
				$('.ps_box:eq(1)').css('border', '2px solid #3885CA');
				// $('.pw_lock').css('background-position', '-54px 0px');
			} else if (result.code == 6) {
				checkArr[1] = false;
				$('.ps_box:eq(1)').css('border', '2px solid #d95339');
			} else {
				checkArr[1] = false;
			}
		});

		// 비밀번호 재확인 유효성체크
		$('.next_repw_input').keyup(function() {
			var pw = $.trim($('.next_pw_input').val());
			var rpw = $.trim($(this).val());

			var result = joinValidate.checkRpw(pw, rpw, pwFlag);
			ckDesign(result.code, result.desc, 2, 2);

			if (result.code == 10) {
				checkArr[1] = true;
			} else if (result.code == 6) {
				checkArr[1] = false;
			} else {
				checkArr[1] = false;
			}
		});
		
		// 버튼 활성화
		$('.int').keyup(function() {
			printCheckArr(checkArr);
			ckColorBtn();
		});
		
		function ckColorBtn(){
			var checkAll = true;
			for (var i = 0; i < checkArr.length; i++) {
				if (!checkArr[i]) {
					checkAll = false;
				}
			}
			if (checkAll) {
				$('#btn_join').addClass('btn-primary');
				// $('#btn_join').prop('disabled', false);
				$('#btn_join').css('cursor', 'pointer');
			} else {
				$('#btn_join').removeClass('btn-primary');
				// $('#btn_join').prop('disabled', true);
				$('#btn_join').css('cursor', 'no-drop');
			}
		}
		
		$('#btn_join').click(function(){
			 var invalidAll = true;
			 for(var i = 0; i < checkArr.length; i++){
				 if(!checkArr[i]) {
					 invalidAll = false;
					 $('.join_err_msg:eq('+i+')').css('visibility', 'visible')
					 							 .css('color', '#d95339');
				 }
			 }
			 if(invalidAll) {
				$('#frm_member').submit(); 
			 } else{
				 alert('유효성체크를 진행해주세요!');
			 }
		});
		
	});
	
	function ckDesign(code, desc, line, msg) {
		if (code == 0 || code == 10 || code == 100) { // 통과 o
			$('.ps_box:eq(' + line + ')').css('border', '2px solid #3885CA');
			$('.join_err_msg:eq(' + msg + ')').css('visibility', 'visible')
												.text(desc)
												.css('color', '#3885CA');
			return true;
		} else { // 통과 x
			console.log("line" + line + ", msg" + msg);
			$('.ps_box:eq(' + line + ')').css('border', '2px solid #d95339');
			$('.join_err_msg:eq(' + msg + ')').css('visibility', 'visible')
												.text(desc)
												.css('color', '#d95339');
			return false;
		}
	}
	
	// 개발시 사용 : 유효성체크 전체 여부를 출력해주는 함수(true, false)
	function printCheckArr(checkArr) {
		for (var i = 0; i < checkArr.length; i++) {
			console.log(i + '번지: ' + checkArr[i]);
		}
	}
	
</script>
</html>