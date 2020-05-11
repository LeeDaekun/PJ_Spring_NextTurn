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
 		
			<!-- formatDate 포맷해서 regdate 를 만들었음 -->
			<!-- 위에 시계날짜랑 같으면, 시간으로 나오고, 다르면 날짜로 나온다 -->
			<!-- regdate 를 년월일 만 뜨도록 바꾸는거다 showDTO의 자료가 아니고 새로 만든자료임-->
			<c:forEach items="${note_View}" var="showDTO">
			<fmt:formatDate value="${showDTO.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
			
			<%-- <c:forEach items="${board_item}" var="showDTO"> 처음에 연습한 소스 --%>
					<tr>
						<td>${note_View.nno}</td>
						<td>${note_View.send_id}</td>
						<td>${note_View.Receive_id}</td>
						<td>${note_View.note_content}</td>
					 	<td>
							<c:choose>
								<%-- 투데이와 레그데이트의 날짜가 같으면, 오늘 올라온 거니까 시간으로 표시하고, 날짜가 다르면, 날짜로 보여줘라 --%>
								<c:when test="${today == regdate}">
									<fmt:formatDate value="${showDTO.regdate}" pattern="HH:mm:ss"/>
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${showDTO.regdate}" pattern="yyyy-MM-dd"/>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
			</c:forEach>
			
			
		</table>


	</div> <!-- board_wrap -->
</body>

<script type="text/javascript">
	$(function(){
		var sort_option = '${map.sort_option}';  /* 해쉬맵을 받아옴 */
		
		if(sort_option != null) {
			$('#sort_' + sort_option).css('color', '#f3ca00');
			$('#sort_' + sort_option).css('font-weight', 'bold');
			$('.ani_underline:after').css('background-color', 'yellow');
		}
	    		
		$('.write_btn').click(function(){
			location.href="/metop/board/write";
		});
	});
</script>
</html>