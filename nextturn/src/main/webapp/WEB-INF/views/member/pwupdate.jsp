<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="../include/header.jsp"%>
       <%@ include file="../include/include.jsp"%>
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
					</span>
					
					</div>
				</div><!-- section_box -->

					
				
			<!-- 사용자 입력칸 -->
				<div class="input_password">
					<div>
						<h3 class="join_title">
							<label for="uid">현재 비밀번호</label>
						</h3>
						<span class="ps_box int_id join_info_box_content">
							<input type="text" id="uid" name="id" class="int jq_eff">
						</span>
						<span class="join_err_msg">에러 출력(.join_err_msg)</span>
					</div>

					<div>
						<h3 class="join_title">
							<label for="upw">새로운 비밀번호</label>
						</h3>
						<span class="ps_box int_pass join_info_box_content" >
							<input type="text" id="upw" name="pw" class="int jq_eff">
							<span class="step_url"><span class="pw_lock"></span></span>
						</span>
						<span class="join_err_msg">에러 출력(.join_err_msg)</span>
					</div>

					<div>
						<h3 class="join_title">
							<label for="urpw">새로운 비밀번호 재확인</label>
						</h3>
						<span class="ps_box int_pass join_info_box_content">
							<input type="text" id="urpw" name="rpw" class="int jq_eff">
							<span class="step_url"><span class="repw_lock"></span></span>
						</span>
						<span class="join_err_msg">에러 출력(.join_err_msg)</span>
					</div>
				</div>
				

				<div class="wrap_btn">
            	 	<a href="#" class="btn"><button><strong>변경 취소</strong></button></a>
            	 	<a href="#" class="btn modal_open"><button><strong>변경 완료</strong></button></a>
            	 </div>

			</section>




		<!--■■■■■■■■ 푸터 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
			<footer>
				
			</footer>
		</div>
	</div>
</body>

<!-- 제이쿼리 (열기/끄기) ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> <!-- 제이쿼리 동작하게 해주는 코드 -->
	<script type="text/javascript">
	
	$(document).on('keyup', '#nowpw', function(){  //ID="nowpw" (이전 비밀번호)에 키입력이 들어오면 동작
		var nowpw = $(this).val();
		
		var result = joinValidate.checkNowpw(nowpw);
		ckDesign(result.code, result.desc, 0, 0);
	});
		
	
	function ckDesign(code, desc, line, msg) { // line : border, msg : err msg
		if(code == 0 || code == 10 || code == 100) { // 통과 O하는 코드들 (validation.js에 있는 코드)
			// 테두리 색상 변경
			$('.join_info_box_content:eq('+line+')').css('border-bottom', '2px solid #3885CA');
			// 에러메세지 출력
			$('.join_err_msg:eq('+msg+')').css('visibility', 'visible')
								    	  .text(desc)
								    	  .css('color', '#3885CA');
			return true;
		} else { // 통과 X
			// 테두리 색상 변경
			$('.join_info_box_content:eq('+line+')').css('border-bottom', '2px solid #d95339');
			// 에러메세지 출력
			$('.join_err_msg:eq('+msg+')').css('visibility', 'visible')
								    	  .text(desc)
						  		    	  .css('color', '#d95339');
			return false;
		}
	}	
</script>
</html>