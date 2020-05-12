<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>

	<title>board</title>
	<!-- 서치박스 스크립트 -->
	<script src="https://kit.fontawesome.com/1aa6bb9bc2.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">

<style type="text/css">
/*  	div, span, table, tr, td, a{
	border: 1px solid green
}  */

	.board_wrap {
		width: 900px;
		height: 800px;
		margin: 0px auto;
	}


/*■■■■ 호버버튼들 스타일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.hover_btn {
		background-color: #949494;  /*로그인 버튼 색상 (노 호버)*/
		color: #f1f1f1;
		outline: none; /* 파란색 테두리 사라짐 */
		border-radius: 5px;
	}
	.hover_btn:hover {
		background-color: #2B2B2B; /*호버시 회원가입 버튼 색상*/
		color: #f1f1f1;
		outline: none; /* 파란색 테두리 사라짐 */
	}


/*■■■■ 테이블 스타일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.board_table{
	    width: 100%;  /*테이블 가로길이*/
		border-spacing: 0px; /*테이블 테두리 제거*/
		background: #f7f7f7;
		}
	
	
	.board_table tr td{
		font-size: 12px;
		padding: 15px 0px;

		border-bottom: 1px solid #d0d0d0;
		text-align: center;
	}

	.board_table td:nth-child(2) {
		text-align: left;
	}
	.board_table tr:nth-child(1) { /* 제목표시줄 */
		background-color: white;
		height: 35px;
		font-weight: bolder;
	}

	.new {
			padding: 0px 5px;
			color: orangered;
			font-weight: bold;
			animation-name: twinkle;  /*설정할 애니메이션 이름*/
			animation-iteration-count: infinite; /*애니메이션의 반복 횟수*/
			animation-duration: 1s; /*애니메이션의 실행시간*/
		}

		@keyframes twinkle {
			0% {opacity: 0;}
			100% {opacity: 1;}

			from {opacity: 0;}
			to {opacity: 1;}
		}




		/*아이콘 스타일*/
		.list_content_search_btn {
		    
		    width: 44px;
		    height: 44px;
		    cursor: pointer;
		    /* color: black; */
		    /* border-top-right-radius: 2px; */
		    /* border-bottom-right-radius: 2px; */
		    outline: none;
		    border: none;
			}
		.list_content_search_btn:hover {
			background-color: #3c3c3c;
			color: #f1f1f1;
			outline: none;
		}
		

		
/*■■■■ 폰트 애니메이션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/	
	.ani {
	  /*-webkit-animation-name: movingPara;
        -webkit-animation-duration: 1s; */
        animation-name: movingPara;
        animation-duration: 1s;
        }
     @keyframes movingPara {
        from {	transform: translateX(500px);
	        	color:#00000000;} 
	        
        to {	transform: translateX(0px);
        		color: black;}
    }
    

</style>




</head>
<body>
	<!-- 날짜나오는 것의 포맷을 바꾼다 -->
	<!-- 자바유틸 데이터를 now 라고 이름짓고, 포맷을 바꾼다, 바꾼녀석의 이름은 today -->
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
								<!-- mm을 대문자로 써야한다 -->

		<div class="board_wrap">
			<div class="board_head">
				<span class="header_text">쪽지</span>
			</div>
			
		

		<table class="board_table">
			<tr>
				<td style="width: 10%">쪽지번호</td>
				<td style="width: 10%">보낸사람</td>
				<td style="width: 10%">받는사람</td>
				<td>내용</td>
				<td style="width: 10%">작성날짜</td>
			</tr>
 		

			<c:forEach items="${note_View}" var="showDTO">
			<fmt:formatDate value="${showDTO.note_regdate}" pattern="yyyy-MM-dd" var="regdate"/>
			
					<tr>
						<td>${showDTO.nno}</td>
						<td>${showDTO.send_id}</td>
						<td>${showDTO.receive_id}</td>
						<td>${showDTO.note_content}</td>
					 	<td>
							<c:choose>
								<c:when test="${today == regdate}">
									<fmt:formatDate value="${showDTO.note_regdate}" pattern="HH:mm:ss"/>
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${showDTO.note_regdate}" pattern="yyyy-MM-dd"/>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
			</c:forEach>
		</table>
		
		
					<form class="form_send"><%-- ajax 로 리플 입력데이터를 전송하기 위한 form 태그 (name=""이 전달한다)--%>
						
						<%-- hidden은 태그만 안보이지 값이 있음 ,사용자 접속정보를 전달하기위해 작성 --%>
						<%--view.jsp 에서 ajax가 처리함--%>
						<input type="hidden" name="writer" class="reply_writer">
						
							<div>■쪽지 보내기■</div>
							<div>
								받을사람 ID: <input type="text" id="send_id" value="leedaekun">
							</div>
							<div>
								보내는사람 ID: <input type="text" id="Receive_id" value="kenisia">
							</div>
							<div>
								내용작성<textarea class="note_textarea" placeholder="내용을 입력하세요." id="note_content"></textarea>
								
								<a href="#"  class="send_btn" >
									<i class="fas fa-comment"></i>전송하기
								</a>
							</div>
					</form>
				
		
		

	</div> <!-- board_wrap -->
</body>

<script type="text/javascript">
	$(function(){ // 문서가 로드가되면
		
		
		$(document).on('click', '.send_btn', function(){
			var note_textarea = $('.note_textarea').val();  //텍스트 에리어에 적은 댓글을 var에 저장
			alert(note_textarea);
			
			//■■■쪽지 내용없을시 경고 출력■■■
			if(note_textarea == '' || note_textarea.length == 0) {
				$('.note_textarea').focus();  //댓글버튼 누르면 포커스를 에리어로 이동
				alert("내용을 작성해주세요!")
				/* $('.err_msg').css('visibility', 'visible'); */
				return false;
			}
			
			//인풋창의 벨류값을 변경
			/* $('.note_writer').val('${name}'); */
			
			
			//Mapper에 전송할 내용 send_id, Receive_id, note_content   (3개의 인풋의 데이터가 여기에 들어와야함)
			var send_id = $('#send_id').val();
			var Receive_id = $('#Receive_id').val();
			var note_content = $('#note_content').val();
			$.ajax({
				url: '${path}/note/send', // url을 어디로 날릴거냐면 (post 방식으로 URL 호출)
				type: 'POST',
				data: {"send_id":send_id,
					   "Receive_id":Receive_id,
					   "note_content":note_content}, // json 방식으로 데이터 전송방법
														// url갈때 가는 데이터 담아서 보낸다
														// serialize()라는(직렬화라는) 함수를 쓰면 4차선이 1차선으로 바뀐다고 생각하면된다
				success: function() {
					alert('성공!');
					listReply();  // function listReply(){ 호출함
				},
				error: function() {
					alert('실패');
					alert(send_id);
					alert(Receive_id);
					alert(note_content);
					
					}
			
			});  //ajax 종료
			
		}); //send 버튼 클릭시 기능 종료
	});

	
</script>
</html>