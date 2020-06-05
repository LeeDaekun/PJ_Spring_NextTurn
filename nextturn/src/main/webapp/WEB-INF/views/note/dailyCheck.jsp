<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp"%>

<title>DailyCheck</title>
<style type="text/css">
.daily_wrap {
	border: 1px solid red;
	width: 900px;
	margin: 10px auto;
}

.content_menu_title {
	font-size: 35px;
	font-weight: bold;
	margin: 20px 0px 5px 0px;
}

.daily_wrap_inner {
	padding: 15px;
	border: 1px solid rgba(20, 23, 28, .1);
	border-radius: 2px;
	box-shadow: 0 0 1px 1px rgba(20, 23, 28, .1), 0 3px 1px 0
		rgba(20, 23, 28, .1);
}

.dailycheck_write_wrap {
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 53px;
}

/*■■■■■ 택스트 입력창 모듈 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
.input_daily_wrap {
	border: 1px solid rgba(20, 23, 28, .1);
	display: inline-block;
	height: 52px;
	position: relative;
	border-radius: 2px;
	width: 1100px;
}

.input_daily { /* 택스트 입력창 */
	background-color: white;
	width: 100%;
	height: 100%;
	/*     resize: none;
	    outline: none; */
}

.btn_which {
	position: absolute;
	top: 0px;
	right: 0px;
}

/*입력창 우측에 시계출력*/
.today_time {
	font-size: 17px;
	padding: 0 15px;
}

/*■■■■■ 데일리 체크 CSS  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
.dailycheck_view_wrap {
	border-top: 1px solid rgba(20,23,28,.1);
}
.dailycheck_view_line {
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 17px;
	padding: 15px;
	border-bottom: 1px solid rgba(20,23,28,.1);
}

	.daily_view_writer {
		color: #007791;
	}
	.dailycheck_view_wrap {
		margin: 15px 0;
	}
	.daily_small_btn {
		border-radius: 2px;
		padding: 5px 7px;
		margin-right: 5px;
		font-weight: normal;
		font-size: 12px;
		background-color: white;
		cursor: pointer;
		outline: none;
	}
	.daily_view_update {
		border: 1px solid #EBA444;
		color: #EBA444;
	}
	.daily_view_update:hover {
		background-color: #EBA444;
		color: white;
	}
	.daily_view_delete {
		border: 1px solid tomato;
		color: tomato;
	}
	.daily_view_delete:hover{
		background-color: tomato;
		color: white;
	}
	.daily_view_cancel{
		border: 1px solid #2F3138;
		color: #2F3138;
	}
	.daily_view_cancel:hover{
		border: 1px solid black;
		color: black;
	}
	#btn_daily_cancel {
		display: none;
	}
	.dailyTT{
		width: 600px;
		height: 35px;
		outline: none;
		resize: none;
		font-size: 17px;
	}

</style>

</head>
<body>
	<div class="category_wrap">
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern="yyyy년MM월dd일 HH시mm분"
			var="today" />
		<div class="category_menu daily_wrap">
			<div class="content_menu_title">출석체크</div>
			<div class="daily_wrap_inner">
				<div class="dailycheck_write_wrap">
					<div class="input_daily_wrap">
						<input type="text" placeholder="" id="dailyContent" name="dailyContent"
							class="input_search input_daily">
						<button type="button" class="btn btn_search btn_which"
							id="btn_daily">
							<i class="fas fa-search"></i>
						</button>
					</div>
					<div class="today_time">
						<span>${today}</span>
					</div>
				</div>

				<!-- 모델에서 받은 키를 아이템즈에 등록 -->
				<div class="dailycheck_view_wrap">
					<c:forEach items="${DailyList}" var="one">
						<div class="dailycheck_view_line">
							<div class="daily_view_content">${one.content}</div>
							<div class="daily_view_writer">
								<c:if test="${one.writer == name}">
									<button type="button" id="btn_daily_cancel" class="daily_view_cancel daily_small_btn">취소</button>
									<button type="button" id="btn_daily_update" class="daily_view_update daily_small_btn">수정</button>
									<button type="button" id="btn_daily_delete" class="daily_view_delete daily_small_btn">삭제</button>
								</c:if>
								${one.writer}
							</div>
						</div>
					</c:forEach>
				</div>
				
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(function() {
		$(document).on('click','#btn_daily',function() {
					var content = $('#dailyContent').val();
					var writer = '${name}';
					//var writer = '';

					if (writer == '') {
						$('.modal_wrap').css('display', 'flex');
						$('#login_id').focus();
						$('.err_content').css('display', 'block').text(
								'로그인이 필요한 기능입니다.');
						return false;
					}

					if (content == '' || content.length == 0) {
						alert('값을 입력해주세요');
						return false;
					}
					console.log('유효성검사 완료');
					//GetMapping을 이렇게 보낼 수 있음
					location.href='${path}/daily/create?content='+content+'&writer='+writer;
				});
	});
	
	//수정버튼 눌렀을때 취소버튼 생성
	$(document).on('click', '#btn_daily_update', function(){
		$('#btn_daily_cancel').css('display', 'inline-block');
		// alert($(this).parent().prev().text());
		$(this).parent().prev().contents().unwrap().wrap('<textarea class="dailyTT"></textarea>');
	});
	
	$(document).on('click', '#btn_daily_cancel', function(){
		$(this).parent().prev().contents().unwrap().wrap('<div class="daily_view_content"></div>');
		$(this).css('display', 'none');
	});
	
	function listDaily(){
		
	}
</script>



</html>
