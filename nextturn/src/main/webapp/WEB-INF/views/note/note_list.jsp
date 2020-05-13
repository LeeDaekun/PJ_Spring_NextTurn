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


/*■■■■■■ 상단부 (자유게시판 타이틀■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.board_head{
		display: flex;
		align-items: flex-end;
		justify-content: space-between;
	    height: 60px;
	}
	
	.header_text {/*자유게시판 글자*/
    font-size: 35px;
    font-weight: bold;
    margin: 20px 0px 5px 0px;
    
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

	
/*■■■■ 최신순 조회순 댓글순 추천순 div영역 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.orderby_row{
		background-color: #131313;
		padding: 15px 15px;
		margin-top: 5px;
		display: flex;
		justify-content: space-between;  /*양쪽 정렬*/
		align-items: center;	         /* 상하 가운데 정렬*/
		}
	.orderby_btn {
	    padding: 4px 10px;
   		font-size: 13px;
   		color: #f1f1f1;
	}
/*■■■■ 언더라인 애니메이션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.orderby_btn, .insert_btn{
		display: inline-block;

	}
	
	.ani_underline:after {   /*밑줄효과 after 니까 부모 뒤에 오니까 밑으로 내려가서 밑줄이 된다 //before 였으면 윗줄이 된다*/
			content: '';  /* 내용없는상태로 대기 */
			display: block;
			width: 0%; /*가로라인 0% 길이만큼 (호버했을때 길게 늘릴 예정)*/
			height: 1px;  /*두께*/
			background-color: #fff;  /*#fff 흰색*/
			transition: width 0.2s;  /*라인이 0.2초만에 그려짐*/
		    margin: 3px 0px 0px 0px;  /*라인의 위치 수정*/
	}
   
	.ani_underline:hover:after { /*쿨링크에 호버했을때 효과 width 100% 까지 라인 생성*/
			width:100%;
			
	}


/*■■■■ 게시글 등록 버튼 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.insert_btn{
	    padding: 4px 10px;
   		font-size: 15px;
   		color: #f1f1f1;
   		font-weight: lighter;
   		/*background-color: #2080b3;*/
    	border-radius: 10px;
		}



/*■■■■ 테이블 스타일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.board_table{
	    width: 100%;  /*테이블 가로길이*/
		border-spacing: 0px; /*테이블 테두리 제거*/
		background: #f7f7f7;
				
	}
	
	
	.board_table tr td{
		font-size: 12px;
		padding: 10px 0px;

		border-bottom: 1px solid #d0d0d0;
		text-align: center;
	}

	.board_table td:nth-child(3) {
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


/*■■■■ 페이지 영역 (버튼 < 1 2 3 4 >) ■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.page{
		text-align: center;
	    padding: 15px 5px;
	    margin: 15px 0px;
	    
	}
	.page_btn{
		border: 1px solid #939393;
		color: #f1f1f1;
		outline: none; /* 파란색 테두리 사라짐 */
		cursor: pointer;
	}

	.page > a { 	/* 페이지 넘버 */
		padding: 10px 15px;

	}

/*■■■■■■서치바,검색바■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		.list_content_search {
			border: 1px solid #dadada;
			/* border-radius: 10px 0px 0px 10px; */ /*둥근테두리*/
		}

		.list_content_search_input {
		    background-color: transparent;
		    border-color: transparent;
		    height: 44px;
		    font-size: 13px;
		    padding: 10px 10px;
		    outline: none;
			}
			
		.list_search_group {
			display: flex;  /*인라인이나 블록, 인라인블록 등을 보여주는것이 디스플레이 : flex는 정렬방법인데 */
			align-items: center;
			background-color: #f2f3f5;
			border-radius: 2px;
		    width: 225px;
    		height: 45px;
		}
		.search_clear {
			background-color: #f76d6d;;
			color: white;
			padding: 3px 6px;
			border-radius: 10px;
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
		
/* 페이지네이션의 현재 페이지의 숫자 색상*/
		#check_color {
		    color: tomato;
		    font-weight: bold;
		    background-color: white;
		    border-radius: 50px;
		    border: 2px solid #dedede;
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
    
/* 쪽지 작성창 */
	.form_send{
		padding: 5px 10px;
		margin: 10px 0px;
		border : 1px solid black;
		border-radius: 10px;
		display : flex;
		align-items: center;
		background: white;
		}
	
	.form_send input{
		width: 90px;
		}
	
	.form_send2 {
		margin: 0 0 0 30px;
	    display: flex;
	    align-items: center;
		}
		
	
	.note_textarea{
		width: 600px;
		height: 42px;
	    /* border: 0px; */
        resize: none;  /* textarea 사이즈 조정 막기 */
        outline: none; /* textarea 사이즈 조정 막기 */
		}

	.send_btn {
		margin: 0 0 0 10px;
	    padding: 10px;
	    color: white;
	    background-color: #2b2b2b;
	    border-radius: 5px;
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
				<!-- 검색창 -->
				<div>
					<div class="list_content_search">
					<!-- 검색창을 쓸때, 엔터를 눌러서 검색어가 전달되게 하려면 from 태그를 써야한다. // 인풋의 name="keyword"로 -->
						<form name="frm_search" action="" method="GET">
							<div class="list_search_group">
								<input type="text" name="keyword" class="list_content_search_input" placeholder="검색어를 입력하세요" value="${map.keyword}">
								<button type="button" class="list_content_search_btn">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</form>
						
					</div>
				</div>
			</div>
			
			
				
			
			<div class="orderby_row">
				<div>
					<a href="${path}/note/note_list?menu_option=myno" class="orderby_btn ani_underline" id="menu_myno">받은쪽지</a>
					<a href="${path}/note/note_list?menu_option=send" class="orderby_btn ani_underline" id="menu_send">보낸쪽지</a>
				</div>
				
				<div>
					<a href="${path}/---/---" class="insert_btn ani_underline">게시글등록</a>
				</div>
			</div><!-- orderby_row -->
		
					
								
					<form class="form_send"><%-- ajax 로 리플 입력데이터를 전송하기 위한 form 태그 (name=""이 전달한다)--%>
						<div>
							<div>보낸사람: <input type="text" id="send_id" value="kenisia"></div>
							<div>받는사람: <input type="text" id="receive_id" value="leedaekun"></div>
						</div>
						
						<div class="form_send2">
							<span class="textarea_bg">
								<textarea class="note_textarea" placeholder="쪽지를 보내시려면 내용을 입력해주세요" id="note_content"></textarea>
							</span>
							
							<a href="#"  class="send_btn" >
								<i class="fas fa-comment"></i>전송하기
							</a>
						</div>
						
					</form>
				

		<table class="board_table" id="listReply">
			<tr>
				<td style="width: 10%">받는사람</td>
				<td style="width: 10%">보낸사람</td>
				<td>내용</td>
				<td style="width: 20%">보낸날짜</td>
				
			</tr>
 		
			<c:forEach items="${map.list}" var="NoteDTO">
			<fmt:formatDate value="${NoteDTO.note_regdate}" pattern="yyyy-MM-dd" var="regdate"/>
			
			<%-- <c:forEach items="${board_item}" var="NoteDTO"> 처음에 연습한 소스 --%>
					<tr>
						<td>${NoteDTO.receive_id}</td>
						<td>${NoteDTO.send_id}</td>
						<td>${NoteDTO.note_content}</td>
				 	<td>
						<c:choose>
							<%-- 투데이와 레그데이트의 날짜가 같으면, 오늘 올라온 거니까 시간으로 표시하고, 날짜가 다르면, 날짜로 보여줘라 --%>
							<c:when test="${today == regdate}">
								<%-- 오늘 올라온 게시글에 새 게시글 깜빡이기 --%>
								<c:if test="${today == regdate}">
									<span class="new_color new">오늘!</span>
								</c:if>
								<fmt:formatDate value="${NoteDTO.note_regdate}" pattern="HH:mm:ss"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${NoteDTO.note_regdate}" pattern="yyyy-MM-dd"/>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>


		<!-- 페이지 검색 영역 (페이지 네이션)  < 1 2 3 4 5 >-->
		<div class="page">
		<!-- 페이지네이션 :글이 많을 때 다음 글 또는 이전 글, 다음 글 목록 또는 이전 글 목록으로 이동하는 링크를 만듭니다. 이를 페이지네이션(Pagination)이라고 합니다 -->
			
			<!-- 이전페이지, 처음페이지로 이동 (블록이동  1~10번 페이지가 1블록이다) -->
				<c:if test="${map.pager.curBlock > 1}">
					<a href="${path}/note/note_list?curPage=${map.pager.blockBegin-10}" class="page_btn hover_btn board_page board_prev page_left">◀</a>
					<a href="${path}/note/note_list?curPage=1" class="board_page board_prev">1</a>
					<span>...</span>
				</c:if>


			<!-- 페이지내에서 번호를 눌러서 이동  -->
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<a href="${path}/note/note_list?curPage=${num}" class="board_page" id="check_color">${num}</a>
						</c:when>
						<c:otherwise>
							<a href="${path}/note/note_list?curPage=${num}" class="board_page">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
			<!-- 다음페이지, 마지막 페이지로 이동 (블록이동  1~10번 페이지가 1블록이다) -->
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<span>...</span>
				<a href="${path}/note/note_list?curPage=${map.pager.totPage}" class="board_page board_next">${map.pager.totPage}</a>
				<a href="${path}/note/note_list?curPage=${map.pager.blockEnd + 1}" class="page_btn hover_btn board_page board_next page_right">▶</a>
			</c:if>
		</div>



	</div> <!-- board_wrap -->
</body>

<script type="text/javascript">
	$(function(){ // 문서가 로드가되면
		
		
		$(document).on('click', '.send_btn', function(){
			var note_textarea = $('.note_textarea').val();  //텍스트 에리어에 적은 댓글을 var에 저장
			
			//■■■쪽지 내용없을시 경고 출력■■■
			if(note_textarea == '' || note_textarea.length == 0) {
				$('.note_textarea').focus();  //댓글버튼 누르면 포커스를 에리어로 이동
				alert("내용을 작성해주세요!")
				/* $('.err_msg').css('visibility', 'visible'); */
				return false;
			}
			
			//인풋창의 벨류값을 변경
			/* $('.note_writer').val('${name}'); */
			
			
			//Mapper에 전송할 내용 send_id, receive_id, note_content   (3개의 인풋의 데이터가 여기에 들어와야함)
			var send_id = $('#send_id').val();
			var receive_id = $('#receive_id').val();
			var note_content = $('#note_content').val();
			$.ajax({
				url: '${path}/note/send', // url을 어디로 날릴거냐면 (post 방식으로 URL 호출)
				type: 'POST',
				aync:false,
				data: {"send_id":send_id,
					   "receive_id":receive_id,
					   "note_content":note_content}, // json 방식으로 데이터 전송방법
														// url갈때 가는 데이터 담아서 보낸다
														// serialize()라는(직렬화라는) 함수를 쓰면 4차선이 1차선으로 바뀐다고 생각하면된다
				success: function() {
					console.log('성공!');
					listReply(); //성공시 펑션 실행으로 즉시 새로고침
					
				},
				error: function() {
					alert('실패. 콘솔확인하세요');
					console.log(send_id);
					console.log(receive_id);
					console.log(note_content);
					}
			
			});  //ajax 종료
			
		}); //send 버튼 클릭시 기능 종료
	});

	
	// 댓글 목록 출력 함수 (ajax로 URL을 호출하면, 화면전환없이 즉시 바뀜)
	function listReply(){
		$.ajax({
			type: "get",
			async: false, // 비동기 전송 방식을 동기로 바꿔준다(비동기 방식은 동시에 처리) false 는 순차적처리, ture는 동시처리
			url: "${path}/note/note_list",  //해당 게시물을 다시 출력함 
			success: function(){  	//result : 바로위 url을 실행했을때, 컨트롤러에서 리턴받은 값이 result가 됨 (/board/commentlist2 이것이다)
				 location.reload(); //새로 띄울 페이지 (새로고침)
			}
		});
	}
	
	
	$(function(){
		var menu_option = '${map.menu_option}';  /* 해쉬맵을 받아옴 */
		console.log(menu_option);
		if(menu_option != null) {  //쿼리스트링 어떤거로 접속했느냐에 따라, 메뉴를 노란색으로 표시
			$('#menu_' + menu_option).css('color', '#f3ca00');
			$('#menu_' + menu_option).css('font-weight', 'bold');
			$('.ani_underline:after').css('background-color', 'yellow');
			
		}
		if(menu_option == 'myno'){
			$('.board_table td:nth-child(1)').css('color', 'blue');
		}else{
			$('.board_table td:nth-child(2)').css('color', 'blue');
		}
	});
</script>
</html>