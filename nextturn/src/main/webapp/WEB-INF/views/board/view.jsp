<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>

	<title>board</title>
	 <!-- 폰트어썸 아이콘 사용 스크립트 --> 
	<script src="https://kit.fontawesome.com/fc5ae9294d.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">

<style type="text/css">
/*  	div, span, table, tr, td, a{
	border: 1px solid green
}  */

	.view_wrap {
		width: 900px;
		height: 800px;
		margin: 30px auto;
	}


/*■■■■■■ 상단부 (자유게시판 타이틀■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.board_title{
		display: flex;
		align-items: center;
		justify-content: space-between;
		background-color: #151515;
		color: white;
		padding: 5px 15px;
		font-size: 15px;
	}
	
	.board_head span {/*자유게시판 글자*/
	    font-size: 35px;
	    font-weight: bold;
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



/*■■■■ 언더라인 애니메이션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.orderby_btn, .insert_btn{
		display: inline-block;

	}
	
	.ani_underline:after {   /*밑줄효과 after 니까 부모 뒤에 오니까 밑으로 내려가서 밑줄이 된다 //before 였으면 윗줄이 된다*/
			
			content: '';
			display: block;
			width: 0%; /*가로라인 0% 길이만큼 (호버했을때 길게 늘릴 예정)*/
			height: 1px;  /*두께*/
			background-color: #fff;
			transition: width 0.2s;  /*라인이 0.2초만에 그려짐*/
	}
	.ani_underline:hover:after { /*쿨링크에 호버했을때 효과 width 100% 까지 라인 생성*/
			width:100%;

	}


	/*제목부=================================================*/
		.view_title{
		    font-size: 26px;
		    font-weight: bold;
		}
		.community_icon{
		    display: flex;
		    justify-content: center;
		    align-items: flex-end;
		}
		.community_icon i{
			font-size: 20px;
		    padding: 10px 0px 0px 30px;
	        color: #565656;
		}
		
		.padding{ display: flex;}
		.padding > div {
		    padding: 5px 25px 0px 0px;
		}


	/* 내용부================================================ */
		.view_header{
		    width: 900px;
		    background: white;
		    display: flex;
			justify-content: space-between;
			padding: 10px;
			border-bottom: 2px solid #c7c7c7;
		}
		.view_content {
		    background-color: white;
		    margin: 7px 0px 0px 0px;
		    padding: 25px 25px;
		}
	

		.down_menu_btn{
			padding: 7px 20px;
		    border-radius: 10px;
		    color: white;
		    font-weight: bold;
		    border: 0;
		}
		.color_btn_orderby {
		    display: flex;
		    justify-content: flex-end;
		    margin: 40px 0px 15px 0px;
		}

	/* 댓글 입력부================================================== */
		.reple_wrap {
		    display: flex;
		    justify-content: center;
		}
		.reple_wrap i{
			font-size: 40px;
		}
		.textarea_bg{
		    border: 1px solid black;
		    width: 100%;
		    padding: 5px 5px;
		    border-radius: 10px;
		}

		.reply_btn {
		    margin: 0 0 0 10px;
		    padding: 10px;
		    height: 90px;
		    width: 115px;
		    color: white;
		    text-align: center;
		    display: grid;
		    align-items: center;
		    background-color: #2b2b2b;
		    border-radius: 5px;
		}
		
		
		.err_msg { /*필수 정보입니다  입력안했을때 나오게 할것*/
			display: block;
			margin: 9px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			color: red;
			height: 15px;
			/*display: none;*/ /*none으로 하면 공간까지 사라지니.hidden 으로*/
			visibility: hidden;
			text-align: end;
		}

</style>




</head>
<body>
	<%@ include file="../include/modal.jsp" %>
		<div class="view_wrap">
			<!-- 상단부 -->
			<div class="view_head">
				<a href="${path}/board/list"><span class="board_title">자유게시판</span></a>
			</div>
		
			<div>
				<div class="view_header">
					
					<div>
						<span class="view_title">${bDto.title}</span> <!-- 게시글제목 -->
						<div class="padding">
							<div>${bDto.bno}</div><!-- 게시글번호 -->
							<div>작성자 ${bDto.writer}</div><!-- 작성자 -->
							<div>조회수 ${bDto.viewcnt}</div><!-- 조회수 -->
							
							
							
							<div>
								<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="regdate"/>작성일: ${regdate}
							</div><!-- 시간 -->
							
							<c:if test="${bDto.regdate != bDto.updateDate}">
								 <fmt:formatDate value="${bDto.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/> 수정됨
							</c:if>
							
						</div>
					</div>

					<div class="community_icon">
						<a href="#"><i class="fas fa-comments">${bDto.replycnt}</i></a><!-- 댓글수 -->
						<a href="#"><i class="fas fa-thumbs-up">-</i></a><!-- 좋아요 -->
						<a href="#"><i class="fas fa-thumbs-down">-</i></a><!-- 싫어요 -->
					</div>
						
				</div>
				
			</div>	

			<!-- 컨텐츠 -->
			<div class="view_content">
				<div>
					${bDto.content}
				</div>

			
				<div class="color_btn_orderby">
			
					<div>
						<!-- <a href="${path}/board/list" class="down_menu_btn" style="background: #27AE60">목록</a> -->
						<!-- <a href="${header.referer}" class="down_menu_btn" style="background: #27AE60">목록</a> --%> <!-- referer은 방금 전페이지로 되돌림 (비정상 페이지로 되돌아가기도함)-->
						<button type=button class="down_menu_btn" id="list_btn" style="background: #27AE60">목록</button>
						<a href="" class="down_menu_btn" style="background: #3498DB">답변</a>
	
							<!-- 로그인 유저랑, 작성자가 같을때만 띄우는 버튼 -->	
					<c:if test="${name == bDto.writer}">	
						<a href="${path}/board/update?bno=${bDto.bno}" class="down_menu_btn" style="background: #F39C12">수정</a>
						<a href="#" class="down_menu_btn" id="delete_btn" style="background: #C0392B">삭제</a>
					</c:if>
					
					</div>
				</div>



			
			
			</div> <!-- 컨텐츠공간 닫기 -->
			
			
			
			<!-- 댓글달린 목록 출력 -->
			<div id="listReply"></div>


		
			

		

	</div> <!-- view_wrap -->
</body>
<script type="text/javascript">
	
	//view 페이지가 실행되면, 댓글.jsp 를 무조건 띄우세요
	//$(document).ready(function(){			});
	$(function(){
		var refresh_sec = 600000;  //60000=1분  , 600000 = 10분, 6000000=1시간
		setInterval(refreshReply, refresh_sec); // setInterval = JS에 내장된함수
		
		function refreshReply() {
			console.log('댓글 자동 새로고침 간격: '+refresh_sec/1000+'초');
			listReply();  //댓글 출력함수
		}
		
		
//		alert('이전 URL: ${header.referer}');
		listReply(); // 페이지가 시작되자마자 이녀석을 호출하세요
		
		//삭제버튼 클릭시 알림 모달창 열림
		//$(document).on('click', '#delete_btn', function(){  도큐먼트는 중복되면 에러
		$('#delete_btn').on('click', function(){
			$('.basic_modal_wrap').css('display', 'flex');
		});
		
		// 삭제 알림 모달창에서 '확인'버튼 Click -> 게시글 삭제
		$('.y_btn').click(function(){
			alert('test');
			location.href='${path}/board/delete?bno=${bDto.bno}';
		});
		
		
							
	});  //도큐먼트 레디 펑션 종료
	
	
		
		$(document).on('click', '.reply_btn', function(){	//문서에서 reply_btn이 클릭되면
			var reply_text = $('.reply_textarea').val();  //텍스트 에리어에 적은 댓글을 var에 저장
			alert(reply_text);
			
			if(reply_text == '' || reply_text.length == 0) {
				$('.reply_textarea').focus();  //댓글버튼 누르면 포커스를 에리어로 이동
				$('.err_msg').css('visibility', 'visible');
				return false;
			}
			
			$('.reply_bno').val('${bDto.bno}');  //bno태그에 벨류어블 값을 집어넣는다.
			$('.reply_type').val('${bDto.type}');
			$('.reply_writer').val('${name}');
		
			$.ajax({
				url: '${path}/reply/insert', // url을 어디로 날릴거냐면 (post 방식으로 URL 호출)
				type: 'POST',
				data: $('.frm_reply').serialize(),	// serialize()라는 함수를 쓰면 데이터가 직렬해서 날아간다
													// url갈때 가는 데이터 담아서 보낸다
													// serialize()라는(직렬화라는) 함수를 쓰면 4차선이 1차선으로 바뀐다고 생각하면된다
				//seriallize 를 안쓴다면 어떻게 데이터를 써야하나?
				//data: {"bno"bno, "type":type, "writer: name, "content}
													
				success: function() {
					alert('성공!');
					listReply();  // function listReply(){ 호출함
				},
				error: function() {
					alert('실패');
				}
			});
		});
		 
		// 새로운 댓글 확인하기 버튼 클릭시
		$(document).on('click', '.reply_refresh_btn', function(){
			listReply();
		});	
	
		 /* 댓글 삭제버튼 눌렀을때 동작(댓글 삭제하기) */
 		$(document).on('click','.reply_del_btn',function(){
 			var rno = $(this).attr('data_num');  //이 클래스에 있는 data_num에 들어있는 값을 rno에 담음
 			var bno = ${bDto.bno};
 			alert(rno+"///"+bno);
 			
 			$.ajax({
 				type: "POST",
 				url: '${path}/reply/delReply',  //컨트롤러 호출
 				data: {'rno':rno, 'bno':bno },
 				success: function() {
 					listReply(); //댓글창 ajax로 새로고침
 				}
			});
 		});
 			
 		
		 /* 처음에 이렇게 했었음 댓글 삭제하는 코드
		 $(document).on('click', '.reply_del_btn', function(){
 			var rno = $(this).prev().val(); 
 		 
			alert('삭제버튼 동작 '+rno);
			$.ajax({
				type: "POST",
				url: '${path}/reply/delReply?rno='+rno,
				success: function() {
					listReply();
				}
			});
 		 }); */
		
	


	
	// 댓글 목록 출력 함수 (ajax로 URL을 호출하면, 화면전환없이 즉시 바뀜)
	function listReply(){
		$.ajax({
			type: "get",
			async: false, // 비동기 전송 방식을 동기로 바꿔준다(비동기 방식은 동시에 처리) false 는 순차적처리, ture는 동시처리
			url: "${path}/reply/list?bno=${bDto.bno}",  //해당 게시물을 다시 출력함
			success: function(result){  //result : 바로위 url을 실행했을때, 컨트롤러에서 리턴받은 값이 result가 됨 (/board/commentlist2 이것이다)
				$("#listReply").html(result);  //id="listReply" 에 result인 commentlist.jsp를 출력해라 (인클루드처럼 코멘트리스트를 불러옴)
			}
		});
		
		// 게시글 댓글수 수정!
		$('.fa-comments').text($('.replyListCnt').val());  //코맨트리스트에 댓글 작성된 숫자(select로 찾은수만큼) text를 써줌
	}
	
	//commentlist.jsp 에 적용함 로그인 버튼클릭시 모달창 On
	$(document).on('click', '.reply_login_btn', function(){
		$('.modal_wrap').css('display', 'flex');
	});
	
	
	
	//리퍼럴이 비정상경로일 경우 대처방법 (다른 페이지에서 들어와서 목록을 누를경우 작동 안하는경우 대처)
	$(document).on('click', '#list_btn', function(){  
		var referer = '${header.referer}';  //크롬에서 방금전에 왔던 url 주소를 저장함
		alert("referer:"+referer);
		console.log('이전 URL: '+referer);
		
		var index = referer.indexOf('/board/list');  //이러한 주소가 있었는지 검사
		alert("index:"+index);
		console.log('index: '+referer.indexOf('/board/list'));
		
		if(index == '-1') {
			location.href = '${path}/board/list';  //인덱스가 -1이면 여기로 경로를 이동시킨다(location.href는 a태그 버튼으로는 안먹혔음)
			alert("-1 버정상경로이므로 강제로 리스트로 이동");
		} else {
			alert("정상이므로"+referer+"여기로 빠꾸");
			location.href = '${header.referer}';  //-1이 아니면, 바로이전의 리퍼럴로 이동시킴(location.href는 a태그 버튼으로는 안먹혔음)
			
			
		}
	});

	
</script>
</html>