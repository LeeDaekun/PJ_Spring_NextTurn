<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>

<html>
<head>
	<title>drop_회원 탈퇴</title>
	<!-- 외부 아이콘 사용을 위한 스크립트 -->
	<script src="https://kit.fontawesome.com/1aa6bb9bc2.js" crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="../../css/common.css">
	<link rel="stylesheet" type="text/css" href="../../css/footer.css">
	<style type="text/css">
		.width {
		    width: 768px;
		    margin: 0px auto; /*div 가운데 정렬*/
		}
/*Header --------------------*/
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



	
/*section --------------------*/
	/*제목*/	
		.title {
			margin: 30px 0;
		    padding: 30px 0 0px;
		    text-align: center;
		    font-size: 50px;
		    font-weight: 900;
		    background-position: 84px 22px;
		    background-size: 368px;

		}

	/*섹션 내부 */
		.section {background-color: #fbfbfb;}
	
		.section_box {
		    margin: 20px 40px;
		    padding: 30px 30px;
		    border: 1px solid #dfdfdf;
		    background-color: #fff;
		   
		}

		/*컨텐츠 제목*/
		.content_title{
			padding: 10px 0 10px;
			position: relative;
		}
		
		/*체크박스와 글자가 있는칸*/
		.section_box label {
			display: flex;
			align-items: center;
		}
		
		/*체크 아이콘*/
		.section_box input {
			width: 20px;
			height: 20px;

			position: absolute;
			right: 10px;
		}

		/*------------------------------------*/
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

		
	/*비밀번호 재입력*/
		.input_password {
			/*border: solid red 1px;*/

		    display: flex;
		    text-align: left;
		    justify-content: center;
		}




	/*하단에 탈퇴 취소, 다음단계 버튼 */
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
	
	</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	

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

				<div class="title">NEXT TERN 탈퇴하기</div>
				
			


				<div class="section_box">
					<div class="content_title">
						<label for="ckbox2">
							<input type="checkbox" id="ckbox2" name="">
							<strong>내정보 및 개인형 서비스 이용 기록 삭제 안내</strong>
						</label>
					</div>
					
					<div class="content"><p>내정보 및 개인형 서비스 이용기록이 모두 삭제되며, <span class="red">삭제된 데이터는 복구되지 않습니다.</span>
					     <p>삭제되는 서비스를 확인하시고, 필요한 데이터는 미리 백업을 해주세요.
				
					<table>
						<tr><th>메일</th>
							<td>메일 계정 및 보관중인 메일 삭제</td>
						</tr>

						<tr><th>블로그</th>
							<td>블로그 계정 및 포스팅 게시글 삭제</td>
						</tr>

						<tr><th>주소록</th>
							<td>메일 계정 및 보관중인 메일 삭제</td>
						</tr>
					</table>
					
					</div>
				</div><!-- section_box -->

					
				<div class="section_box">
					<div class="content_title">
						<label for="ckbox3">
							<input type="checkbox" id="ckbox3" name="">
							<strong>게시판형 서비스에 등록한 게시글 삭제 불가 안내</strong>
						</label>
					</div>

					<div class="content">삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.<br>
						탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, <span class="red">게시글을 임의로 삭제해드릴 수 없습니다.</span>
					</div>
				</div><!-- section_box -->

				<div class="input_password">
					<table>
						<tr>
							<th>탈퇴를 진행중인 ID</th><td style="text-align: center">LeeDaeKun</td></tr>
						<tr>	
							<th>비밀번호 재입력</th><td><input type="password"></td></tr>
					</table>
				</div>
				

				<div class="wrap_btn">
            	 	<a href="#" class="btn"><button><strong>탈퇴 취소</strong></button></a>
            	 	<a href="#" class="btn modal_open"><button><strong>다음 단계</strong></button></a>
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
			
	//로그인 모달창 켜고/X눌러서 끄기
			jQuery(document).on('click','.modal_open', function(){	//login_open을 클릭하면, 기능하라(){
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



	</script>
</html>